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
		Lobby.UpdateClientCharactersDelayed(arg_1_0, arg_1_1, var_1_5, function(arg_6_0)
			arg_1_0._clientCharacterMap = arg_6_0

			Lobby.UpdateCharacterDetailsWidgets(arg_1_0._clientCharacterMap, arg_1_0.characterDetailsWidgets, arg_1_1)
		end)
	end)

	if CONDITIONS.IsMatchSimToolEnabled(arg_1_0) then
		assert(arg_1_0.StartSim)
		arg_1_0.StartSim:addEventHandler("button_action", function(arg_7_0, arg_7_1)
			MatchSimulator.ShowGameOverScreen()
		end)
	end

	if not arg_1_0.bindButton then
		arg_1_0.bindButton = LUI.UIBindButton.new()
		arg_1_0.bindButton.id = "selfBindButton"

		arg_1_0:addElement(arg_1_0.bindButton)
	end

	arg_1_0.bindButton:registerEventHandler("button_alt1", function(arg_8_0, arg_8_1)
		if not Engine.DBAEJAHFGJ(arg_8_1.controller) then
			if CONDITIONS.IsChallengeTabEnabled() then
				Challenge.FocusTab(arg_8_0, arg_8_1)
			else
				ACTIONS.OpenMenu("BarracksChallenges", true, arg_8_1.controller)
			end
		else
			LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_8_1.controller, false)
		end
	end)
	OPERATOR.ShowGhostTeaser(arg_1_1, arg_1_0)
	arg_1_0:addEventHandler("menu_create", var_1_3)
	arg_1_0:addEventHandler("tab_create", var_1_3)

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_1_0, "WZSetup")
	end
end

function SearchingForLobby(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_9_0.id = "SearchingForLobby"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3

	if CONDITIONS.IsMatchSimToolEnabled() then
		var_9_3 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_9_1
		})
		var_9_3.id = "StartSim"

		if CONDITIONS.IsMatchSimToolEnabled() then
			-- block empty
		end

		var_9_3.Text:SetLeft(_1080p * 20, 0)
		var_9_3.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BEGIN_SIMULATION"), 0)
		var_9_3.Text:SetAlignment(LUI.Alignment.Center)
		var_9_3:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 1573, _1080p * -96, _1080p * 716, _1080p * 796)
		var_9_0:addElement(var_9_3)

		var_9_0.StartSim = var_9_3
	end

	local var_9_4
	local var_9_5 = MenuBuilder.BuildRegisteredType("LobbyStatusPanel", {
		controllerIndex = var_9_1
	})

	var_9_5.id = "LobbyStatusPanel"

	var_9_5:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 96, _1080p * 596, _1080p * -302, _1080p * 301)
	var_9_0:addElement(var_9_5)

	var_9_0.LobbyStatusPanel = var_9_5

	local var_9_6
	local var_9_7 = MenuBuilder.BuildRegisteredType("ChallengesSummary", {
		controllerIndex = var_9_1
	})

	var_9_7.id = "Challenges"

	var_9_7:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -526, _1080p * -96, _1080p * -358, _1080p * 142)
	var_9_0:addElement(var_9_7)

	var_9_0.Challenges = var_9_7

	local function var_9_8()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_8

	local var_9_9

	if CONDITIONS.IsMatchSimToolEnabled() then
		local var_9_10 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Top_Anchor
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Bottom_Anchor
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -793
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -542
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 382
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 462
			}
		}

		var_9_3:RegisterAnimationSequence("WZSetup", var_9_10)
	end

	local function var_9_11()
		if CONDITIONS.IsMatchSimToolEnabled() then
			var_9_3:AnimateSequence("WZSetup")
		end
	end

	var_9_0._sequences.WZSetup = var_9_11

	var_0_0(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("SearchingForLobby", SearchingForLobby)
LockTable(_M)
