module(..., package.seeall)

function GameBattleMatchLobby(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIHorizontalNavigator.new()

	var_1_0.id = "GameBattleMatchLobby"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	var_1_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_1_1
	})
	var_1_0.HelperBar.id = "HelperBar"

	var_1_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_1_0.HelperBar:setPriority(10)
	var_1_0:addElement(var_1_0.HelperBar)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "TabBacker"

	var_1_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_1_0:addElement(var_1_4)

	var_1_0.TabBacker = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "MenuTitle"

	var_1_6.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_GAME_CAPS"), 0)
	var_1_6.Line:SetLeft(0, 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_1_0:addElement(var_1_6)

	var_1_0.MenuTitle = var_1_6

	local var_1_7
	local var_1_8 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_1_1
			})
		end,
		controllerIndex = var_1_1
	}
	local var_1_9 = LUI.TabManager.new(var_1_8)

	var_1_9.id = "Tabs"

	var_1_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 996, _1080p * 108, _1080p * 160)
	var_1_0:addElement(var_1_9)

	var_1_0.Tabs = var_1_9

	local var_1_10
	local var_1_11 = MenuBuilder.BuildRegisteredType("SocialPartyWidget", {
		controllerIndex = var_1_1
	})

	var_1_11.id = "PartyWidget"

	var_1_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1224, _1080p * 1824, _1080p * 94, _1080p * 264)
	var_1_0:addElement(var_1_11)

	var_1_0.PartyWidget = var_1_11

	local var_1_12
	local var_1_13 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_1_1
	})

	var_1_13.id = "LobbyMembersFooter"

	var_1_13:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_1_0:addElement(var_1_13)

	var_1_0.LobbyMembersFooter = var_1_13

	local var_1_14

	if CONDITIONS.IsUserSignedInDemonware(var_1_1) then
		local var_1_15 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_1_1
		})

		var_1_15.id = "MPPlayerDetails"

		var_1_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_1_0:addElement(var_1_15)

		var_1_0.MPPlayerDetails = var_1_15
	end

	return var_1_0
end

MenuBuilder.registerType("GameBattleMatchLobby", GameBattleMatchLobby)
LockTable(_M)
