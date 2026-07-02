module(..., package.seeall)

function PostLoadFunc(arg_1_0)
	function arg_1_0.SetData(arg_2_0, arg_2_1)
		assert(arg_2_1.numWins)
		assert(arg_2_1.currentWinStreak)
		assert(arg_2_1.kdRatio)
		assert(arg_2_1.winLossRatio)
		arg_2_0.Wins.Value:setText(arg_2_1.numWins)
		arg_2_0.Streak.Value:setText(arg_2_1.currentWinStreak)
		arg_2_0.KD.Value:setText(string.format("%.3f", arg_2_1.kdRatio))
		arg_2_0.WinLoss.Value:setText(string.format("%.3f", arg_2_1.winLossRatio))
	end
end

function LobbyMemberStats(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 418 * _1080p, 0, 132 * _1080p)

	var_3_0.id = "LobbyMemberStats"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("LobbyMemberStat", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Wins"

	var_3_4.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/WINS"), 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 30)
	var_3_0:addElement(var_3_4)

	var_3_0.Wins = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("LobbyMemberStat", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "Streak"

	var_3_6.Title:setText(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/WIN_STREAK"), 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 34, _1080p * 64)
	var_3_0:addElement(var_3_6)

	var_3_0.Streak = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("LobbyMemberStat", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "WinLoss"

	var_3_8.Title:setText(Engine.CBBHFCGDIC("MENU/WLRATIO"), 0)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 68, _1080p * 98)
	var_3_0:addElement(var_3_8)

	var_3_0.WinLoss = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("LobbyMemberStat", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "KD"

	var_3_10.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/KD_RATIO"), 0)
	var_3_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 102, _1080p * 132)
	var_3_0:addElement(var_3_10)

	var_3_0.KD = var_3_10

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("LobbyMemberStats", LobbyMemberStats)
LockTable(_M)
