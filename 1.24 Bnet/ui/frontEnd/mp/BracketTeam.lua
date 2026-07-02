module(..., package.seeall)

local var_0_0 = {
	WON = 1,
	MY_TEAM = 2
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_0.Bracket
	local var_1_1 = LUI.FlowManager.GetScopedData(TOURNAMENT.GetMenuName("arena"))

	assert(var_1_0.TeamName)
	assert(var_1_0.Wins)

	local var_1_2 = arg_1_2.teams[arg_1_1]

	var_1_0.TeamName:setText(var_1_2.name)
	var_1_0.ReadyFlash:SetRGBFromTable(SWATCHES.Tournament.bracketBacker)

	local var_1_3 = arg_1_2.canSpectate or arg_1_2.complete

	var_1_0.Wins:setText(var_1_3 and var_1_2.wins or Engine.CBBHFCGDIC("TOURNAMENT/NO_DATA"))

	if arg_1_0._matchData and var_1_2.wins ~= arg_1_0._matchData.teams[arg_1_1].wins and not var_1_1.firstBracketUpdate then
		ACTIONS.AnimateSequence(var_1_0, "ScoreFlash")
	end

	if var_1_2.won and arg_1_0._state ~= var_0_0.WON and arg_1_2.complete then
		arg_1_0._state = var_0_0.WON

		var_1_0.Wins:SetRGBFromTable(SWATCHES.Tournament.teamNeutral)
		var_1_0.TeamName:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_1_0.Wins:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		ACTIONS.AnimateSequence(var_1_0, var_1_2.isMyTeam and "WonMyTeam" or "WonNotMyTeam")
	elseif not var_1_2.won and var_1_2.isMyTeam and arg_1_0._state ~= var_0_0.MY_TEAM then
		ACTIONS.AnimateSequence(var_1_0, "MyTeam")

		arg_1_0._state = var_0_0.MY_TEAM

		var_1_0.ScoreBacker:SetRGBFromTable(SWATCHES.Tournament.bracketBacker)
		var_1_0.TeamName:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	end

	if not arg_1_2.complete then
		if arg_1_2.isMyMatch then
			ACTIONS.AnimateSequence(var_1_0, "MyMatch")
		end

		if arg_1_2.canSpectate then
			if arg_1_0._matchData and arg_1_0._matchData.canSpectate ~= arg_1_2.canSpectate then
				ACTIONS.AnimateSequence(var_1_0, "InProgress")
			else
				ACTIONS.AnimateSequence(var_1_0, "InProgressSnap")
			end
		elseif arg_1_2.isMyMatch then
			var_1_0.YouIndicator:SetAlpha(var_1_2.isMyTeam and 1 or 0)
			ACTIONS.AnimateSequence(var_1_0, "MyMatch")

			if arg_1_0._matchData and arg_1_0._matchData.canSpectate ~= arg_1_2.canSpectate then
				ACTIONS.AnimateSequence(var_1_0, "MyMatchWaiting")
			else
				ACTIONS.AnimateSequence(var_1_0, "MyMatchWaitingSnap")
			end
		else
			ACTIONS.AnimateSequence(var_1_0, "NotMyMatchWaitingSnap")
		end
	else
		var_1_0.YouIndicator:SetAlpha(0)

		if arg_1_0._matchData and arg_1_0._matchData.complete ~= arg_1_2.complete then
			ACTIONS.AnimateSequence(var_1_0, "Completed")
		else
			ACTIONS.AnimateSequence(var_1_0, "CompletedSnap")
		end

		if not var_1_2.won and arg_1_0._matchData and arg_1_0._matchData.complete ~= arg_1_2.complete then
			ACTIONS.AnimateSequence(var_1_0, "Lost")

			if var_1_2.isMyTeam then
				var_1_0.TeamName:SetAlpha(0.6)
				var_1_0.TeamName:SetRGBFromTable(SWATCHES.Scoreboard.highlight)
			end
		elseif not var_1_2.won then
			ACTIONS.AnimateSequence(var_1_0, "LostSnap")

			if var_1_2.isMyTeam then
				var_1_0.TeamName:SetAlpha(0.6)
				var_1_0.TeamName:SetRGBFromTable(SWATCHES.Scoreboard.highlight)
			end
		end
	end

	if not arg_1_0._fullTeamReady then
		local var_1_4 = true

		for iter_1_0 = 1, #var_1_2.players do
			var_1_4 = var_1_4 and var_1_2.players[iter_1_0].ready
		end

		if var_1_4 and arg_1_2.isMyMatch then
			arg_1_0._fullTeamReady = true

			if not var_1_1.firstBracketUpdate then
				ACTIONS.AnimateSequence(var_1_0, "TeamReadyFlash")
				Engine.BJDBIAGIDA(var_1_2.isMyTeam and "ui_iw8_2v2_teamready_myteam_notify" or "ui_iw8_2v2_teamready_opposing_notify")
			end
		end
	end

	arg_1_0._matchData = arg_1_2
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = MenuBuilder.BuildRegisteredType(arg_2_2.isLeft and "BracketTeamRightSide" or "BracketTeamLeftSide", {
		controllerIndex = arg_2_1
	})

	var_2_0.id = arg_2_2.isLeft and "BracketTeamRightSide" or "BracketTeamLeftSide"

	var_2_0:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	arg_2_0:addElement(var_2_0)

	arg_2_0.Bracket = var_2_0
	arg_2_0.Update = var_0_1

	if arg_2_2.bracketTeam == 1 then
		arg_2_0.Bracket.TeamColor:SetBottom(2 * _1080p)
	else
		arg_2_0.Bracket.TeamColor:SetTop(-2 * _1080p)
	end
end

function BracketTeam(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 302 * _1080p, 0, 38 * _1080p)

	var_3_0.id = "BracketTeam"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_0_2(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BracketTeam", BracketTeam)
LockTable(_M)
