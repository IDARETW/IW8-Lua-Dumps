module(..., package.seeall)

local var_0_0 = 2

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_0._teamDetails[arg_1_2]

	for iter_1_0 = 1, #var_1_0 do
		var_1_0[iter_1_0]:SetTeamIndex(arg_1_2)
		var_1_0[iter_1_0]:SetupDatasourceSubscriptions(arg_1_0._controllerIndex)
		var_1_0[iter_1_0]:SetDataSource(arg_1_1:GetDataSourceAtIndex(iter_1_0 - 1), arg_1_0._controllerIndex)
	end
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	var_0_1(arg_2_0, arg_2_1.members, 1)
	var_0_1(arg_2_0, arg_2_2.members, 2)
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("character_tournaments")

	local var_3_0 = TOURNAMENT.GetTournamentTeamDatasources(arg_3_0, arg_3_1)
	local var_3_1 = TOURNAMENT.GetTeamDatasource(var_3_0, 0)
	local var_3_2 = TOURNAMENT.GetTeamDatasource(var_3_0, 1)
	local var_3_3 = TOURNAMENT.GetMyTeamIndex(arg_3_2, arg_3_3)

	if var_3_3 == Teams.allies then
		var_3_2, var_3_1 = var_3_1, var_3_2
	end

	var_0_2(arg_3_0, var_3_1, var_3_2)

	arg_3_0._allTeamData = TOURNAMENT.RequestClientCharacterData(arg_3_0, var_3_1, var_3_2, arg_3_1, var_3_3)

	if not arg_3_0.lobbyTimer then
		arg_3_0.lobbyTimer = LUI.UITimer.new({
			interval = 2000,
			event = "update_streaming_requests"
		})
		arg_3_0.lobbyTimer.id = "lobbyTimer"

		arg_3_0:addElement(arg_3_0.lobbyTimer)
		arg_3_0:registerEventHandler("update_streaming_requests", function(arg_4_0, arg_4_1)
			arg_3_0._allTeamData = TOURNAMENT.RequestClientCharacterData(arg_4_0, var_3_1, var_3_2, arg_3_1, var_3_3)

			if TOURNAMENT.UpdateClientCharacters(arg_3_1, arg_3_0._allTeamData, arg_3_0._teamDetails) then
				arg_3_0:processEvent({
					name = "lose_focus"
				})
				arg_3_0:processEvent({
					name = "gain_focus"
				})
			end
		end)
	end

	if TOURNAMENT.UpdateClientCharacters(arg_3_1, arg_3_0._allTeamData, arg_3_0._teamDetails) then
		arg_3_0:processEvent({
			name = "lose_focus"
		})
		arg_3_0:processEvent({
			name = "gain_focus"
		})
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.SetClientCharacterScene = var_0_3
	arg_5_0._controllerIndex = arg_5_2.controllerIndex
	arg_5_0._teamDetails = {}

	for iter_5_0 = 1, var_0_0 do
		for iter_5_1 = 1, TOURNAMENT.maxPlayersOnTeam do
			arg_5_0._teamDetails[iter_5_0] = arg_5_0._teamDetails[iter_5_0] or {}

			local var_5_0 = arg_5_0["Team" .. iter_5_0 .. "Player" .. iter_5_1 .. "Details"]

			assert(var_5_0)
			table.insert(arg_5_0._teamDetails[iter_5_0], var_5_0)
		end
	end
end

function TournamentPlayerNames(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIHorizontalNavigator.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_6_0.id = "TournamentPlayerNames"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("TournamentLobbyMember", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "Team1Player3Details"

	var_6_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -631, _1080p * -361, _1080p * 758, _1080p * 786)
	var_6_0:addElement(var_6_4)

	var_6_0.Team1Player3Details = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("TournamentLobbyMember", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "Team1Player2Details"

	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -756, _1080p * -486, _1080p * 803, _1080p * 831)
	var_6_0:addElement(var_6_6)

	var_6_0.Team1Player2Details = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("TournamentLobbyMember", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "Team1Player1Details"

	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -453, _1080p * -183, _1080p * 803, _1080p * 831)
	var_6_0:addElement(var_6_8)

	var_6_0.Team1Player1Details = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("TournamentLobbyMember", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "Team2Player3Details"

	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 381, _1080p * 651, _1080p * 758, _1080p * 786)
	var_6_0:addElement(var_6_10)

	var_6_0.Team2Player3Details = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("TournamentLobbyMember", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "Team2Player2Details"

	var_6_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 522, _1080p * 792, _1080p * 803, _1080p * 831)
	var_6_0:addElement(var_6_12)

	var_6_0.Team2Player2Details = var_6_12

	local var_6_13
	local var_6_14 = MenuBuilder.BuildRegisteredType("TournamentLobbyMember", {
		controllerIndex = var_6_1
	})

	var_6_14.id = "Team2Player1Details"

	var_6_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 204, _1080p * 474, _1080p * 803, _1080p * 831)
	var_6_0:addElement(var_6_14)

	var_6_0.Team2Player1Details = var_6_14

	var_0_4(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("TournamentPlayerNames", TournamentPlayerNames)
LockTable(_M)
