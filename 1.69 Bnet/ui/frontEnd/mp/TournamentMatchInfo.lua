module(..., package.seeall)

local var_0_0 = 5

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0.Team1Status:Update(1, arg_1_1)
	arg_1_0.Team2Status:Update(2, arg_1_1)

	arg_1_0.tournamentEvents = Tournament.HEAFHIHB(arg_1_1.roundIndex - 1, arg_1_1.matchIndex - 1)

	arg_1_0.EventGrid:SetNumRows(math.min(#arg_1_0.tournamentEvents, var_0_0))
	arg_1_0.EventGrid:SetNumColumns(1)
	arg_1_0.EventGrid:RefreshContent()
	arg_1_0.MatchTimeString:setText(TOURNAMENT.GetMatchTimeString(arg_1_1.roundIndex - 1, arg_1_1.matchIndex - 1))
end

local function var_0_2(arg_2_0, arg_2_1)
	assert(arg_2_0.MatchTimeString)
	assert(arg_2_0.RoundNum)

	local var_2_0 = 0

	for iter_2_0 = 1, 2 do
		var_2_0 = var_2_0 + Tournament.DCFJHHBECC(arg_2_1.roundIndex - 1, arg_2_1.matchIndex - 1, iter_2_0 - 1)
	end

	arg_2_0.RoundNum:setText(Engine.CBBHFCGDIC("TOURNAMENT/ROUND_NUMBER", var_2_0))
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.EventGrid)
	assert(arg_3_0.Team1Status)
	assert(arg_3_0.Team2Status)

	arg_3_0.SetupStaticFields = var_0_2
	arg_3_0.Update = var_0_1

	arg_3_0.EventGrid:SetRefreshChild(function(arg_4_0, arg_4_1, arg_4_2)
		arg_4_0:Update(arg_3_1, arg_3_0.tournamentEvents[arg_4_2 + 1])
	end)
	arg_3_0.EventGrid:SetNumRows(0)
	arg_3_0.EventGrid:SetNumColumns(1)
	arg_3_0.EventGrid:RefreshContent()
end

function TournamentMatchInfo(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 300 * _1080p)

	var_5_0.id = "TournamentMatchInfo"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIText.new()

	var_5_4.id = "RoundNum"

	var_5_4:setText("", 0)
	var_5_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_4:SetAlignment(LUI.Alignment.Center)
	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -249.5, _1080p * 250, 0, _1080p * 24)
	var_5_0:addElement(var_5_4)

	var_5_0.RoundNum = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("TournamentTeamStatus", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "Team1Status"

	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 250, _1080p * 28, _1080p * 58)
	var_5_0:addElement(var_5_6)

	var_5_0.Team1Status = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("TournamentTeamStatus", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "Team2Status"

	var_5_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -250, 0, _1080p * 28, _1080p * 58)
	var_5_0:addElement(var_5_8)

	var_5_0.Team2Status = var_5_8

	local var_5_9
	local var_5_10 = {
		scrollingThresholdX = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		wrapY = true,
		springCoefficient = 400,
		controllerIndex = var_5_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("TournamentEvent", {
				controllerIndex = var_5_1
			})
		end,
		refreshChild = function(arg_7_0, arg_7_1, arg_7_2)
			return
		end,
		spacingX = _1080p * 18,
		spacingY = _1080p * 18,
		columnWidth = _1080p * 600,
		rowHeight = _1080p * 30,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_5_11 = LUI.UIGrid.new(var_5_10)

	var_5_11.id = "EventGrid"

	var_5_11:setUseStencil(true)
	var_5_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 78, _1080p * 300)
	var_5_0:addElement(var_5_11)

	var_5_0.EventGrid = var_5_11

	local var_5_12
	local var_5_13 = LUI.UIText.new()

	var_5_13.id = "MatchTimeString"

	var_5_13:setText("", 0)
	var_5_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_13:SetAlignment(LUI.Alignment.Center)
	var_5_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 245, _1080p * 355, _1080p * 34, _1080p * 52)
	var_5_0:addElement(var_5_13)

	var_5_0.MatchTimeString = var_5_13

	ACTIONS.AnimateSequenceByElement(var_5_0, {
		elementPath = "self.Team1Status",
		sequenceName = "Left",
		elementName = "Team1Status"
	})
	ACTIONS.AnimateSequenceByElement(var_5_0, {
		elementPath = "self.Team2Status",
		sequenceName = "Right",
		elementName = "Team2Status"
	})
	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("TournamentMatchInfo", TournamentMatchInfo)
LockTable(_M)
