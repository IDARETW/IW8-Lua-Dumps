module(..., package.seeall)

local var_0_0 = 500

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = DataSources.frontEnd.lobby.memberMaxCount
	local var_1_1 = var_1_0:GetValue(arg_1_1)
	local var_1_2 = Dvar.CFHDGABACF("RRNTNNKNP")
	local var_1_3 = Lobby.AllMembersPath

	if var_1_2 > 1 then
		var_1_3 = Lobby.SquadMembersPath

		local var_1_4 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.squadMembers.count")

		local function var_1_5()
			local var_2_0 = var_1_4:GetValue(arg_1_1)
			local var_2_1 = Dvar.CFHDGABACF("RRNTNNKNP")
			local var_2_2 = math.min(var_2_0, var_2_1)

			if var_2_2 ~= nil then
				arg_1_0.SquadCount:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/SQUAD_COUNT", var_2_2, var_2_1))
			end
		end

		arg_1_0:SubscribeToModel(var_1_4:GetModel(arg_1_1), var_1_5)

		local var_1_6 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.squadMembers.memberCount")

		local function var_1_7()
			local var_3_0 = var_1_6:GetValue(arg_1_1)
			local var_3_1 = var_1_0:GetValue(arg_1_1)

			if var_3_0 ~= nil and var_3_1 ~= nil then
				arg_1_0.LobbyCount:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/LOBBY_COUNT", var_3_0, var_3_1))
			end
		end

		arg_1_0:SubscribeToModel(var_1_6:GetModel(arg_1_1), var_1_7)
		arg_1_0:SubscribeToModel(var_1_0:GetModel(arg_1_1), var_1_7)
	end

	local var_1_8 = {
		controllerIndex = arg_1_1,
		modelPath = var_1_3,
		parent = arg_1_0
	}

	arg_1_0.lobbyMemberGrid = MenuBuilder.BuildRegisteredType("LobbyMemberGrid", var_1_8)

	arg_1_0.lobbyMemberGrid:setPriority(-100)
	arg_1_0:addElement(arg_1_0.lobbyMemberGrid)
	arg_1_0.lobbyMemberGrid:processEvent({
		name = "gain_focus"
	})
	arg_1_0.lobbyMemberGrid.PlayerCount:SetAlpha(var_1_3 == Lobby.SquadMembersPath and 0 or 1)
	arg_1_0.SquadCount:SetAlpha(var_1_3 == Lobby.SquadMembersPath and 1 or 0)
	arg_1_0.LobbyCount:SetAlpha(var_1_3 == Lobby.SquadMembersPath and 1 or 0)

	if CONDITIONS.IsMatchSimToolEnabled(arg_1_0) then
		arg_1_0.lobbyMemberGrid.navigation = {}
		arg_1_0.lobbyMemberGrid.navigation.right = arg_1_0.StartSim
		arg_1_0.StartSim.navigation = {}
		arg_1_0.StartSim.navigation.left = arg_1_0.lobbyMemberGrid
	end
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.LobbyMap)
	arg_4_0.LobbyMap:SetAlpha(0)

	arg_4_0._isMapRevealed = false

	FrontEndScene.HideAllLobbyCharactersPastIndex(2)
	Engine.DHFCHIIJCA("squad_lobby")
	var_0_1(arg_4_0, arg_4_1)

	if not arg_4_0._characterTimer then
		arg_4_0._characterTimer = LUI.UITimer.new({
			interval = 1000,
			event = "update_client_characters"
		})
		arg_4_0._characterTimer.id = "lobbyTimer"

		arg_4_0:addElement(arg_4_0._characterTimer)
	end

	OPERATOR.ShowGhostTeaser(arg_4_1, arg_4_0)

	local var_4_0 = {
		maxCharactersToShow = FrontEndScene.MaxClientCharactersMPMainMenu,
		widget = arg_4_0,
		dataSourcePath = Lobby.SquadMembersPath
	}

	arg_4_0._clientCharacterMap = Lobby.UpdateClientCharacters(arg_4_1, var_4_0)

	arg_4_0:registerEventHandler("lobby_member_on_over", function(arg_5_0, arg_5_1)
		arg_5_0:SetDataSource(arg_5_1.dataSource, arg_5_1.controller)

		return true
	end)

	arg_4_0._focusArrow = Lobby.BuildFocusArrowWidget(arg_4_0, arg_4_1)

	local function var_4_1()
		Lobby.UpdateFocusArrow(arg_4_0, arg_4_0._focusArrow, arg_4_1, arg_4_0._clientCharacterMap)
	end

	arg_4_0:SubscribeToModelThroughElement(arg_4_0, "memberIndex", var_4_1)
	arg_4_0:registerEventHandler("update_client_characters", function(arg_7_0, arg_7_1)
		Lobby.UpdateClientCharactersDelayed(arg_4_0, arg_4_1, var_4_0, function(arg_8_0)
			arg_4_0._clientCharacterMap = arg_8_0
		end)
	end)
	Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.matchFound)

	if not arg_4_0.bindButton then
		arg_4_0.bindButton = LUI.UIBindButton.new()
		arg_4_0.bindButton.id = "selfBindButton"

		arg_4_0:addElement(arg_4_0.bindButton)
	end

	arg_4_0.bindButton:registerEventHandler("button_alt1", function(arg_9_0, arg_9_1)
		if not Engine.DBAEJAHFGJ(arg_9_1.controller) then
			if CONDITIONS.IsChallengeTabEnabled() then
				Challenge.FocusTab(arg_9_0, arg_9_1)
			else
				ACTIONS.OpenMenu("BarracksChallenges", true, arg_9_1.controller)
			end
		else
			LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_9_1.controller, false)
		end
	end)

	local var_4_2 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")
	local var_4_3 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.memberCount")

	function arg_4_0.GetPartyCount()
		local var_10_0 = var_4_2:GetValue(arg_4_1)
		local var_10_1 = var_4_3:GetValue(arg_4_1)
		local var_10_2 = 0

		if var_10_0 and var_10_1 then
			var_10_2 = math.max(var_10_0, var_10_1)
		end

		if var_10_2 == 0 then
			if var_10_0 then
				var_10_2 = var_10_0
			elseif var_10_1 then
				var_10_2 = var_10_1
			end
		end

		return var_10_2
	end

	arg_4_0._challengesPrompt = arg_4_0.Challenges:GetPromptContainer()

	local function var_4_4(arg_11_0, arg_11_1, arg_11_2)
		if arg_4_0:GetCurrentMenu() then
			arg_4_0:GetCurrentMenu().UpdateChallengePrompt(arg_11_0, arg_11_1, arg_11_2)
		end
	end

	local function var_4_5(arg_12_0)
		if arg_4_0:GetCurrentMenu() then
			arg_4_0:GetCurrentMenu():UpdateChallengePrompt()
		end
	end

	arg_4_0:SubscribeToModel(var_4_2:GetModel(arg_4_1), var_4_5)
	arg_4_0:SubscribeToModel(var_4_3:GetModel(arg_4_1), var_4_5)
	arg_4_0:addEventHandler("menu_create", var_4_4)
	arg_4_0:addEventHandler("tab_create", var_4_4)

	if CONDITIONS.IsMatchSimToolEnabled(arg_4_0) then
		assert(arg_4_0.StartSim)
		arg_4_0.StartSim:addEventHandler("button_action", function(arg_13_0, arg_13_1)
			MatchSimulator.ShowGameOverScreen()
		end)
	end

	local function var_4_6()
		if not arg_4_0._isMapRevealed then
			ACTIONS.AnimateSequence(arg_4_0, "MenuOpen")

			arg_4_0._isMapRevealed = true
		end
	end

	arg_4_0:SubscribeToModel(DataSources.frontEnd.lobby.mapName:GetModel(arg_4_1), var_4_6, true)

	arg_4_0:Wait(var_0_0).onComplete = function()
		var_4_6()
	end
end

function MatchmakingLobby(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIElement.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_16_0.id = "MatchmakingLobby"
	var_16_0._animationSets = var_16_0._animationSets or {}
	var_16_0._sequences = var_16_0._sequences or {}

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)

	local var_16_2 = var_16_0
	local var_16_3

	if CONDITIONS.IsMatchSimToolEnabled() then
		local var_16_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_16_1
		})

		var_16_4.id = "StartSim"

		if CONDITIONS.IsMatchSimToolEnabled() then
			-- block empty
		end

		var_16_4.Text:SetLeft(_1080p * 20, 0)
		var_16_4.Text:setText("BEGIN SIMULATION  ", 0)
		var_16_4.Text:SetAlignment(LUI.Alignment.Right)
		var_16_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 1574, _1080p * -96, _1080p * 707, _1080p * 787)
		var_16_0:addElement(var_16_4)

		var_16_0.StartSim = var_16_4
	end

	local var_16_5
	local var_16_6 = MenuBuilder.BuildRegisteredType("LobbyMap", {
		controllerIndex = var_16_1
	})

	var_16_6.id = "LobbyMap"

	var_16_6:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 526, _1080p * -231, _1080p * -101)
	var_16_0:addElement(var_16_6)

	var_16_0.LobbyMap = var_16_6

	local var_16_7
	local var_16_8 = LUI.UIText.new()

	var_16_8.id = "SquadCount"

	var_16_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_16_8:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/SQUAD_COUNT"), 0)
	var_16_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_16_8:SetAlignment(LUI.Alignment.Left)
	var_16_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 238)
	var_16_0:addElement(var_16_8)

	var_16_0.SquadCount = var_16_8

	local var_16_9
	local var_16_10 = LUI.UIText.new()

	var_16_10.id = "LobbyCount"

	var_16_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_16_10:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/LOBBY_COUNT"), 0)
	var_16_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_10:SetAlignment(LUI.Alignment.Left)
	var_16_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 183, _1080p * 211)
	var_16_0:addElement(var_16_10)

	var_16_0.LobbyCount = var_16_10

	local var_16_11
	local var_16_12 = MenuBuilder.BuildRegisteredType("ChallengesSummary", {
		controllerIndex = var_16_1
	})

	var_16_12.id = "Challenges"

	var_16_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1394, _1080p * 1824, _1080p * 216, _1080p * 716)
	var_16_0:addElement(var_16_12)

	var_16_0.Challenges = var_16_12

	local var_16_13
	local var_16_14 = MenuBuilder.BuildRegisteredType("BLMBanner", {
		controllerIndex = var_16_1
	})

	var_16_14.id = "BLMBanner"

	var_16_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 200, _1080p * 256)
	var_16_0:addElement(var_16_14)

	var_16_0.BLMBanner = var_16_14

	local function var_16_15()
		return
	end

	var_16_0._sequences.DefaultSequence = var_16_15

	local var_16_16
	local var_16_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_16_6:RegisterAnimationSequence("MenuOpen", var_16_17)

	local function var_16_18()
		var_16_6:AnimateSequence("MenuOpen")
	end

	var_16_0._sequences.MenuOpen = var_16_18

	var_0_2(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("MatchmakingLobby", MatchmakingLobby)
LockTable(_M)
