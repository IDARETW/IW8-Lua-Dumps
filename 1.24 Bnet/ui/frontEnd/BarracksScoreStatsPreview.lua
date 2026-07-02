module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Ranked)
	local var_1_1 = var_1_0.playerStats.bestStats.killStreak:get()
	local var_1_2 = var_1_0.playerStats.combatStats.kdRatio:get()
	local var_1_3 = LUI.Round(var_1_2, 2)
	local var_1_4 = var_1_0.globalSPM:get()

	arg_1_0.StreakStats.Value:setText(var_1_1)
	arg_1_0.KDStats.Value:setText(var_1_3)
	arg_1_0.ScoreStats.Value:setText(var_1_4)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetData = var_0_0

	var_0_0(arg_2_0, arg_2_1)
end

function BarracksScoreStatsPreview(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1200 * _1080p, 0, 225 * _1080p)

	var_3_0.id = "BarracksScoreStatsPreview"

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

	var_3_6.id = "KillstreakIcon"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_6:SetAlpha(0.25, 0)
	var_3_6:setImage(RegisterMaterial("icon_killstreaks"), 0)
	var_3_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -1139, _1080p * -883, _1080p * -128.5, _1080p * 127.5)
	var_3_0:addElement(var_3_6)

	var_3_0.KillstreakIcon = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "BulletIcon"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_8:SetAlpha(0.25, 0)
	var_3_8:setImage(RegisterMaterial("icon_bullets"), 0)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -246, _1080p * 266, _1080p * -133.5, _1080p * 122.5)
	var_3_0:addElement(var_3_8)

	var_3_0.BulletIcon = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "SniperIcon"

	var_3_10:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_10:SetAlpha(0.25, 0)
	var_3_10:setImage(RegisterMaterial("icon_sniper"), 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 902, _1080p * 1158, _1080p * -128.5, _1080p * 127.5)
	var_3_0:addElement(var_3_10)

	var_3_0.SniperIcon = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("BarracksStatBox", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "ScoreStats"

	var_3_12.Value:setText("9999", 0)
	var_3_12.Description:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/PER_MINUTE")), 0)
	var_3_12.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/SCORE")), 0)
	var_3_12:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -375, _1080p * -21, _1080p * -26.5, _1080p * 73.5)
	var_3_0:addElement(var_3_12)

	var_3_0.ScoreStats = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("BarracksStatBox", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "KDStats"

	var_3_14.Value:setText("9999", 0)
	var_3_14.Description:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/RATIO")), 0)
	var_3_14.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/KDRATIO")), 0)
	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -187, _1080p * 167, _1080p * -26.5, _1080p * 73.5)
	var_3_0:addElement(var_3_14)

	var_3_0.KDStats = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("BarracksStatBox", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "StreakStats"

	var_3_16.Value:setText("9999", 0)
	var_3_16.Description:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/HIGHEST_EARNED")), 0)
	var_3_16.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/KILLSTREAK_CAPS")), 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 15, _1080p * 369, _1080p * -26.5, _1080p * 73.5)
	var_3_0:addElement(var_3_16)

	var_3_0.StreakStats = var_3_16

	local var_3_17
	local var_3_18 = MenuBuilder.BuildRegisteredType("BarracksHeader", {
		controllerIndex = var_3_1
	})

	var_3_18.id = "BarracksHeader"

	var_3_18.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/SCORE_STATS_PREVIEW_TITLE"), 0)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 382, _1080p * 818, 0, _1080p * 40)
	var_3_0:addElement(var_3_18)

	var_3_0.BarracksHeader = var_3_18

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BarracksScoreStatsPreview", BarracksScoreStatsPreview)
LockTable(_M)
