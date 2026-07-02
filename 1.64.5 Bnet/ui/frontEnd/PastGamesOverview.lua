module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_2.aggregateData

	for iter_1_0 = 1, #arg_1_0._Boxes do
		arg_1_0._Boxes[iter_1_0].BarracksHeader.Title:setText(Engine.CBBHFCGDIC(var_1_0[iter_1_0].title))
		arg_1_0._Boxes[iter_1_0].Stat:setText(Engine.JCBDICCAH(var_1_0[iter_1_0].score))
		arg_1_0._Boxes[iter_1_0]:SetAlpha(1)
	end

	ACTIONS.AnimateSequence(arg_1_0.KDBox, "TotalEnemies")
	arg_1_0.KDBox.BarracksHeader.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/TOTAL_FIVE_GAMES"))
	arg_1_0.KDBox.StatLabel:setText(Engine.CBBHFCGDIC(var_1_0[3].title))
	arg_1_0.KDBox.Stat:setText(Engine.JCBDICCAH(var_1_0[3].score))
	arg_1_0.KDBox.SecondStatLabel:setText(Engine.CBBHFCGDIC(var_1_0[4].title))
	arg_1_0.KDBox.SecondStat:setText(Engine.JCBDICCAH(var_1_0[4].score))
	arg_1_0.KDBox.SubStatLabel:setText(Engine.CBBHFCGDIC(var_1_0[5].title))
	arg_1_0.KDBox.SubStat:setText(Engine.JCBDICCAH(var_1_0[5].score))
	arg_1_0.GameStatsWidget:UpdateGameStatBars(arg_1_2.gameData)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.ProcessData = var_0_0
	arg_2_0._Boxes = {
		arg_2_0.Box1,
		arg_2_0.Box2
	}
end

function PastGamesOverview(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1210 * _1080p, 0, 670 * _1080p)

	var_3_0.id = "PastGamesOverview"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("CombatRecordStatBox", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Box1"

	var_3_4.BarracksHeader.Title:setText(ToUpperCase(""), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 390, _1080p * -160, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Box1 = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("CombatRecordStatBox", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "Box2"

	var_3_6.BarracksHeader.Title:setText(ToUpperCase(""), 0)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -195, _1080p * 195, _1080p * -160, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.Box2 = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "DoubleNotchedBacker"

	var_3_8:SetAlpha(0.5, 0)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 450)
	var_3_0:addElement(var_3_8)

	var_3_0.DoubleNotchedBacker = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("GameStatsWidget", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "GameStatsWidget"

	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1210, _1080p * 89, _1080p * 389)
	var_3_0:addElement(var_3_10)

	var_3_0.GameStatsWidget = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("CombatRecordMultipleStatBox", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "KDBox"

	var_3_12.BarracksHeader.Title:setText(ToUpperCase(""), 0)
	var_3_12:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -390, 0, _1080p * -160, 0)
	var_3_0:addElement(var_3_12)

	var_3_0.KDBox = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "MapNameHeader"

	var_3_14.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/KD_RATIO"), 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 475, 0, _1080p * 46)
	var_3_0:addElement(var_3_14)

	var_3_0.MapNameHeader = var_3_14

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("PastGamesOverview", PastGamesOverview)
LockTable(_M)
