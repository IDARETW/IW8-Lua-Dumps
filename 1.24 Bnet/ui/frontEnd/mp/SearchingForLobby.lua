module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = 6

	arg_1_0.characterDetailsWidgets = Lobby.BuildCharacterDetailWidgets(var_1_0, arg_1_0, arg_1_1)

	if not arg_1_0.characterTimer then
		arg_1_0.characterTimer = LUI.UITimer.new({
			interval = 2000,
			event = "update_client_characters"
		})
		arg_1_0.characterTimer.id = "lobbyTimer"

		arg_1_0:addElement(arg_1_0.characterTimer)
	end

	local var_1_1 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")
	local var_1_2 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.memberCount")

	function arg_1_0.GetPartyCount()
		local var_2_0 = var_1_1:GetValue(arg_1_1)
		local var_2_1 = var_1_2:GetValue(arg_1_1)
		local var_2_2 = 0

		if var_2_0 and var_2_1 then
			var_2_2 = math.max(var_2_0, var_2_1)
		end

		if var_2_2 == 0 then
			if var_2_0 then
				var_2_2 = var_2_0
			elseif var_2_1 then
				var_2_2 = var_2_1
			end
		end

		return var_2_2
	end

	arg_1_0._challengesPrompt = arg_1_0.Challenges:GetPromptContainer()

	local function var_1_3(arg_3_0, arg_3_1, arg_3_2)
		if arg_1_0:GetCurrentMenu() then
			arg_1_0:GetCurrentMenu().UpdateChallengePrompt(arg_3_0, arg_3_1, arg_3_2)
		end
	end

	local function var_1_4()
		local var_4_0 = arg_1_0.GetPartyCount()

		Lobby.UpdateSquadLobbyScene(var_4_0)
		var_1_3(arg_1_0, {}, var_4_0)
	end

	arg_1_0:SubscribeToModel(var_1_1:GetModel(arg_1_1), var_1_4)
	arg_1_0:SubscribeToModel(var_1_2:GetModel(arg_1_1), var_1_4)

	local var_1_5 = {
		maxCharactersToShow = FrontEndScene.MaxClientCharactersMPMainMenu,
		widget = arg_1_0,
		dataSourcePath = Lobby.AllMembersPath
	}

	arg_1_0._clientCharacterMap = Lobby.UpdateClientCharacters(arg_1_1, var_1_5)

	Lobby.UpdateCharacterDetailsWidgets(arg_1_0._clientCharacterMap, arg_1_0.characterDetailsWidgets, arg_1_1)
	arg_1_0:registerEventHandler("update_client_characters", function(arg_5_0, arg_5_1)
		arg_5_0._clientCharacterMap = Lobby.UpdateClientCharacters(arg_1_1, var_1_5)

		Lobby.UpdateCharacterDetailsWidgets(arg_5_0._clientCharacterMap, arg_5_0.characterDetailsWidgets, arg_1_1)
	end)

	if CONDITIONS.IsMatchSimToolEnabled(arg_1_0) then
		assert(arg_1_0.StartSim)
		arg_1_0.StartSim:addEventHandler("button_action", function(arg_6_0, arg_6_1)
			MatchSimulator.ShowGameOverScreen()
		end)
	end

	if not arg_1_0.bindButton then
		arg_1_0.bindButton = LUI.UIBindButton.new()
		arg_1_0.bindButton.id = "selfBindButton"

		arg_1_0:addElement(arg_1_0.bindButton)
	end

	arg_1_0.bindButton:registerEventHandler("button_alt1", function(arg_7_0, arg_7_1)
		if not Engine.DBAEJAHFGJ(arg_7_1.controller) then
			if CONDITIONS.IsChallengeTabEnabled() then
				Challenge.FocusTab(arg_7_0, arg_7_1)
			else
				ACTIONS.OpenMenu("BarracksChallenges", true, arg_7_1.controller)
			end
		else
			LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_7_1.controller, false)
		end
	end)
	OPERATOR.ShowGhostTeaser(arg_1_1, arg_1_0)
	arg_1_0:addEventHandler("menu_create", var_1_3)
	arg_1_0:addEventHandler("tab_create", var_1_3)
end

function SearchingForLobby(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_8_0.id = "SearchingForLobby"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("ChallengesSummary", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "Challenges"

	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1394, _1080p * 1824, _1080p * 216, _1080p * 716)
	var_8_0:addElement(var_8_4)

	var_8_0.Challenges = var_8_4

	local var_8_5

	if CONDITIONS.IsMatchSimToolEnabled(var_8_0) then
		local var_8_6 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_8_1
		})

		var_8_6.id = "StartSim"

		if CONDITIONS.IsMatchSimToolEnabled(var_8_0) then
			-- block empty
		end

		var_8_6.Text:SetLeft(_1080p * 20, 0)
		var_8_6.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BEGIN_SIMULATION"), 0)
		var_8_6.Text:SetAlignment(LUI.Alignment.Left)
		var_8_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 1539, _1080p * -130, _1080p * 716, _1080p * 796)
		var_8_0:addElement(var_8_6)

		var_8_0.StartSim = var_8_6
	end

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("LobbyStatusPanel", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "LobbyStatusPanel"

	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 258, _1080p * 861)
	var_8_0:addElement(var_8_8)

	var_8_0.LobbyStatusPanel = var_8_8

	var_0_0(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("SearchingForLobby", SearchingForLobby)
LockTable(_M)
