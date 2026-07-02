module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("GameSetup", {
	"host"
})

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	PRIVATE_MATCH.DisplayDevCheatWarning(arg_1_0)
	PROGRESSION.PrestreamGamemodeIcons(arg_1_0)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/GAME_SETUP_CAPS"))

	if not IsSystemLink() then
		local var_1_0 = LUI.UITimer.new({
			interval = 500,
			event = "update_lobby"
		})

		var_1_0.id = "lobbyTimer"

		arg_1_0:addElement(var_1_0)
		arg_1_0:registerEventHandler("update_lobby", function(arg_2_0, arg_2_1)
			local var_2_0 = {
				forceSuperfactionBasedOnTeam = true,
				widget = arg_1_0
			}

			Lobby.UpdateClientCharactersDelayed(arg_1_0, arg_1_1, var_2_0)
		end)
	end

	if Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() then
		Lobby.DIDBDHFDGG()
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
	assert(arg_1_0.Darken)
	ACTIONS.ScaleFullscreen(arg_1_0.Darken)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_1_0.TabBacker)
end

function GameSetup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIVerticalNavigator.new()

	var_3_0.id = "GameSetup"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	var_3_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_3_1
	})
	var_3_0.HelperBar.id = "HelperBar"

	var_3_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_3_0.HelperBar:setPriority(10)
	var_3_0:addElement(var_3_0.HelperBar)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = {
		worldBlur = 1,
		controllerIndex = var_3_1
	}
	local var_3_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_3_4)

	var_3_5.id = "WorldBlur"

	var_3_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, _1080p * 54, 0)
	var_3_0:addElement(var_3_5)

	var_3_0.WorldBlur = var_3_5

	local var_3_6
	local var_3_7 = LUI.UIImage.new()

	var_3_7.id = "Darken"

	var_3_7:SetRGBFromInt(0, 0)
	var_3_7:SetAlpha(0.5, 0)
	var_3_0:addElement(var_3_7)

	var_3_0.Darken = var_3_7

	local var_3_8
	local var_3_9 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_3_1
	})

	var_3_9.id = "TabBacker"

	var_3_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_3_0:addElement(var_3_9)

	var_3_0.TabBacker = var_3_9

	local var_3_10
	local var_3_11 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_3_1
	})

	var_3_11.id = "MenuTitle"

	var_3_11.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GAME_SETUP_CAPS")), 0)
	var_3_11.Line:SetLeft(0, 0)
	var_3_11:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_3_0:addElement(var_3_11)

	var_3_0.MenuTitle = var_3_11

	local var_3_12
	local var_3_13 = MenuBuilder.BuildRegisteredType("GameSetupButtons", {
		controllerIndex = var_3_1
	})

	var_3_13.id = "GameSetupButtons"

	var_3_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 216, _1080p * 616)
	var_3_0:addElement(var_3_13)

	var_3_0.GameSetupButtons = var_3_13

	local var_3_14

	if CONDITIONS.InFrontendPublicMP(var_3_0) then
		local var_3_15 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_3_1
		})

		var_3_15.id = "MPPlayerDetails"

		var_3_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1404, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_3_0:addElement(var_3_15)

		var_3_0.MPPlayerDetails = var_3_15
	end

	local var_3_16

	if not CONDITIONS.IsPrivateMatchTournament(var_3_0) then
		local var_3_17 = MenuBuilder.BuildRegisteredType("GameSetupDetails", {
			controllerIndex = var_3_1
		})

		var_3_17.id = "GameSetupDetails"

		var_3_17.DisabledMessage:SetLeft(0, 0)
		var_3_17:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 696, _1080p * -286, _1080p * -131)
		var_3_0:addElement(var_3_17)

		var_3_0.GameSetupDetails = var_3_17
	end

	local var_3_18
	local var_3_19 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_3_1
	})

	var_3_19.id = "LobbyMembersFooter"

	var_3_19:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_3_0:addElement(var_3_19)

	var_3_0.LobbyMembersFooter = var_3_19

	var_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_3_20 = LUI.UIBindButton.new()

	var_3_20.id = "selfBindButton"

	var_3_0:addElement(var_3_20)

	var_3_0.bindButton = var_3_20

	var_3_0.bindButton:addEventHandler("button_secondary", function(arg_4_0, arg_4_1)
		if not arg_4_1.controller then
			local var_4_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("GameSetup", GameSetup)
LockTable(_M)
