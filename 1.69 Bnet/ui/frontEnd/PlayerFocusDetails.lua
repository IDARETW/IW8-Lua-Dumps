module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local function var_1_0()
		local var_2_0 = arg_1_0:GetDataSource().gamertag:GetValue(arg_1_1)

		if var_2_0 ~= nil then
			arg_1_0.Gamertag:setText(var_2_0)
		end
	end

	arg_1_0.Gamertag:SubscribeToModelThroughElement(arg_1_0, "gamertag", var_1_0)
end

function PlayerFocusDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 825 * _1080p)

	var_3_0.id = "PlayerFocusDetails"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIText.new()

	var_3_4.id = "Gamertag"

	var_3_4:setText("", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1, _1080p * 450, 0, _1080p * 30)
	var_3_0:addElement(var_3_4)

	var_3_0.Gamertag = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "TopStats"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("LUA_MENU/TOP_STATS"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 279, _1080p * 90, _1080p * 114)
	var_3_0:addElement(var_3_6)

	var_3_0.TopStats = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Line"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_3_8:SetAlpha(0.6, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 550, _1080p * 120, _1080p * 121)
	var_3_0:addElement(var_3_8)

	var_3_0.Line = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("PlayerFocusStats", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "Kills"

	var_3_10.StatsImage:setImage(RegisterMaterial("gamemode_team_deathmatch"), 0)
	var_3_10.StatsName:setText(Engine.CBBHFCGDIC("LUA_MENU/STATS_KILLS"), 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 182, _1080p * 133, _1080p * 283)
	var_3_0:addElement(var_3_10)

	var_3_0.Kills = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("PlayerFocusStats", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "KD"

	var_3_12.StatsImage:setImage(RegisterMaterial("gamemode_team_deathmatch"), 0)
	var_3_12.StatsName:setText(Engine.CBBHFCGDIC("LUA_MENU/STATS_KD"), 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 182, _1080p * 362, _1080p * 133, _1080p * 283)
	var_3_0:addElement(var_3_12)

	var_3_0.KD = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("PlayerFocusStats", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "SPM"

	var_3_14.StatsImage:setImage(RegisterMaterial("gamemode_team_deathmatch"), 0)
	var_3_14.StatsName:setText(Engine.CBBHFCGDIC("LUA_MENU/STATS_SPM"), 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 362, _1080p * 542, _1080p * 133, _1080p * 283)
	var_3_0:addElement(var_3_14)

	var_3_0.SPM = var_3_14

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("PlayerFocusDetails", PlayerFocusDetails)
LockTable(_M)
