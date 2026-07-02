module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = Dvar.CFHDGABACF("RRNTNNKNP") > 1
	local var_1_1 = var_1_0 and Lobby.MAX_SQUAD_COUNT or 11
	local var_1_2 = var_1_0 and Lobby.SquadMembersPath or Lobby.AllMembersPath

	if not arg_1_0.lobbyMemberGrid then
		local var_1_3 = {
			numRows = var_1_1,
			controllerIndex = arg_1_1,
			modelPath = var_1_2
		}

		arg_1_0.lobbyMemberGrid = MenuBuilder.BuildRegisteredType("LobbyMemberGrid", var_1_3)

		arg_1_0.lobbyMemberGrid:setPriority(-100)
		arg_1_0.lobbyMemberGrid.PlayerCount:SetAlpha(0)
		arg_1_0:addElement(arg_1_0.lobbyMemberGrid)
		arg_1_0.lobbyMemberGrid:processEvent({
			name = "gain_focus"
		})
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(arg_2_0.LobbyTeamDetails)
	arg_2_0.LobbyTeamDetails:DisableTeamSwitcher(true)

	local var_2_0 = Lobby.GetLocalClientTeam(arg_2_1)
	local var_2_1 = MP.GetFactionReference(var_2_0)

	arg_2_0.LobbyTeamDetails.TeamViewName:setText(Engine.CBBHFCGDIC("LUA_MENU/YOUR_TEAM"))
	arg_2_0.LobbyTeamDetails.SuperfactionName:setText(Engine.CBEAHDFCFC(MP.GetTeamName(var_2_0)))

	local var_2_2 = MP.GetTeamLogo(var_2_0, var_2_0, var_2_1, true)

	arg_2_0.LobbyTeamDetails.FactionIcon:setImage(RegisterMaterial(var_2_2))
	ACTIONS.AnimateSequence(arg_2_0.LobbyTeamDetails, "LPCLobby")

	local var_2_3 = arg_2_0.LobbyTeamDetails:GetCurrentAnchorsAndPositions().right
	local var_2_4 = LAYOUT.GetElementWidth(arg_2_0.LobbyTeamDetails.FactionIcon) / 2
	local var_2_5 = LAYOUT.GetTextWidth(arg_2_0.LobbyTeamDetails.SuperfactionName)

	arg_2_0.LobbyTeamDetails:SetLeft(-var_2_5 - var_2_4 + var_2_3)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	Engine.DHFCHIIJCA("squad_lobby")

	local var_3_0 = Dvar.CFHDGABACF("RRNTNNKNP")
	local var_3_1 = var_3_0 > 1 and var_3_0 or FrontEndScene.MaxLobbyCharacters

	arg_3_0.UpdatePlayerCount = var_0_0

	arg_3_0:UpdatePlayerCount(arg_3_1)

	local var_3_2 = {
		maxCharactersToShow = var_3_1,
		widget = arg_3_0,
		dataSourcePath = Lobby.SquadMembersPath
	}

	arg_3_0._clientCharacterMap = Lobby.UpdateClientCharacters(arg_3_1, var_3_2)

	arg_3_0:registerEventHandler("lobby_member_on_over", function(arg_4_0, arg_4_1)
		arg_4_0:SetDataSource(arg_4_1.dataSource, arg_4_1.controller)

		return true
	end)

	arg_3_0._focusArrow = Lobby.BuildFocusArrowWidget(arg_3_0, arg_3_1)

	local function var_3_3()
		Lobby.UpdateFocusArrow(arg_3_0, arg_3_0._focusArrow, arg_3_1, arg_3_0._clientCharacterMap)
	end

	arg_3_0:SubscribeToModelThroughElement(arg_3_0, "memberIndex", var_3_3)

	local var_3_4 = LUI.UITimer.new({
		interval = 500,
		event = "update_lobby_characters"
	})

	var_3_4.id = "lobbyCharacterTimer"

	arg_3_0:addElement(var_3_4)
	arg_3_0:registerEventHandler("update_lobby_characters", function(arg_6_0, arg_6_1)
		Lobby.UpdateClientCharactersDelayed(arg_3_0, arg_3_1, var_3_2, function(arg_7_0)
			arg_3_0._clientCharacterMap = arg_7_0
		end)
	end)

	local function var_3_5()
		arg_3_0:UpdatePlayerCount(arg_3_1)
	end

	arg_3_0:SubscribeToModel(DataSources.frontEnd.lobby.memberCount:GetModel(arg_3_1), var_3_5)

	local var_3_6 = var_3_0 > 1 and Lobby.SquadMembersPath or Lobby.AllMembersPath
	local var_3_7 = LUI.DataSourceInGlobalModel.new(var_3_6 .. ".memberCount")
	local var_3_8 = DataSources.frontEnd.lobby.memberMaxCount

	local function var_3_9()
		local var_9_0 = var_3_7:GetValue(arg_3_1)
		local var_9_1 = var_3_8:GetValue(arg_3_1)

		if var_9_0 ~= nil and var_9_1 ~= nil then
			arg_3_0.LobbyCount:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/LOBBY_COUNT", var_9_0, var_9_1))
		end
	end

	arg_3_0:SubscribeToModel(var_3_7:GetModel(arg_3_1), var_3_9)
	arg_3_0:SubscribeToModel(var_3_8:GetModel(arg_3_1), var_3_9)

	if var_3_0 > 1 then
		local var_3_10 = LUI.DataSourceInGlobalModel.new(Lobby.SquadMembersPath .. ".count")

		local function var_3_11()
			local var_10_0 = Dvar.CFHDGABACF("RRNTNNKNP")
			local var_10_1 = var_3_10:GetValue(arg_3_1)
			local var_10_2 = math.min(var_10_1, var_10_0)

			if var_10_2 ~= nil then
				arg_3_0.SquadCount:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/SQUAD_COUNT", var_10_2, var_10_0))
				arg_3_0.SquadCount:SetAlpha(1)
			end
		end

		arg_3_0:SubscribeToModel(var_3_10:GetModel(arg_3_1), var_3_11)
	else
		arg_3_0.SquadCount:SetAlpha(0)
	end

	if arg_3_0.LobbyTeamDetails then
		var_0_1(arg_3_0, arg_3_1)
	end
end

function LobbyLPCMatchmade(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_11_0.id = "LobbyLPCMatchmade"

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("LobbyMap", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "LobbyMap"

	var_11_4:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 526, _1080p * -231, _1080p * -101)
	var_11_0:addElement(var_11_4)

	var_11_0.LobbyMap = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIText.new()

	var_11_6.id = "SquadCount"

	var_11_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_6:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/PLAYER_COUNT_PUBLIC"), 0)
	var_11_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_11_6:SetAlignment(LUI.Alignment.Left)
	var_11_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 238)
	var_11_0:addElement(var_11_6)

	var_11_0.SquadCount = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIText.new()

	var_11_8.id = "LobbyCount"

	var_11_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_8:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/LOBBY_COUNT"), 0)
	var_11_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_8:SetAlignment(LUI.Alignment.Left)
	var_11_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 183, _1080p * 211)
	var_11_0:addElement(var_11_8)

	var_11_0.LobbyCount = var_11_8

	local var_11_9

	if not CONDITIONS.IsBRGameType(var_11_0) then
		local var_11_10 = MenuBuilder.BuildRegisteredType("LobbyTeamDetails", {
			controllerIndex = var_11_1
		})

		var_11_10.id = "LobbyTeamDetails"

		var_11_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -445, _1080p * -96, _1080p * 193, _1080p * 316)
		var_11_0:addElement(var_11_10)

		var_11_0.LobbyTeamDetails = var_11_10
	end

	var_0_2(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("LobbyLPCMatchmade", LobbyLPCMatchmade)
LockTable(_M)
