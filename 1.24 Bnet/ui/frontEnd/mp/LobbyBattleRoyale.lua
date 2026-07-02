module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if Engine.BHICADFIHA() and Dvar.IBEGCHEFE("lui_debug_squad") then
		Lobby.DebugUpdateClientCharacters(arg_1_1, Dvar.IBEGCHEFE("lui_debug_tournament"), arg_1_0)

		return
	end

	if not arg_1_0.lobbyMemberGrid then
		local var_1_0 = {
			numRows = 4,
			numCols = 1,
			top = 314,
			bottom = 870,
			controllerIndex = arg_1_1,
			modelPath = Lobby.SquadMembersPath
		}

		arg_1_0.lobbyMemberGrid = MenuBuilder.BuildRegisteredType("LobbyMemberGrid", var_1_0)

		arg_1_0.lobbyMemberGrid:setPriority(-100)
		arg_1_0:addElement(arg_1_0.lobbyMemberGrid)
		arg_1_0.lobbyMemberGrid:processEvent({
			name = "gain_focus"
		})

		arg_1_0.LobbyBattleRoyaleButtons.navigation = {}
		arg_1_0.LobbyBattleRoyaleButtons.navigation.left = arg_1_0.lobbyMemberGrid
		arg_1_0.lobbyMemberGrid.navigation = {}
		arg_1_0.lobbyMemberGrid.navigation.right = arg_1_0.LobbyBattleRoyaleButtons
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.LobbyBattleRoyaleButtons.LobbyStartMatchButton:UpdateStatus(arg_2_1)

	local var_2_0 = LUI.FlowManager.GetCurrentMenu(arg_2_0)
	local var_2_1 = var_2_0 and var_2_0._isPublicBRLobby

	if Lobby.BGIADHIHAG() and not var_2_1 then
		arg_2_0.LobbyBattleRoyaleButtons.LobbyStartMatchButton:SetButtonDisabled(false)
		arg_2_0.LobbyBattleRoyaleButtons.LobbyMapButton:SetButtonDisabled(false)
	else
		arg_2_0.LobbyBattleRoyaleButtons.LobbyStartMatchButton:SetButtonDisabled(true)
		arg_2_0.LobbyBattleRoyaleButtons.LobbyMapButton:SetButtonDisabled(true)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.UpdateMatchStatusButton = var_0_1
	arg_3_0.UpdateClientCharacters = var_0_0

	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")

	local var_3_0 = {
		widget = arg_3_0,
		dataSourcePath = Lobby.SquadMembersPath
	}

	arg_3_0._clientCharacterMap = Lobby.UpdateClientCharacters(arg_3_1, var_3_0)

	arg_3_0:registerEventHandler("lobby_member_on_over", function(arg_4_0, arg_4_1)
		arg_4_0:SetDataSource(arg_4_1.dataSource, arg_4_1.controller)

		return true
	end)

	arg_3_0._focusArrow = Lobby.BuildFocusArrowWidget(arg_3_0, arg_3_1)

	local function var_3_1()
		Lobby.UpdateFocusArrow(arg_3_0, arg_3_0._focusArrow, arg_3_1)
	end

	arg_3_0:SubscribeToModelThroughElement(arg_3_0, "memberIndex", var_3_1)

	local var_3_2 = LUI.UITimer.new({
		interval = 1000,
		event = "update_lobby"
	})

	var_3_2.id = "lobbyTimer"

	arg_3_0:addElement(var_3_2)
	arg_3_0:registerEventHandler("update_lobby", function(arg_6_0, arg_6_1)
		arg_6_0._clientCharacterMap = Lobby.UpdateClientCharacters(arg_3_1, var_3_0)

		arg_6_0:UpdateClientCharacters(arg_3_1)
		arg_6_0:UpdateMatchStatusButton(arg_3_1)
	end)

	if not DataSources.frontEnd.lobby.battleRoyale.playlist:GetValue(arg_3_1) then
		DataSources.frontEnd.lobby.battleRoyale.playlist:SetValue(arg_3_1, Lobby.BRMatchType.SOLO)
	end
end

function LobbyBattleRoyale(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIVerticalNavigator.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_7_0.id = "LobbyBattleRoyale"
	var_7_0._animationSets = {}
	var_7_0._sequences = {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("LobbyBattleRoyaleButtons", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "LobbyBattleRoyaleButtons"

	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1523, _1080p * 1824, _1080p * 831, _1080p * 1026)
	var_7_0:addElement(var_7_4)

	var_7_0.LobbyBattleRoyaleButtons = var_7_4

	local function var_7_5()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_5

	local var_7_6 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1420
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1920
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1324,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1824,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_7_4:RegisterAnimationSequence("MenuOpen", var_7_6)

	local function var_7_7()
		var_7_4:AnimateSequence("MenuOpen")
	end

	var_7_0._sequences.MenuOpen = var_7_7

	var_0_2(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("LobbyBattleRoyale", LobbyBattleRoyale)
LockTable(_M)
