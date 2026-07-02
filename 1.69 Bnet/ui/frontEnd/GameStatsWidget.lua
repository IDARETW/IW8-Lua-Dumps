module(..., package.seeall)

AVERAGETRACKERTHICKNESS = 2

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = 0
	local var_1_1 = -1

	for iter_1_0 = 1, #arg_1_1 do
		var_1_0 = var_1_0 + tonumber(arg_1_1[iter_1_0])

		if var_1_1 < arg_1_1[iter_1_0] then
			var_1_1 = arg_1_1[iter_1_0]
		end
	end

	local var_1_2 = RECORDS.GetNumberOfPlayerMatches(arg_1_0._controllerIndex)

	if var_1_2 >= 5 then
		var_1_2 = 5
	end

	local var_1_3 = var_1_0 / var_1_2

	arg_1_0.AverageIndicatorLeft.AvgText:setText(string.format("%.2f", var_1_3))

	if var_1_3 > 0 then
		local var_1_4 = (var_1_1 - var_1_3) / var_1_1 * arg_1_0.height

		arg_1_0.AverageTracker:SetTop(var_1_4 + AVERAGETRACKERTHICKNESS / 2)
		arg_1_0.AverageTracker:SetBottom(var_1_4 - AVERAGETRACKERTHICKNESS / 2)
		arg_1_0.AverageIndicatorLeft:SetTop(var_1_4 - arg_1_0._indicatorHeight / 2)
		arg_1_0.AverageIndicatorLeft:SetBottom(var_1_4 + arg_1_0._indicatorHeight / 2)
	else
		arg_1_0.AverageTracker:SetAlpha(0)
		arg_1_0.AverageIndicatorLeft:SetAlpha(0)
	end

	for iter_1_1 = 1, #arg_1_0._Bars do
		local var_1_5 = tonumber(arg_1_1[iter_1_1])
		local var_1_6 = arg_1_0._Bars[iter_1_1]

		var_1_6.Label:setText(Engine.JCBDICCAH(string.format("%.2f", var_1_5)))

		if var_1_5 <= 0 then
			var_1_6:SetTop(arg_1_0.height - arg_1_0.backerHeight)
		else
			local var_1_7 = (var_1_1 - var_1_5) / var_1_1
			local var_1_8 = math.min(arg_1_0.height - arg_1_0.backerHeight, var_1_7 * arg_1_0.height)

			var_1_6:SetTop(var_1_8)
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateGameStatBars = var_0_0
	arg_2_0._controllerIndex = arg_2_1

	local var_2_0, var_2_1, var_2_2, var_2_3 = arg_2_0:getLocalRect()
	local var_2_4, var_2_5, var_2_6, var_2_7 = arg_2_0.AverageIndicatorLeft:getLocalRect()
	local var_2_8, var_2_9, var_2_10, var_2_11 = arg_2_0.LastMatchBar.Backer:getLocalRect()

	arg_2_0.backerHeight = var_2_11 - var_2_9
	arg_2_0.height = var_2_3 - var_2_1
	arg_2_0._indicatorHeight = var_2_7 - var_2_5
	arg_2_0._Bars = {
		arg_2_0.LastMatchBar,
		arg_2_0.Match2Bar,
		arg_2_0.Match3Bar,
		arg_2_0.Match4Bar,
		arg_2_0.Match5Bar
	}
	arg_2_0._Labels = {
		arg_2_0.LastMatchBar.MatchLabel,
		arg_2_0.Match2Bar.MatchLabel,
		arg_2_0.Match3Bar.MatchLabel,
		arg_2_0.Match4Bar.MatchLabel,
		arg_2_0.Match5Bar.MatchLabel
	}

	arg_2_0._Labels[1]:setText(Engine.CBBHFCGDIC("LUA_MENU/LAST_MATCH"))

	for iter_2_0 = 2, #arg_2_0._Labels do
		arg_2_0._Labels[iter_2_0]:setText(Engine.CBBHFCGDIC("LUA_MENU/MATCH_NUM", iter_2_0))
	end
end

function GameStatsWidget(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1210 * _1080p, 0, 300 * _1080p)

	var_3_0.id = "GameStatsWidget"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_3_4:SetAlpha(0.4, 0)
	var_3_4:SetPixelGridEnabled(true)
	var_3_4:SetPixelGridContrast(0.5, 0)
	var_3_4:SetPixelGridBlockWidth(2, 0)
	var_3_4:SetPixelGridBlockHeight(2, 0)
	var_3_4:SetPixelGridGutterWidth(1, 0)
	var_3_4:SetPixelGridGutterHeight(1, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "AvgLabel"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/AVG"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_6:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -180, _1080p * -45, _1080p * 5, _1080p * 33)
	var_3_0:addElement(var_3_6)

	var_3_0.AvgLabel = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("GameStatBar", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "LastMatchBar"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 845, _1080p * 965, 0, _1080p * 300)
	var_3_0:addElement(var_3_8)

	var_3_0.LastMatchBar = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("GameStatBar", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "Match2Bar"

	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 645, _1080p * 765, 0, _1080p * 300)
	var_3_0:addElement(var_3_10)

	var_3_0.Match2Bar = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("GameStatBar", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "Match3Bar"

	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 445, _1080p * 565, 0, _1080p * 300)
	var_3_0:addElement(var_3_12)

	var_3_0.Match3Bar = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("GameStatBar", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "Match4Bar"

	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 245, _1080p * 365, 0, _1080p * 300)
	var_3_0:addElement(var_3_14)

	var_3_0.Match4Bar = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("GameStatBar", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "Match5Bar"

	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 45, _1080p * 165, 0, _1080p * 300)
	var_3_0:addElement(var_3_16)

	var_3_0.Match5Bar = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIImage.new()

	var_3_18.id = "AverageTracker"

	var_3_18:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_18:SetAlpha(0.6, 0)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 1076, _1080p * 149, _1080p * 151)
	var_3_0:addElement(var_3_18)

	var_3_0.AverageTracker = var_3_18

	local var_3_19
	local var_3_20 = MenuBuilder.BuildRegisteredType("AverageIndicatorLeft", {
		controllerIndex = var_3_1
	})

	var_3_20.id = "AverageIndicatorLeft"

	var_3_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -180, _1080p * -45, _1080p * 132, _1080p * 168)
	var_3_0:addElement(var_3_20)

	var_3_0.AverageIndicatorLeft = var_3_20

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("GameStatsWidget", GameStatsWidget)
LockTable(_M)
