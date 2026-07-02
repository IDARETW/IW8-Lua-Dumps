module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._roundIndex = arg_1_1
	arg_1_0._matchIndex = arg_1_2

	local var_1_0 = TOURNAMENT.GetAdjustedMatchIndex(arg_1_1 - 1, arg_1_2 - 1)

	arg_1_0.WaitingForWinner:setText(Engine.CBBHFCGDIC("TOURNAMENT/WAITING_FOR_WINNER", var_1_0))
	arg_1_0:Update()
end

local function var_0_1(arg_2_0)
	if arg_2_0._disabled then
		return
	end

	if Tournament.EAHDCDDFCD(arg_2_0._roundIndex - 1, arg_2_0._matchIndex - 1) then
		arg_2_0:SetAlpha(0)

		arg_2_0._disabled = true
	else
		arg_2_0.TournamentMiniTeam1Status:Update(arg_2_0._roundIndex, arg_2_0._matchIndex, 1)
		arg_2_0.TournamentMiniTeam2Status:Update(arg_2_0._roundIndex, arg_2_0._matchIndex, 2)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.TournamentMiniTeam1Status)
	assert(arg_3_0.TournamentMiniTeam2Status)
	assert(arg_3_0.WaitingForWinner)

	arg_3_0.Setup = var_0_0
	arg_3_0.Update = var_0_1
end

function TournamentWaitingForTeam(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 224 * _1080p)

	var_4_0.id = "TournamentWaitingForTeam"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIText.new()

	var_4_4.id = "WaitingForWinner"

	var_4_4:setText("", 0)
	var_4_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_4:SetAlignment(LUI.Alignment.Center)
	var_4_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 500, _1080p * -500, 0, _1080p * 24)
	var_4_0:addElement(var_4_4)

	var_4_0.WaitingForWinner = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "CurrentScore"

	var_4_6:setText(Engine.CBBHFCGDIC("TOURNAMENT/CURRENT_SCORE"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 500, _1080p * -500, _1080p * 41, _1080p * 70)
	var_4_0:addElement(var_4_6)

	var_4_0.CurrentScore = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("TournamentMiniTeamStatus", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "TournamentMiniTeam1Status"

	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -190, _1080p * 190, _1080p * 100, _1080p * 154)
	var_4_0:addElement(var_4_8)

	var_4_0.TournamentMiniTeam1Status = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("TournamentMiniTeamStatus", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "TournamentMiniTeam2Status"

	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -190, _1080p * 190, _1080p * 170, _1080p * 224)
	var_4_0:addElement(var_4_10)

	var_4_0.TournamentMiniTeam2Status = var_4_10

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("TournamentWaitingForTeam", TournamentWaitingForTeam)
LockTable(_M)
