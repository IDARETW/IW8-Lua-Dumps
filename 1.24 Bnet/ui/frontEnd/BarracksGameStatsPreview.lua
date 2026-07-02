module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Ranked).playerStats.matchStats
	local var_1_1 = var_1_0.timePlayedTotal:get()
	local var_1_2 = var_1_0.gamesPlayed:get()
	local var_1_3 = math.floor(var_1_1 / 86400)
	local var_1_4 = var_1_1 % 86400
	local var_1_5 = math.floor(var_1_4 / 3600)
	local var_1_6 = var_1_4 % 3600
	local var_1_7 = math.floor(var_1_6 / 60)

	arg_1_0.TimeStats.Days:setText(var_1_3)
	arg_1_0.TimeStats.Hours:setText(var_1_5)
	arg_1_0.TimeStats.Minutes:setText(var_1_7)
	arg_1_0.GameCountStats.Value:setText(var_1_2)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetData = var_0_0

	var_0_0(arg_2_0, arg_2_1)
end

function BarracksGameStatsPreview(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 450 * _1080p)

	var_3_0.id = "BarracksGameStatsPreview"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "DoubleNotchedBacker"

	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.DoubleNotchedBacker = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "WatchIcon"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_6:SetAlpha(0.25, 0)
	var_3_6:setImage(RegisterMaterial("icon_watch"), 0)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -118, _1080p * 138)
	var_3_0:addElement(var_3_6)

	var_3_0.WatchIcon = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("BarracksStatBox", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "GameCountStats"

	var_3_8.Value:setText("", 0)
	var_3_8.Description:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/TOTAL_PLAYED")), 0)
	var_3_8.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GAMES_CAPS")), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -20, _1080p * 400, _1080p * 323, _1080p * 423)
	var_3_0:addElement(var_3_8)

	var_3_0.GameCountStats = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("BarracksGameTimeStatBox", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "TimeStats"

	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -189, _1080p * 189, _1080p * 94, _1080p * 224)
	var_3_0:addElement(var_3_10)

	var_3_0.TimeStats = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("BarracksHeader", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "BarracksHeader"

	var_3_12.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/GAME_STATS_PREVIEW_TITLE"), 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 40)
	var_3_0:addElement(var_3_12)

	var_3_0.BarracksHeader = var_3_12

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BarracksGameStatsPreview", BarracksGameStatsPreview)
LockTable(_M)
