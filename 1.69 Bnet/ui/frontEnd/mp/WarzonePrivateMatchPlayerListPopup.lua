module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = SQUAD.GetAllPlayersList(false)

	if var_1_0 and #var_1_0 > 0 then
		arg_1_0._playersNum = #var_1_0

		arg_1_0.PlayerList:SetNumChildren(arg_1_0._playersNum)
		arg_1_0.PlayerList:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
			local var_2_0 = arg_1_0.PlayerList:GetContentIndex(arg_2_1, arg_2_2, {
				relativePosition = false
			})
			local var_2_1 = SQUAD.GetAllPlayersList(false)[var_2_0 + 1]

			if var_2_1 then
				var_2_1.enableButtonAction = true
				var_2_1.index = var_2_1.index + 1

				arg_2_0:SetupSquadMember(arg_1_1, var_2_1)
			end
		end)
		arg_1_0.PlayerList:SetDefaultFocus({
			x = 0,
			y = 0
		})
		arg_1_0.PlayerList:processEvent({
			name = "gain_focus",
			controller = arg_1_1
		})
		arg_1_0.PlayerList:RefreshContent()
		arg_1_0.WZSmallPlayerCard:FillWithPlayerData(arg_1_1, var_1_0[1])
	end
end

local function var_0_1(arg_3_0, arg_3_1)
	if arg_3_1 == 1 then
		arg_3_0._playerAlone = true

		local var_3_0 = arg_3_0:getParent()

		if var_3_0 and var_3_0.id == "Container" then
			var_3_0:RemoveButtonHelperText("button_alt1", "right")
		end
	else
		arg_3_0._playerAlone = false

		local var_3_1 = arg_3_0:getParent()

		if var_3_1 and var_3_1.id == "Container" then
			local var_3_2 = Lobby.FJCJFBBF() and "LUA_MENU/UNMUTE_ALL" or "LUA_MENU/MUTE_ALL"

			var_3_1:RemoveButtonHelperText("button_alt1", "right")
			var_3_1:AddButtonHelperText({
				side = "right",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC(var_3_2)
			})
		end
	end
end

local function var_0_2(arg_4_0, arg_4_1)
	local var_4_0 = PRIVATE_MATCH.GetLobbyMaxPlayerCount()
	local var_4_1 = PRIVATE_MATCH.GetLobbyCurrentPlayerCount()

	arg_4_0.LobbyCount:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/LOBBY_COUNT", var_4_1, var_4_0))
	var_0_1(arg_4_0, var_4_1)

	arg_4_0._playersNum = var_4_1
end

local function var_0_3(arg_5_0, arg_5_1)
	arg_5_0.lobbyTimer = LUI.UITimer.new({
		interval = 1000,
		event = "update_view_player_list"
	})
	arg_5_0.lobbyTimer.id = "PlayerListTimer"

	arg_5_0:addElement(arg_5_0.lobbyTimer)
	arg_5_0:addEventHandler("update_view_player_list", function(arg_6_0, arg_6_1)
		local var_6_0 = PRIVATE_MATCH.GetLobbyCurrentPlayerCount()

		if var_6_0 > 0 and arg_6_0._playersNum ~= var_6_0 then
			arg_5_0._playersNum = var_6_0

			arg_5_0.PlayerList:SetNumChildren(var_6_0)

			local var_6_1 = PRIVATE_MATCH.GetLobbyMaxPlayerCount()

			arg_5_0.LobbyCount:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/LOBBY_COUNT", var_6_0, var_6_1))
			var_0_1(arg_5_0, var_6_0)
		end

		arg_5_0.PlayerList:RefreshContent()
	end)
end

local function var_0_4(arg_7_0, arg_7_1, arg_7_2)
	if not arg_7_0._playerAlone then
		local var_7_0 = arg_7_2.controllerIndex
		local var_7_1 = not Lobby.FJCJFBBF()

		Lobby.BFGAACEHBH(arg_7_2.controller, var_7_1)

		local var_7_2 = var_7_1 and "LUA_MENU/UNMUTE_ALL" or "LUA_MENU/MUTE_ALL"

		arg_7_1:RemoveButtonHelperText("button_alt1", "right")
		arg_7_1:AddButtonHelperText({
			side = "right",
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC(var_7_2)
		})
		arg_7_0:processEvent({
			name = "update_view_player_list",
			controllerIndex = var_7_0
		})
	end

	return true
end

local function var_0_5(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU_MP/VIEW_PLAYERS"))

	arg_8_0.AltOneButtonOverride = var_0_4

	var_0_3(arg_8_0, arg_8_1)
	var_0_0(arg_8_0, arg_8_1)
	arg_8_0:addEventHandler("menu_create", function(arg_9_0, arg_9_1)
		var_0_2(arg_9_0, arg_8_1)
	end)
	arg_8_0:registerEventHandler("wz_private_match_player_on_focus", function(arg_10_0, arg_10_1)
		arg_10_0.WZSmallPlayerCard:FillWithPlayerData(arg_8_1, arg_10_1.playerData)
	end)
end

function WarzonePrivateMatchPlayerListPopup(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 1080 * _1080p)

	var_11_0.id = "WarzonePrivateMatchPlayerListPopup"

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "PlayercardScrollbar"

	var_11_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 583, _1080p * 599, _1080p * 312, _1080p * 872)
	var_11_0:addElement(var_11_4)

	var_11_0.PlayercardScrollbar = var_11_4

	local var_11_5
	local var_11_6 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 10,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = true,
		springCoefficient = 400,
		controllerIndex = var_11_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("WarzonePrivateMatchSquadTeamMember", {
				controllerIndex = var_11_1
			})
		end,
		refreshChild = function(arg_13_0, arg_13_1, arg_13_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 436,
		rowHeight = _1080p * 38,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_11_7 = LUI.UIGrid.new(var_11_6)

	var_11_7.id = "PlayerList"

	var_11_7:setUseStencil(true)
	var_11_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 79, _1080p * 529, _1080p * 312, _1080p * 872)
	var_11_0:addElement(var_11_7)

	var_11_0.PlayerList = var_11_7

	local var_11_8
	local var_11_9 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_11_1
	})

	var_11_9.id = "MenuTitle"

	var_11_9.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/VIEW_PLAYERS")), 0)
	var_11_9.Line:SetLeft(0, 0)
	var_11_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_11_0:addElement(var_11_9)

	var_11_0.MenuTitle = var_11_9

	local var_11_10
	local var_11_11 = LUI.UIStyledText.new()

	var_11_11.id = "LobbyCount"

	var_11_11:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_11_11:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/WZ_PRIVATE_MATCH_REQUIRMENT"), 0)
	var_11_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_11:SetWordWrap(false)
	var_11_11:SetAlignment(LUI.Alignment.Left)
	var_11_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 79, _1080p * 509, _1080p * 119, _1080p * 143)
	var_11_0:addElement(var_11_11)

	var_11_0.LobbyCount = var_11_11

	local var_11_12
	local var_11_13 = MenuBuilder.BuildRegisteredType("WZSmallPlayerCard", {
		controllerIndex = var_11_1
	})

	var_11_13.id = "WZSmallPlayerCard"

	var_11_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 73, _1080p * 593, _1080p * 160, _1080p * 284)
	var_11_0:addElement(var_11_13)

	var_11_0.WZSmallPlayerCard = var_11_13

	local var_11_14 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_11_4,
		startCap = var_11_4.startCap,
		endCap = var_11_4.endCap,
		sliderArea = var_11_4.sliderArea,
		slider = var_11_4.sliderArea and var_11_4.sliderArea.slider,
		fixedSizeSlider = var_11_4.sliderArea and var_11_4.sliderArea.fixedSizeSlider
	})

	var_11_7:AddScrollbar(var_11_14)
	var_0_5(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("WarzonePrivateMatchPlayerListPopup", WarzonePrivateMatchPlayerListPopup)
LockTable(_M)
