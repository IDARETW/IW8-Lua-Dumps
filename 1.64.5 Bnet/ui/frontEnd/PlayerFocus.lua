module(..., package.seeall)
FrontEndScene.RegisterScene("PlayerFocus", "squad_lobby")

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if not arg_1_0.lobbyMemberGrid then
		arg_1_2 = arg_1_2 or {}
		arg_1_2.controllerIndex = arg_1_1
		arg_1_2.modelPath = Lobby.AllMembersPath
		arg_1_2.parent = arg_1_0
		arg_1_0.lobbyMemberGrid = MenuBuilder.BuildRegisteredType("LobbyMemberGrid", arg_1_2)

		arg_1_0:addElement(arg_1_0.lobbyMemberGrid)
		arg_1_0.lobbyMemberGrid:processEvent({
			name = "gain_focus"
		})
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	FrontEndScene.HideAllCharacters()

	local var_2_0 = DataSources.frontEnd.lobby.memberCount

	local function var_2_1()
		var_0_0(arg_2_0, arg_2_1, arg_2_2)
	end

	arg_2_0:SubscribeToModel(var_2_0:GetModel(arg_2_1), var_2_1)

	local function var_2_2()
		local var_4_0 = arg_2_0:GetDataSource()

		arg_2_0.PlayerFocusDetails:SetDataSource(var_4_0, arg_2_1)

		local var_4_1
		local var_4_2
		local var_4_3 = var_4_0.selectedOperatorIndex:GetValue(arg_2_1)

		if var_4_3 then
			if var_4_3 == OPERATOR.SuperFaction.WEST then
				var_4_1 = var_4_0.bodyWest:GetValue(arg_2_1)
				var_4_2 = var_4_0.headWest:GetValue(arg_2_1)
			else
				var_4_1 = var_4_0.bodyEast:GetValue(arg_2_1)
				var_4_2 = var_4_0.headEast:GetValue(arg_2_1)
			end
		end

		if var_4_1 ~= nil and var_4_2 ~= nil then
			local var_4_4, var_4_5 = Lobby.GetHeadAndBodyModelsToUse(var_4_1, var_4_2, arg_2_1)
			local var_4_6 = Lobby.InferOperatorRefFromModel(var_4_4, var_4_5)

			if var_4_6 and #var_4_6 > 0 then
				arg_2_0.PlayerFocusOperatorInfo:SetInfo(var_4_6, var_4_4, var_4_5)
				FrontEndScene.RequestBodyModels({
					var_4_4
				})
				FrontEndScene.RequestHeadModels({
					var_4_5
				})
				Lobby.UpdateLocalClientCharacter(arg_2_1, FrontEndScene.ClientCharacters.LocalSquadMember, var_4_4, var_4_5, 1)
			end
		end
	end

	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "bodyWest", var_2_2)
	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "headWest", var_2_2)
	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "bodyEast", var_2_2)
	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "headEast", var_2_2)
	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "selectedOperatorIndex", var_2_2)
end

function PlayerFocus(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0.id = "PlayerFocus"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	var_5_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})
	var_5_0.HelperBar.id = "HelperBar"

	var_5_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_5_0.HelperBar:setPriority(10)
	var_5_0:addElement(var_5_0.HelperBar)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "MenuTitle"

	var_5_4.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAYER_LOBBY"), 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_5_0:addElement(var_5_4)

	var_5_0.MenuTitle = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("PlayerFocusDetails", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "PlayerFocusDetails"

	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 647, _1080p * 1197, _1080p * 154, _1080p * 979)
	var_5_0:addElement(var_5_6)

	var_5_0.PlayerFocusDetails = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("PlayerFocusOperatorInfo", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "PlayerFocusOperatorInfo"

	var_5_8.OperatorName:SetAlignment(LUI.Alignment.Left)
	var_5_8.OperatorFactionName:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1224, _1080p * 1824, _1080p * 415, _1080p * 665)
	var_5_0:addElement(var_5_8)

	var_5_0.PlayerFocusOperatorInfo = var_5_8

	var_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/VIEW_PROFILE")
	})

	local var_5_9 = LUI.UIBindButton.new()

	var_5_9.id = "selfBindButton"

	var_5_0:addElement(var_5_9)

	var_5_0.bindButton = var_5_9

	var_5_0.bindButton:addEventHandler("button_secondary", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_5_1
		end

		ACTIONS.LeaveMenu(var_5_0)
	end)
	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("PlayerFocus", PlayerFocus)
LockTable(_M)
