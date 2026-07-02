module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0.NATType then
		if not Engine.CAADCDEEIA() then
			local var_1_0 = NetworkInfo.DGDAAFJDBI()

			if OPTIONS.natTypeUILabels[var_1_0] == nil then
				netdiagNat = "unknown"
			end

			arg_1_0.NATType:setText(Engine.CBBHFCGDIC("LUA_MENU/YOURNATTYPE", OPTIONS.natTypeUILabels[var_1_0]))
		else
			arg_1_0.NATType:setText(Engine.CBBHFCGDIC("NULL/EMPTY"))
		end
	end

	local var_1_1 = OPTIONS.FirstPartyServersLabel()

	if arg_1_0.FirstPartyServer then
		if NetworkInfo.DDADIHAFHH() then
			arg_1_0.FirstPartyServer:setText(Engine.CBBHFCGDIC("LUA_MENU/FIRSTPARTY_CONNECTED", var_1_1))
		else
			arg_1_0.FirstPartyServer:setText(Engine.CBBHFCGDIC("LUA_MENU/FIRSTPARTY_NOT_CONNECTED", var_1_1))
		end
	end

	if arg_1_0.ConnectedTo then
		if NetworkInfo.FIDJJHHCA() == true then
			arg_1_0.ConnectedTo:setText(Engine.CBBHFCGDIC("LUA_MENU/DEMONWARE_CONNECTED"))
		else
			arg_1_0.ConnectedTo:setText(Engine.CBBHFCGDIC("LUA_MENU/DEMONWARE_NOT_CONNECTED"))
		end
	end

	if arg_1_0.Bandwith then
		local var_1_2 = NetworkInfo.HGEFAEJCE()

		arg_1_0.Bandwith:setText(Engine.CBBHFCGDIC("LUA_MENU/BANDWIDTH", var_1_2))
	end

	if arg_1_0.ConnectionType then
		if NetworkInfo.DCFDACAGBG() == true then
			arg_1_0.ConnectionType:setText(Engine.CBBHFCGDIC("LUA_MENU/CONNECTION_TYPE_WIRELESS"))
		else
			arg_1_0.ConnectionType:setText(Engine.CBBHFCGDIC("LUA_MENU/CONNECTION_TYPE_WIRED"))
		end
	end
end

function NetworkInfosList(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalStackedLayout.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 200 * _1080p)

	var_2_0.id = "NetworkInfosList"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:SetSpacing(10 * _1080p)

	local var_2_3
	local var_2_4 = LUI.UIText.new()

	var_2_4.id = "FirstPartyServer"

	var_2_4:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_4:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_4:SetTracking(1 * _1080p, 0)
	var_2_4:SetLeading(-3 * _1080p, 0)
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 18)
	var_2_0:addElement(var_2_4)

	var_2_0.FirstPartyServer = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "ConnectedTo"

	var_2_6:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_6:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_6:SetTracking(1 * _1080p, 0)
	var_2_6:SetLeading(-3 * _1080p, 0)
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 28, _1080p * 46)
	var_2_0:addElement(var_2_6)

	var_2_0.ConnectedTo = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIText.new()

	var_2_8.id = "NATType"

	var_2_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_8:SetTracking(1 * _1080p, 0)
	var_2_8:SetLeading(-3 * _1080p, 0)
	var_2_8:SetAlignment(LUI.Alignment.Left)
	var_2_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 56, _1080p * 74)
	var_2_0:addElement(var_2_8)

	var_2_0.NATType = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIText.new()

	var_2_10.id = "Bandwith"

	var_2_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_10:setText(Engine.CBBHFCGDIC("LUA_MENU/BANDWIDTH"), 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_10:SetTracking(1 * _1080p, 0)
	var_2_10:SetLeading(-3 * _1080p, 0)
	var_2_10:SetAlignment(LUI.Alignment.Left)
	var_2_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 84, _1080p * 102)
	var_2_0:addElement(var_2_10)

	var_2_0.Bandwith = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIText.new()

	var_2_12.id = "ConnectionType"

	var_2_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_12:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_2_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_12:SetTracking(1 * _1080p, 0)
	var_2_12:SetLeading(-3 * _1080p, 0)
	var_2_12:SetAlignment(LUI.Alignment.Left)
	var_2_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 112, _1080p * 130)
	var_2_0:addElement(var_2_12)

	var_2_0.ConnectionType = var_2_12

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("NetworkInfosList", NetworkInfosList)
LockTable(_M)
