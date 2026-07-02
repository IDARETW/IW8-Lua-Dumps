module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._menu = arg_1_1
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupData = var_0_0
	arg_2_0._buttons = {
		arg_2_0.LastMatchButton,
		arg_2_0.Match2Button,
		arg_2_0.Match3Button,
		arg_2_0.Match4Button,
		arg_2_0.Match5Button
	}

	arg_2_0.OverviewButton:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		arg_2_0._menu.PastGamesOverview:SetAlpha(1)
		arg_2_0._menu.LastGameStats:SetAlpha(0)
		arg_2_0._menu:processEvent({
			name = "update_overview"
		})
	end)

	local function var_2_0(arg_4_0, arg_4_1)
		arg_2_0._menu.PastGamesOverview:SetAlpha(0)
		arg_2_0._menu.LastGameStats:SetAlpha(1)
		arg_2_0._menu:processEvent({
			name = "update_previous_match_data",
			matchCount = arg_4_0.matchCount
		})
	end

	arg_2_0._buttons[1].Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LAST_MATCH"))

	for iter_2_0 = 1, #arg_2_0._buttons do
		if iter_2_0 > 1 then
			arg_2_0._buttons[iter_2_0].Text:setText(Engine.CBBHFCGDIC("LUA_MENU/MATCH_NUM", iter_2_0))
		end

		arg_2_0._buttons[iter_2_0].matchCount = iter_2_0

		arg_2_0._buttons[iter_2_0]:addEventHandler("button_over", var_2_0)
	end

	local var_2_1 = RECORDS.GetNumberOfPlayerMatches(arg_2_1)

	if var_2_1 >= 0 and var_2_1 < 5 then
		for iter_2_1 = var_2_1 + 1, #arg_2_0._buttons do
			arg_2_0._buttons[iter_2_1]:RemoveFromParent()

			arg_2_0._buttons[iter_2_1] = nil
		end
	end
end

function PreviousGameStatsButtons(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIVerticalList.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 757 * _1080p)

	var_5_0.id = "PreviousGameStatsButtons"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:SetSpacing(20 * _1080p)

	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "OverviewButton"

	var_5_4.Text:SetLeft(_1080p * 20, 0)
	var_5_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OVERVIEW")), 0)
	var_5_4.Text:SetAlignment(LUI.Alignment.Left)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, 0, _1080p * 38)
	var_5_0:addElement(var_5_4)

	var_5_0.OverviewButton = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "LastMatchButton"

	var_5_6.Text:SetLeft(_1080p * 20, 0)
	var_5_6.Text:setText(ToUpperCase(""), 0)
	var_5_6.Text:SetAlignment(LUI.Alignment.Left)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, _1080p * 58, _1080p * 96)
	var_5_0:addElement(var_5_6)

	var_5_0.LastMatchButton = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "Match2Button"

	var_5_8.Text:SetLeft(_1080p * 20, 0)
	var_5_8.Text:setText(ToUpperCase(""), 0)
	var_5_8.Text:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, _1080p * 116, _1080p * 154)
	var_5_0:addElement(var_5_8)

	var_5_0.Match2Button = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "Match3Button"

	var_5_10.Text:SetLeft(_1080p * 20, 0)
	var_5_10.Text:setText(ToUpperCase(""), 0)
	var_5_10.Text:SetAlignment(LUI.Alignment.Left)
	var_5_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, _1080p * 174, _1080p * 212)
	var_5_0:addElement(var_5_10)

	var_5_0.Match3Button = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "Match4Button"

	var_5_12.Text:SetLeft(_1080p * 20, 0)
	var_5_12.Text:setText(ToUpperCase(""), 0)
	var_5_12.Text:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, _1080p * 232, _1080p * 270)
	var_5_0:addElement(var_5_12)

	var_5_0.Match4Button = var_5_12

	local var_5_13
	local var_5_14 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_5_1
	})

	var_5_14.id = "Match5Button"

	var_5_14.Text:SetLeft(_1080p * 20, 0)
	var_5_14.Text:setText(ToUpperCase(""), 0)
	var_5_14.Text:SetAlignment(LUI.Alignment.Left)
	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, _1080p * 290, _1080p * 328)
	var_5_0:addElement(var_5_14)

	var_5_0.Match5Button = var_5_14

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("PreviousGameStatsButtons", PreviousGameStatsButtons)
LockTable(_M)
