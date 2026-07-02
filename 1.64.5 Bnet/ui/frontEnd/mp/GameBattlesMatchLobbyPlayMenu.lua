module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_1:SubscribeToModel(arg_1_2.commitReady:GetModel(arg_1_0), function(arg_2_0)
		if not arg_1_2.isPlaceHolderPlayer:GetValue(arg_1_0) then
			local var_2_0 = DataModel.JJEHAEBDF(arg_2_0) and "IsReady" or "IsNotReady"

			ACTIONS.AnimateSequence(arg_1_1, var_2_0)
		end
	end)
	arg_1_1:SubscribeToModel(arg_1_2.isPlaceHolderPlayer:GetModel(arg_1_0), function(arg_3_0)
		local var_3_0 = DataModel.JJEHAEBDF(arg_3_0)
		local var_3_1 = arg_1_2.commitReady:GetValue(arg_1_0)

		if not var_3_0 and not var_3_1 then
			ACTIONS.AnimateSequence(arg_1_1, "IsNotReady")
		elseif var_3_0 then
			ACTIONS.AnimateSequence(arg_1_1, "HideIsReady")
		end
	end)
end

local function var_0_1(arg_4_0, arg_4_1, arg_4_2)
	arg_4_1:UnsubscribeFromModel(arg_4_2.commitReady:GetModel(arg_4_0))
	arg_4_1:UnsubscribeFromModel(arg_4_2.isPlaceHolderPlayer:GetModel(arg_4_0))
	ACTIONS.AnimateSequence(arg_4_1, "HideIsReady")
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = {
		arg_5_0.LobbyMembersAxis.List,
		arg_5_0.LobbyMembersAllies.List
	}

	for iter_5_0, iter_5_1 in ipairs(var_5_0) do
		if arg_5_0.lobbyTeamMembersCount[iter_5_0] ~= 0 then
			for iter_5_2 = 0, arg_5_0.lobbyTeamMembersCount[iter_5_0] - 1 do
				local var_5_1 = iter_5_1:GetElementAtPosition(0, iter_5_2)

				if var_5_1 then
					local var_5_2 = var_5_1.LobbyMember:GetDataSource()
					local var_5_3 = false

					if arg_5_2 then
						var_0_0(arg_5_1, var_5_1, var_5_2)

						var_5_3 = var_5_2.isLobbyHost:GetValue(arg_5_1)
					else
						var_0_1(arg_5_1, var_5_1, var_5_2)
					end

					var_5_1.LobbyMember:UpdateHostIcon(var_5_3)
				end
			end
		end
	end
end

local function var_0_3(arg_6_0, arg_6_1)
	local var_6_0 = LUI.DataSourceFromList.new(arg_6_0)

	var_6_0.MakeDataSourceAtIndex = arg_6_1

	return {
		members = var_6_0
	}
end

local function var_0_4(arg_7_0, arg_7_1)
	local var_7_0 = "alwaysLoaded.activeParty"

	arg_7_0.teamAxisCountDataSource = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".members.teamAxisCount")
	arg_7_0.teamAlliesCountDataSource = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".members.teamAlliesCount")
	arg_7_0.teamSpectatorCountDataSource = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".members.teamSpectatorCount")
	arg_7_0.GameBattlesTeamRosterAxisCount = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".members.GameBattlesTeamRosterAxisCount")
	arg_7_0.GameBattlesTeamRosterAlliesCount = LUI.DataSourceInGlobalModel.new(var_7_0 .. ".members.GameBattlesTeamRosterAlliesCount")

	local var_7_1 = arg_7_0.GameBattlesTeamRosterAxisCount:GetValue(arg_7_1)
	local var_7_2 = var_7_1 + arg_7_0.GameBattlesTeamRosterAlliesCount:GetValue(arg_7_1)
	local var_7_3 = Lobby.GetLobbyMemberDataSourceAtIndex("alwaysLoaded.activeParty.members")

	arg_7_0.teamsDataSources = {}
	arg_7_0.teamsDataSources.teamAxis = var_0_3(arg_7_0.GameBattlesTeamRosterAxisCount, function(arg_8_0, arg_8_1, arg_8_2)
		return var_7_3(arg_8_0, arg_8_1, arg_8_2)
	end)
	arg_7_0.teamsDataSources.teamAllies = var_0_3(arg_7_0.GameBattlesTeamRosterAlliesCount, function(arg_9_0, arg_9_1, arg_9_2)
		return var_7_3(arg_9_0, arg_9_1 + var_7_1, arg_9_2)
	end)
	arg_7_0.teamsDataSources.teamSpectator = var_0_3(arg_7_0.teamSpectatorCountDataSource, function(arg_10_0, arg_10_1, arg_10_2)
		return var_7_3(arg_10_0, arg_10_1 + var_7_2, arg_10_2)
	end)
end

local function var_0_5(arg_11_0, arg_11_1)
	if arg_11_0.gbMatch then
		arg_11_0.LobbyMembersAxis.List:SetGridDataSource(arg_11_0.teamsDataSources.teamAxis.members)
		arg_11_0.LobbyMembersAllies.List:SetGridDataSource(arg_11_0.teamsDataSources.teamAllies.members)

		local var_11_0 = {
			arg_11_0.teamAxisCountDataSource,
			arg_11_0.teamAlliesCountDataSource
		}
		local var_11_1 = {
			arg_11_0.LobbyMembersAxis.StatusLabel,
			arg_11_0.LobbyMembersAllies.StatusLabel
		}

		for iter_11_0, iter_11_1 in ipairs(var_11_1) do
			arg_11_0:SubscribeToModel(var_11_0[iter_11_0]:GetModel(arg_11_1), function(arg_12_0)
				local var_12_0 = DataModel.JJEHAEBDF(arg_12_0)

				iter_11_1:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/PLAYERS_NUMBERS", Engine.JCBDICCAH(var_12_0)))
			end)
		end
	end

	local var_11_2 = {
		arg_11_0.LobbyMembersAxis.List,
		arg_11_0.LobbyMembersAllies.List
	}
	local var_11_3 = GAMEBATTLES.HasJoinedMatch(arg_11_1)

	for iter_11_2, iter_11_3 in ipairs(var_11_2) do
		if arg_11_0.lobbyTeamMembersCount[iter_11_2] ~= 0 then
			for iter_11_4 = 0, arg_11_0.lobbyTeamMembersCount[iter_11_2] - 1 do
				local var_11_4 = iter_11_3:GetElementAtPosition(0, iter_11_4)
				local var_11_5 = var_11_4.LobbyMember:GetDataSource()

				ACTIONS.AnimateSequence(var_11_4.LobbyMember, "GameBattles")

				if var_11_3 then
					var_0_0(arg_11_1, var_11_4, var_11_5)
				end

				var_11_4.isMyPlayer = false

				var_11_4:SubscribeToModel(var_11_5.isMyPlayer:GetModel(arg_11_1), function(arg_13_0)
					local var_13_0 = DataModel.JJEHAEBDF(arg_13_0)

					if var_13_0 then
						var_11_4.isMyPlayer = true
					end

					local var_13_1 = var_13_0 and "IsMyPlayer" or "IsNotMyPlayer"

					ACTIONS.AnimateSequence(var_11_4, var_13_1)

					if not var_11_5.isPlaceHolderPlayer:GetValue(arg_11_1) or var_11_4.isMyPlayer and var_13_0 then
						ACTIONS.AnimateSequence(var_11_4.LobbyMember, var_13_1)
					end
				end)
				var_11_4:SubscribeToModel(var_11_5.isPlaceHolderPlayer:GetModel(arg_11_1), function(arg_14_0)
					local var_14_0 = DataModel.JJEHAEBDF(arg_14_0)

					if not var_11_4.isMyPlayer then
						local var_14_1 = var_14_0 and "IsNotConnectedPlayer" or "IsNotMyPlayer"

						ACTIONS.AnimateSequence(var_11_4.LobbyMember, var_14_1)
					end

					var_11_4.LobbyMember:SetButtonDisabled(var_14_0)
					var_11_4.LobbyMember.InputMethod:SetAlpha(var_14_0 and 0 or 1)

					local var_14_2 = var_14_0 and "HidePlatform" or "ShowPlatform"

					ACTIONS.AnimateSequence(var_11_4, var_14_2)
				end)
			end
		else
			iter_11_3:SetNumChildren(0)
		end
	end
end

local function var_0_6(arg_15_0, arg_15_1, arg_15_2)
	FrontEndScene.HideAllCharacters()
end

local function var_0_7(arg_16_0, arg_16_1)
	local var_16_0 = 0
	local var_16_1 = arg_16_1:GetCountValue(arg_16_0)

	return function()
		local var_17_0 = var_16_0 + 1

		if var_17_0 <= var_16_1 then
			local var_17_1 = arg_16_1:GetDataSourceAtIndex(var_16_0, arg_16_0)

			var_16_0 = var_17_0

			return var_17_0, var_17_1
		end
	end
end

local function var_0_8(arg_18_0, arg_18_1)
	local var_18_0
	local var_18_1
	local var_18_2 = {
		arg_18_0.teamsDataSources.teamAxis.members,
		arg_18_0.teamsDataSources.teamAllies.members
	}

	for iter_18_0, iter_18_1 in ipairs(var_18_2) do
		for iter_18_2, iter_18_3 in var_0_7(arg_18_1, iter_18_1) do
			if iter_18_3.isMyPlayer:GetValue(arg_18_1) then
				var_18_0 = iter_18_0
				var_18_1 = iter_18_0 == 1 and iter_18_2 or GAMEBATTLES.MAX_LOBBY_CHARACTERS_POSITIONS / 2 + iter_18_2

				break
			end
		end
	end

	return {
		teamIndex = var_18_0,
		lobbyIndex = var_18_1
	}
end

local function var_0_9(arg_19_0, arg_19_1)
	FrontEndScene.HideAllCharacters()

	local var_19_0 = LUI.FlowManager.GetScopedData("GameBattlesMatchLobby")
	local var_19_1 = var_19_0.matchLobby.isRefreshEnabled

	arg_19_0.gbMatch = var_19_0.matchLobby.gbMatch
	arg_19_0.lobbyCharactersPosition = {
		unpack(GAMEBATTLES.GAMEBATTLES_LOBBY_CHARACTERS_POSITION)
	}
	arg_19_0.lobbyTeamMembersCount = {
		0,
		0
	}

	if arg_19_0.gbMatch then
		var_0_4(arg_19_0, arg_19_1)
		arg_19_0.LobbyMembersAxis:SetMatchNumber(arg_19_0.gbMatch.gameCount)
		arg_19_0.LobbyMembersAllies:SetMatchNumber(arg_19_0.gbMatch.gameCount)

		local var_19_2, var_19_3, var_19_4 = GAMEBATTLES.GetMatchVictoryInfo(arg_19_0.gbMatch)

		arg_19_0.LobbyMembersAxis.GameBattlesWinCount:SetTeamWinCount(var_19_3)
		arg_19_0.LobbyMembersAllies.GameBattlesWinCount:SetTeamWinCount(var_19_2)

		local var_19_5 = arg_19_0:GetLocalPlayerInfo(arg_19_1)

		if var_19_5.teamIndex then
			arg_19_0.localPlayerTeam = var_19_5.teamIndex

			local var_19_6 = var_19_5.lobbyIndex
			local var_19_7 = var_19_5.teamIndex == 1 and 1 or GAMEBATTLES.MAX_LOBBY_CHARACTERS_POSITIONS / 2 + 1

			if var_19_6 ~= var_19_7 then
				local var_19_8 = arg_19_0.lobbyCharactersPosition[var_19_6]

				arg_19_0.lobbyCharactersPosition[var_19_6] = arg_19_0.lobbyCharactersPosition[var_19_7]
				arg_19_0.lobbyCharactersPosition[var_19_7] = var_19_8
			end
		end

		arg_19_0:registerEventHandler("update_lobby_models", function(arg_20_0, arg_20_1)
			local var_20_0 = arg_20_1.controller

			FrontEndScene.HideAllCharacters()

			local var_20_1, var_20_2, var_20_3, var_20_4 = GAMEBATTLES.GetClientCharacterData(var_20_0, arg_20_0.teamsDataSources.teamAxis.members, 1, arg_20_0.lobbyTeamMembersCount[1])
			local var_20_5, var_20_6, var_20_7, var_20_8 = GAMEBATTLES.GetClientCharacterData(var_20_0, arg_20_0.teamsDataSources.teamAllies.members, 2, arg_20_0.lobbyTeamMembersCount[2])
			local var_20_9 = {
				unpack(var_20_2),
				unpack(var_20_6)
			}
			local var_20_10 = {
				unpack(var_20_3),
				unpack(var_20_7)
			}
			local var_20_11 = {
				unpack(var_20_4),
				unpack(var_20_8)
			}
			local var_20_12 = {
				var_20_1,
				var_20_5
			}

			GAMEBATTLES.RequestClientCharacterData(var_20_9, var_20_10, var_20_11)
			GAMEBATTLES.UpdateClientCharacters(var_20_0, var_20_12, arg_20_0, arg_20_0.lobbyCharactersPosition)
		end)

		arg_19_0.lobbyTeamMembersCount = {
			arg_19_0.GameBattlesTeamRosterAxisCount:GetValue(arg_19_1),
			arg_19_0.GameBattlesTeamRosterAlliesCount:GetValue(arg_19_1)
		}

		local var_19_9 = arg_19_0.gbMatch.teams

		arg_19_0.LobbyMembersAxis.TeamName:setText(var_19_9[1].teamName)
		arg_19_0.LobbyMembersAllies.TeamName:setText(var_19_9[2].teamName)
		arg_19_0.LobbyMembersAxis:SetAlpha(1)
		arg_19_0.LobbyMembersAllies:SetAlpha(1)
		arg_19_0.LobbyMap:SetAlpha(1)
	else
		arg_19_0.LobbyMembersAxis.TeamName:setText("")
		arg_19_0.LobbyMembersAllies.TeamName:setText("")
		arg_19_0.LobbyMembersAxis:SetAlpha(0)
		arg_19_0.LobbyMembersAllies:SetAlpha(0)
		arg_19_0.LobbyMap:SetAlpha(0)
	end

	if not var_19_1 then
		arg_19_0:SetRefreshPromptVisibility(false)
	end

	arg_19_0:InitializeLobbyMembersLists(arg_19_1)
	arg_19_0:SetTeamsLogoColor(arg_19_0.localPlayerTeam)
	arg_19_0.CDLRestrictionTag:UpdateVisibility(arg_19_1)
end

local function var_0_10(arg_21_0, arg_21_1)
	arg_21_0.RefreshMatchesPrompt:SetAlpha(arg_21_1 and 1 or 0)
end

local function var_0_11(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_1 == 1
	local var_22_1 = var_22_0 and "friendly" or "enemy"
	local var_22_2 = var_22_0 and "enemy" or "friendly"

	arg_22_0.LobbyMembersAxis.TeamLogo:setImage(RegisterMaterial("icon_faction_east_" .. var_22_1 .. "_large"))
	arg_22_0.LobbyMembersAllies.TeamLogo:setImage(RegisterMaterial("icon_faction_west_" .. var_22_2 .. "_large"))
end

local function var_0_12(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0.InitializeLobbyMembersLists = var_0_5
	arg_23_0.UpdateTeamListsVisuals = var_0_2
	arg_23_0.InitializePlayMenu = var_0_9
	arg_23_0.SetRefreshPromptVisibility = var_0_10
	arg_23_0.SetTeamsLogoColor = var_0_11
	arg_23_0.GetLocalPlayerInfo = var_0_8

	Engine.DHFCHIIJCA("character_gamebattles")
	Lobby.CreateClientCharacterContainer(arg_23_0)

	arg_23_0.LobbyMembersAxis.List.id = "AxisList"
	arg_23_0.LobbyMembersAllies.List.id = "AlliesList"

	arg_23_0.LobbyMembersAxis.GameBattlesWinCount:SetAlignment(LUI.Alignment.Right)
	arg_23_0.LobbyMembersAllies.GameBattlesWinCount:SetAlignment(LUI.Alignment.Left)
	arg_23_0:InitializePlayMenu(arg_23_1)

	local var_23_0 = LUI.UITimer.new({
		interval = 1000,
		event = {
			name = "update_lobby_models",
			controller = arg_23_1
		}
	})

	var_23_0.id = "updateLobbyModelsTimer"

	arg_23_0:addElement(var_23_0)

	local var_23_1 = LUI.UIBindButton.new()

	var_23_1.id = "selfBindButton"

	arg_23_0:addElement(var_23_1)

	arg_23_0.bindButton = var_23_1

	arg_23_0.bindButton:addEventHandler("button_alt1", function(arg_24_0, arg_24_1)
		arg_23_0:dispatchEventToCurrentMenu({
			name = "refresh_match",
			controller = arg_23_1
		})
	end)
	arg_23_0.bindButton:addEventHandler("button_right_trigger", function(arg_25_0, arg_25_1)
		LUI.FlowManager.RequestAddMenu("GameBattlesSchedule", true, arg_25_1.controller)
	end)
	assert(arg_23_0.Vignette)

	local function var_23_2()
		local var_26_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_23_0.Vignette:SetScale(var_26_0)
	end

	arg_23_0:addAndCallEventHandler("onVideoChange", var_23_2)

	if Engine.CGABICJHAI() then
		LAYOUT.AddAspectRatioFadeFrame(arg_23_0, arg_23_1, nil)
	end
end

function GameBattlesMatchLobbyPlayMenu(arg_27_0, arg_27_1)
	local var_27_0 = LUI.UIHorizontalNavigator.new()

	var_27_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_27_0.id = "GameBattlesMatchLobbyPlayMenu"

	local var_27_1 = arg_27_1 and arg_27_1.controllerIndex

	if not var_27_1 and not Engine.DDJFBBJAIG() then
		var_27_1 = var_27_0:getRootController()
	end

	assert(var_27_1)
	var_0_6(var_27_0, var_27_1, arg_27_1)

	local var_27_2 = var_27_0
	local var_27_3
	local var_27_4 = LUI.UIImage.new()

	var_27_4.id = "Vignette"

	var_27_4:SetAlpha(0.7, 0)
	var_27_4:setImage(RegisterMaterial("menu_vignette_corner"), 0)
	var_27_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 3840, 0, 0)
	var_27_0:addElement(var_27_4)

	var_27_0.Vignette = var_27_4

	local var_27_5
	local var_27_6 = MenuBuilder.BuildRegisteredType("GameBattlesMatchLobbyButton", {
		controllerIndex = var_27_1
	})

	var_27_6.id = "MatchLobbyButton"

	var_27_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -230, _1080p * 230, _1080p * 388, _1080p * 439)
	var_27_0:addElement(var_27_6)

	var_27_0.MatchLobbyButton = var_27_6

	local var_27_7
	local var_27_8 = MenuBuilder.BuildRegisteredType("GameBattlesLobbyMembers", {
		controllerIndex = var_27_1
	})

	var_27_8.id = "LobbyMembersAllies"

	var_27_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 310, _1080p * 810, _1080p * -369, _1080p * 481)
	var_27_0:addElement(var_27_8)

	var_27_0.LobbyMembersAllies = var_27_8

	local var_27_9
	local var_27_10 = MenuBuilder.BuildRegisteredType("GameBattlesLobbyMembers", {
		controllerIndex = var_27_1
	})

	var_27_10.id = "LobbyMembersAxis"

	var_27_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * -330, _1080p * -369, _1080p * 479)
	var_27_0:addElement(var_27_10)

	var_27_0.LobbyMembersAxis = var_27_10

	local var_27_11
	local var_27_12 = MenuBuilder.BuildRegisteredType("LobbyMap", {
		controllerIndex = var_27_1
	})

	var_27_12.id = "LobbyMap"

	var_27_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -230, _1080p * 230, _1080p * 177, _1080p * 358)
	var_27_0:addElement(var_27_12)

	var_27_0.LobbyMap = var_27_12

	local var_27_13
	local var_27_14 = LUI.UIStyledText.new()

	var_27_14.id = "RefreshMatchesPrompt"

	var_27_14:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/SCHEDULE_REFRESH_PROMPT"), 0)
	var_27_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_27_14:SetAlignment(LUI.Alignment.Center)
	var_27_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -230, _1080p * 230, _1080p * 401, _1080p * 425)
	var_27_0:addElement(var_27_14)

	var_27_0.RefreshMatchesPrompt = var_27_14

	local var_27_15
	local var_27_16 = MenuBuilder.BuildRegisteredType("GameBattlesUpcomingMatch", {
		controllerIndex = var_27_1
	})

	var_27_16.id = "GameBattlesUpcomingMatch"

	var_27_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -230, _1080p * 230, _1080p * 171, _1080p * 391)
	var_27_0:addElement(var_27_16)

	var_27_0.GameBattlesUpcomingMatch = var_27_16

	local var_27_17
	local var_27_18 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
		controllerIndex = var_27_1
	})

	var_27_18.id = "CDLRestrictionTag"

	var_27_18:SetAlpha(0, 0)
	var_27_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -230, _1080p * 120, _1080p * 137, _1080p * 167)
	var_27_0:addElement(var_27_18)

	var_27_0.CDLRestrictionTag = var_27_18

	var_0_12(var_27_0, var_27_1, arg_27_1)

	return var_27_0
end

MenuBuilder.registerType("GameBattlesMatchLobbyPlayMenu", GameBattlesMatchLobbyPlayMenu)
LockTable(_M)
