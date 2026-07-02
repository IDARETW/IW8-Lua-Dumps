module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	return (RECORDS.GetMatchData(arg_1_0, arg_1_1))
end

local function var_0_1(arg_2_0)
	return {
		aggregateData = RECORDS.GetAggregateData(arg_2_0),
		gameData = RECORDS.GetPreviousMatchesKD(arg_2_0)
	}
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.PreviousGameStatsButtons:SetupData(arg_3_0)
	arg_3_0:addEventHandler("update_previous_match_data", function(arg_4_0, arg_4_1)
		assert(arg_4_1.matchCount)

		local var_4_0 = var_0_0(arg_3_1, arg_4_1.matchCount)

		if var_4_0 then
			arg_3_0.LastGameStats:ProcessMatchData(arg_3_1, var_4_0)
		end
	end)
	arg_3_0:addEventHandler("update_overview", function(arg_5_0, arg_5_1)
		local var_5_0 = var_0_1(arg_3_1)

		if var_5_0 then
			arg_3_0.PastGamesOverview:ProcessData(arg_3_1, var_5_0)
		end
	end)
end

function PreviousGamesStats(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIVerticalNavigator.new()

	var_6_0.id = "PreviousGamesStats"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	var_6_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})
	var_6_0.HelperBar.id = "HelperBar"

	var_6_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_6_0.HelperBar:setPriority(10)
	var_6_0:addElement(var_6_0.HelperBar)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("LastGameStats", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "LastGameStats"

	var_6_4:SetAlpha(0, 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 630, _1080p * 1790, _1080p * 216, _1080p * 746)
	var_6_0:addElement(var_6_4)

	var_6_0.LastGameStats = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("PastGamesOverview", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "PastGamesOverview"

	var_6_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1340, _1080p * -130, _1080p * 216, _1080p * 886)
	var_6_0:addElement(var_6_6)

	var_6_0.PastGamesOverview = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("PreviousGameStatsButtons", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "PreviousGameStatsButtons"

	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 516, _1080p * 216, _1080p * 974)
	var_6_0:addElement(var_6_8)

	var_6_0.PreviousGameStatsButtons = var_6_8

	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_6_9 = LUI.UIBindButton.new()

	var_6_9.id = "selfBindButton"

	var_6_0:addElement(var_6_9)

	var_6_0.bindButton = var_6_9

	var_6_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_6_1
		end

		ACTIONS.LeaveMenu(var_6_0)
	end)
	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("PreviousGamesStats", PreviousGamesStats)
LockTable(_M)
