module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Ranked).playerStats.matchStats
	local var_1_1 = var_1_0.wins:get()
	local var_1_2 = var_1_0.losses:get()
	local var_1_3 = var_1_0.winLossRatio:get()
	local var_1_4 = LUI.Round(var_1_3, 2)

	arg_1_0.WinStats.Value:setText(var_1_1)
	arg_1_0.LossStats.Value:setText(var_1_2)
	arg_1_0.RatioStats.Value:setText(var_1_4)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetData = var_0_0

	var_0_0(arg_2_0, arg_2_1)
end

function BarracksVictoryStatsPreview(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 450 * _1080p)

	var_3_0.id = "BarracksVictoryStatsPreview"

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

	var_3_6.id = "CrossedKnivesIcon"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_6:SetAlpha(0.25, 0)
	var_3_6:setImage(RegisterMaterial("icon_crossedKnives"), 0)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -109, _1080p * 147)
	var_3_0:addElement(var_3_6)

	var_3_0.CrossedKnivesIcon = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("BarracksStatBox", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "RatioStats"

	var_3_8.Value:setText("", 0)
	var_3_8.Description:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/RATIO")), 0)
	var_3_8.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/WLRATIO")), 0)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -177, _1080p * 177, _1080p * 97, _1080p * 197)
	var_3_0:addElement(var_3_8)

	var_3_0.RatioStats = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("BarracksStatBox", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "LossStats"

	var_3_10.Value:setText("", 0)
	var_3_10.Description:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/TOTAL_NUMBER")), 0)
	var_3_10.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/LOSSES")), 0)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -177, _1080p * 177, _1080p * -30, _1080p * 70)
	var_3_0:addElement(var_3_10)

	var_3_0.LossStats = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("BarracksStatBox", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "WinStats"

	var_3_12.Value:setText("", 0)
	var_3_12.Description:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/TOTAL_NUMBER")), 0)
	var_3_12.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/WINS")), 0)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -177, _1080p * 177, _1080p * -159, _1080p * -59)
	var_3_0:addElement(var_3_12)

	var_3_0.WinStats = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("BarracksHeader", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "BarracksHeader"

	var_3_14.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/VICTORY_STATS_PREVIEW_TITLE"), 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 40)
	var_3_0:addElement(var_3_14)

	var_3_0.BarracksHeader = var_3_14

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BarracksVictoryStatsPreview", BarracksVictoryStatsPreview)
LockTable(_M)
