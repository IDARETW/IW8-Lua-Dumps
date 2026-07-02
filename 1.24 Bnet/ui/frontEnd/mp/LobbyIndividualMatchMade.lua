module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
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
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(arg_2_0.LobbyMatchOperatorDetails)
	assert(arg_2_0.currentSuperfactionOperatorToUse)

	if arg_2_0.currentSuperfactionOperatorToUse == OPERATOR.SuperFaction.WEST then
		arg_2_0.LobbyMatchOperatorDetails.SwitchFactionText:setText(Engine.CBBHFCGDIC("LUA_MENU/SWITCH_ALLEGIANCE"))
	else
		arg_2_0.LobbyMatchOperatorDetails.SwitchFactionText:setText(Engine.CBBHFCGDIC("LUA_MENU/SWITCH_COALITION"))
	end

	local var_2_0 = OPERATOR.GetEquippedOperatorName(arg_2_1, arg_2_0.currentSuperfactionOperatorToUse)

	arg_2_0.LobbyMatchOperatorDetails:UpdateOperatorDetails(var_2_0)

	local var_2_1, var_2_2 = OPERATOR.GetEquippedOperatorSkin(arg_2_1, arg_2_0.currentSuperfactionOperatorToUse)

	Lobby.UpdateLocalClientCharacter(arg_2_1, FrontEndScene.ClientCharacters.LocalSquadMember, var_2_1, var_2_2, 1, arg_2_0, nil, nil, nil, OPERATOR.GetPetForEquippedOperator(arg_2_1, arg_2_0.currentSuperfactionOperatorToUse))

	local var_2_3 = arg_2_0.LobbyMatchOperatorDetails:GetCurrentAnchorsAndPositions().right
	local var_2_4 = 20 * _1080p
	local var_2_5 = LAYOUT.GetTextWidth(arg_2_0.LobbyMatchOperatorDetails.OperatorName)
	local var_2_6 = LAYOUT.GetTextWidth(arg_2_0.LobbyMatchOperatorDetails.SwitchFactionText)
	local var_2_7 = LAYOUT.GetTextWidth(arg_2_0.LobbyMatchOperatorDetails.MatchOperator)
	local var_2_8 = var_2_6 < var_2_5 and var_2_5 or var_2_6

	var_2_8 = var_2_7 < var_2_8 and var_2_8 or var_2_7

	arg_2_0.LobbyMatchOperatorDetails:SetLeft(-var_2_8 - var_2_4 + var_2_3)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.UpdateOperatorDetail = var_0_1
	arg_3_0.currentSuperfactionOperatorToUse = OPERATOR.GetSelectedOperatorIndex(arg_3_1)

	Engine.DHFCHIIJCA("squad_lobby")
	arg_3_0:UpdateOperatorDetail(arg_3_1)

	local var_3_0 = LUI.UIBindButton.new()

	var_3_0.id = "bindButton"

	arg_3_0:addElement(var_3_0)

	arg_3_0.bindButton = var_3_0

	local function var_3_1(arg_4_0, arg_4_1)
		if arg_3_0.currentSuperfactionOperatorToUse == OPERATOR.SuperFaction.WEST then
			arg_3_0.currentSuperfactionOperatorToUse = OPERATOR.SuperFaction.EAST
		else
			arg_3_0.currentSuperfactionOperatorToUse = OPERATOR.SuperFaction.WEST
		end

		OPERATOR.SetSelectedOperatorIndex(arg_3_1, arg_3_0.currentSuperfactionOperatorToUse)
		arg_3_0:UpdateOperatorDetail(arg_3_1)
	end

	arg_3_0.bindButton:addEventHandler("button_alt1", var_3_1)
	var_0_0(arg_3_0, arg_3_1)
	OPERATOR.ShowGhostTeaser(arg_3_1, arg_3_0)
end

function LobbyIndividualMatchMade(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "LobbyIndividualMatchMade"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("LobbyMatchOperatorDetails", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "LobbyMatchOperatorDetails"

	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1503, _1080p * 1824, _1080p * 216, _1080p * 328)
	var_5_0:addElement(var_5_4)

	var_5_0.LobbyMatchOperatorDetails = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("LobbyMap", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "LobbyMap"

	var_5_6:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 526, _1080p * -231, _1080p * -101)
	var_5_0:addElement(var_5_6)

	var_5_0.LobbyMap = var_5_6

	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("LobbyIndividualMatchMade", LobbyIndividualMatchMade)
LockTable(_M)
