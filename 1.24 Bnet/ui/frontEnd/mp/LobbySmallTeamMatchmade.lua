module(..., package.seeall)

local var_0_0 = {
	Enemy = 2,
	Friendly = 1
}

local function var_0_1(arg_1_0, arg_1_1)
	assert(arg_1_0.LobbyTeamDetails)

	if not arg_1_0.lobbyMemberGrid then
		arg_1_0.lobbyMemberGrid = MenuBuilder.BuildRegisteredType("LobbyMemberGrid", {
			modelPath = Lobby.AllMembersPath,
			controllerIndex = arg_1_1
		})

		arg_1_0.lobbyMemberGrid:setPriority(-100)
		arg_1_0:addElement(arg_1_0.lobbyMemberGrid)
		arg_1_0.lobbyMemberGrid:processEvent({
			name = "gain_focus"
		})
	end

	arg_1_0:SetClientCharacterData(arg_1_1)
end

local function var_0_2(arg_2_0, arg_2_1)
	assert(arg_2_0.LobbyTeamDetails)
	assert(arg_2_0.currentTeamView)
	assert(arg_2_0.LobbyTeamDetails.LobbyTeamSwitcher)

	arg_2_0.LobbyTeamDetails.LobbyTeamSwitcher.m_requireFocusType = FocusType.MouseOver

	FrontEndScene.HideAllCharacters()

	local var_2_0
	local var_2_1
	local var_2_2 = Lobby.GetLocalClientTeam(arg_2_1)
	local var_2_3 = MP.GetFactionReference(var_2_2)
	local var_2_4 = MP.GetFactionReference(Teams.axis)
	local var_2_5 = MP.GetFactionReference(Teams.allies)
	local var_2_6 = MP.GetTeamLogo(Teams.allies, var_2_2, var_2_5, true)

	if arg_2_0.currentTeamView == var_0_0.Enemy then
		if var_2_2 == Teams.allies then
			arg_2_0.LobbyTeamDetails.SuperfactionName:setText(Engine.CBEAHDFCFC(MP.GetTeamName(Teams.axis)))

			var_2_6 = MP.GetTeamLogo(Teams.axis, var_2_2, var_2_4, true)

			Engine.BJDBIAGIDA(CoD.SFX.LobbyTextAllegiance)
		else
			arg_2_0.LobbyTeamDetails.SuperfactionName:setText(Engine.CBEAHDFCFC(MP.GetTeamName(Teams.allies)))

			var_2_6 = MP.GetTeamLogo(Teams.allies, var_2_2, var_2_5, true)

			Engine.BJDBIAGIDA(CoD.SFX.LobbyTextCoalition)
		end

		var_2_0 = "LUA_MENU/VIEW_YOUR_TEAM"
		var_2_1 = "LUA_MENU/ENEMY_TEAM"
	else
		arg_2_0.LobbyTeamDetails.SuperfactionName:setText(Engine.CBEAHDFCFC(MP.GetTeamName(var_2_2)))

		var_2_6 = MP.GetTeamLogo(var_2_2, var_2_2, var_2_3, true)
		var_2_0 = "LUA_MENU/VIEW_ENEMY_TEAM"
		var_2_1 = "LUA_MENU/YOUR_TEAM"

		Engine.BJDBIAGIDA(var_2_2 == Teams.allies and CoD.SFX.LobbyTextCoalition or CoD.SFX.LobbyTextAllegiance)
	end

	arg_2_0.LobbyTeamDetails.FactionIcon:setImage(RegisterMaterial(var_2_6))
	arg_2_0.LobbyTeamDetails.LobbyTeamSwitcher.StyledLabel:setText(Engine.CBBHFCGDIC(arg_2_0.currentTeamView == var_0_0.Enemy and "LUA_MENU/VIEW_YOUR_TEAM" or "LUA_MENU/VIEW_ENEMY_TEAM"))
	arg_2_0.LobbyTeamDetails.TeamSwitchName:setText(Engine.CBBHFCGDIC(var_2_0))
	arg_2_0.LobbyTeamDetails.TeamViewName:setText(Engine.CBBHFCGDIC(var_2_1))

	local var_2_7 = arg_2_0.LobbyTeamDetails:GetCurrentAnchorsAndPositions().right
	local var_2_8 = LAYOUT.GetElementWidth(arg_2_0.LobbyTeamDetails.FactionIcon) / 2
	local var_2_9 = LAYOUT.GetTextWidth(arg_2_0.LobbyTeamDetails.SuperfactionName)
	local var_2_10 = LAYOUT.GetTextWidth(arg_2_0.LobbyTeamDetails.TeamSwitchName)
	local var_2_11 = LAYOUT.GetTextWidth(arg_2_0.LobbyTeamDetails.TeamViewName)
	local var_2_12 = var_2_10 < var_2_9 and var_2_9 or var_2_10

	var_2_12 = var_2_11 < var_2_12 and var_2_12 or var_2_11

	arg_2_0.LobbyTeamDetails:SetLeft(-var_2_12 - var_2_8 + var_2_7)
end

function Lobby.DumpStreamingRequests(arg_3_0, arg_3_1)
	assert(#arg_3_0 == #arg_3_1)
	DebugPrint("")
	DebugPrint("Streaming Request Start...................................")

	for iter_3_0 = 1, #arg_3_0 do
		DebugPrint("Body: " .. arg_3_0[iter_3_0] .. ", " .. "Head: " .. arg_3_1[iter_3_0])
	end

	DebugPrint("Streaming Request End...................................")
	DebugPrint("")
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = Lobby.GetLocalClientTeam(arg_4_1)
	local var_4_1

	if arg_4_0.currentTeamView == var_0_0.Friendly then
		var_4_1 = var_4_0
	elseif var_4_0 == Teams.allies then
		var_4_1 = Teams.axis
	else
		var_4_1 = Teams.allies
	end

	local var_4_2 = {
		widget = arg_4_0,
		teamFilter = var_4_1
	}

	arg_4_0._clientCharacterMap = Lobby.UpdateClientCharacters(arg_4_1, var_4_2)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	Engine.DHFCHIIJCA("squad_lobby")

	arg_5_0.SetClientCharacterData = var_0_3
	arg_5_0.SwitchTeamView = var_0_2
	arg_5_0.currentTeamView = var_0_0.Friendly

	arg_5_0:SetClientCharacterData(arg_5_1)
	arg_5_0:SwitchTeamView(arg_5_1)
	arg_5_0:registerEventHandler("lobby_member_on_over", function(arg_6_0, arg_6_1)
		arg_6_0:SetDataSource(arg_6_1.dataSource, arg_6_1.controller)

		return true
	end)

	arg_5_0._focusArrow = Lobby.BuildFocusArrowWidget(arg_5_0, arg_5_1)

	local function var_5_0()
		Lobby.UpdateFocusArrow(arg_5_0, arg_5_0._focusArrow, arg_5_1, arg_5_0.clientCharacterData)
	end

	arg_5_0:SubscribeToModelThroughElement(arg_5_0, "memberIndex", var_5_0)

	local var_5_1 = LUI.UIBindButton.new()

	var_5_1.id = "bindButton"

	arg_5_0:addElement(var_5_1)

	arg_5_0.bindButton = var_5_1

	local function var_5_2(arg_8_0, arg_8_1)
		if arg_5_0.currentTeamView ~= var_0_0.Friendly then
			arg_5_0.currentTeamView = var_0_0.Friendly

			arg_5_0:SwitchTeamView(arg_5_1)
		end

		if arg_5_0._focusArrow then
			arg_5_0._focusArrow:SetAlpha(1, 250)
		end
	end

	local function var_5_3(arg_9_0, arg_9_1)
		if arg_5_0.currentTeamView ~= var_0_0.Enemy then
			arg_5_0.currentTeamView = var_0_0.Enemy

			arg_5_0:SwitchTeamView(arg_5_1)
		end

		if arg_5_0._focusArrow then
			arg_5_0._focusArrow:SetAlpha(0, 100)
		end
	end

	local function var_5_4(arg_10_0, arg_10_1)
		if arg_5_0.currentTeamView == var_0_0.Friendly then
			var_5_3(arg_10_0, arg_10_1)
		else
			var_5_2(arg_10_0, arg_10_1)
		end

		Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
	end

	arg_5_0.bindButton:addEventHandler("button_alt1", var_5_4)
	arg_5_0.LobbyTeamDetails.LobbyTeamSwitcher:addEventHandler("leftmouseup", var_5_4)

	local var_5_5 = LUI.UITimer.new({
		interval = 1000,
		event = "update_lobby"
	})

	var_5_5.id = "lobbyTimer"

	arg_5_0:addElement(var_5_5)
	arg_5_0:registerEventHandler("update_lobby", function(arg_11_0, arg_11_1)
		var_0_1(arg_11_0, arg_5_1)
	end)
	OPERATOR.ShowGhostTeaser(arg_5_1, arg_5_0)
end

function LobbySmallTeamMatchmade(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_12_0.id = "LobbySmallTeamMatchmade"

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = MenuBuilder.BuildRegisteredType("LobbyTeamDetails", {
		controllerIndex = var_12_1
	})

	var_12_4.id = "LobbyTeamDetails"

	var_12_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -445, _1080p * -96, _1080p * 193, _1080p * 316)
	var_12_0:addElement(var_12_4)

	var_12_0.LobbyTeamDetails = var_12_4

	local var_12_5
	local var_12_6 = MenuBuilder.BuildRegisteredType("LobbyMap", {
		controllerIndex = var_12_1
	})

	var_12_6.id = "LobbyMap"

	var_12_6:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 526, _1080p * -231, _1080p * -101)
	var_12_0:addElement(var_12_6)

	var_12_0.LobbyMap = var_12_6

	var_0_4(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("LobbySmallTeamMatchmade", LobbySmallTeamMatchmade)
LockTable(_M)
