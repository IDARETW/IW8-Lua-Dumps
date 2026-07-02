module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.Vignette)
	assert(arg_1_0.GradientRight)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_1_0.GradientRight)

	if Engine.CGABICJHAI() then
		LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1, nil)
	end

	local function var_1_0()
		local var_2_0 = CoD.GetAspectRatioScaleAdjust(0.4)

		arg_1_0.Vignette:SetScale(var_2_0)
		arg_1_0.GradientRight:SetScale(var_2_0)
	end

	arg_1_0:addAndCallEventHandler("onVideoChange", var_1_0)
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = LUI.FlowManager.GetScopedData("WarzonePrivateMatchLobby")
	local var_3_1 = PRIVATE_MATCH.IsWZSoloGameModeLobby(arg_3_0, arg_3_1, arg_3_2)

	if not var_3_0.squadActionDisplayed and not var_3_1 and Lobby.BGIADHIHAG() then
		var_3_0.squadActionDisplayed = true

		LUI.FlowManager.RequestPopupMenu(nil, "LobbySquadActions", true, arg_3_1, false, {
			isWZPrivateMatch = true
		})
	end
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_2 then
		arg_4_0.LobbyMap:SetGameModeName(arg_4_1, arg_4_2)
	end
end

local function var_0_3(arg_5_0, arg_5_1)
	local var_5_0 = LUI.FlowManager.GetScopedData("WarzonePrivateMatchLobby")
	local var_5_1 = var_5_0.matchmakerSettings and var_5_0.matchmakerSettings.recipe and #var_5_0.matchmakerSettings.recipe > 0
	local var_5_2 = PRIVATE_MATCH.IsWZPrivateMatchRecipeReady(arg_5_0)

	if arg_5_0._areWeGameHost and not var_5_1 and not var_5_2 then
		arg_5_0.Fade:SetAlpha(1)
		arg_5_0:dispatchEventToCurrentMenu({
			name = "wz_lobby_fade_out"
		})

		arg_5_0:Wait(100).onComplete = function()
			LUI.FlowManager.RequestAddMenu("GameModes", true, arg_5_1 or event.controller, false, {
				isWarzonePrivateMatchHost = true,
				isWarzone = var_5_0.isWarzone,
				matchmakerSettings = var_5_0.matchmakerSettings
			}, false)
		end
	else
		if not Onboarding.WarzonePrivateMatch.WasCompleted(arg_5_0, arg_5_1) then
			LUI.FlowManager.RequestPopupMenu(arg_5_0, "onboardingpopup", true, arg_5_1, false, ONBOARDING_DATA.GetOnboardinWarzonePrivateMatchData())
			Onboarding.WarzonePrivateMatch.MarkCompleted(arg_5_0, arg_5_1)
		end

		var_0_1(arg_5_0, arg_5_1, arg_5_0._areWeGameHost)

		local var_5_3 = ""

		if var_5_0.matchmakerSettings and var_5_0.matchmakerSettings.name and #var_5_0.matchmakerSettings.name > 0 then
			var_5_3 = var_5_0.matchmakerSettings.name
		elseif var_5_0.wzGameRef and #var_5_0.wzGameRef > 0 then
			local var_5_4 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_5_0.wzGameRef, CSV.gameTypesTable.cols.name)

			if var_5_4 and #var_5_4 > 0 then
				var_5_3 = Engine.CBBHFCGDIC(var_5_4)
			end
		end

		var_0_2(arg_5_0, arg_5_1, var_5_3)
	end
end

local function var_0_4(arg_7_0)
	assert(arg_7_0._areWeGameHost ~= nil)

	if not arg_7_0._areWeGameHost then
		local var_7_0 = MatchRules.BIJEDCBCBH("recipeName")

		PRIVATE_MATCH.SetupWarzoneMinPlayerNum(var_7_0)
	end

	local var_7_1 = PRIVATE_MATCH.GetLobbyCurrentPlayerCount()
	local var_7_2 = PRIVATE_MATCH.GetLobbyMaxPlayerCount()
	local var_7_3 = PRIVATE_MATCH.GetLobbyMinPlayerCount()
	local var_7_4 = var_7_3 - var_7_1
	local var_7_5 = LUI.clamp(var_7_4, 0, var_7_3)

	arg_7_0.LobbyCount:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/WZ_PRIVATE_MATCH_REQUIRMENT", var_7_1, var_7_2, var_7_5))

	if arg_7_0._currentPlayerCount ~= var_7_1 then
		DebugPrint("WZ PRIVATE MATCH --------- current lobby player count has been changed \n")
		DebugPrint("Previous lobby player count: " .. tostring(arg_7_0._currentPlayerCount) .. " Current lobby player count: " .. tostring(var_7_1))

		arg_7_0._currentPlayerCount = var_7_1

		if arg_7_0._areWeGameHost then
			arg_7_0:dispatchEventToChildren({
				name = "wz_lobby_player_count_update",
				controllerIndex = controllerIndex
			})
		end
	end
end

local function var_0_5(arg_8_0)
	local var_8_0 = SQUAD.GetCurrentSquadCount()
	local var_8_1 = SQUAD.GetSquadSize()

	if SQUAD.GetPlayerSquadIndex() ~= -1 then
		local var_8_2 = Engine.CBBHFCGDIC("LUA_MENU_MP/SQUAD_NUMBER", SQUAD.GetPlayerSquadIndex())
		local var_8_3 = Engine.CBBHFCGDIC("LUA_MENU_MP/WZ_SQUAD_COUNT", var_8_0, var_8_1)

		arg_8_0.YourSquadCount:setText(var_8_2 .. " " .. var_8_3)
	else
		arg_8_0.YourSquadCount:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/NOT_ASSIGNED_SQUAD"))
	end

	local var_8_4, var_8_5, var_8_6, var_8_7 = arg_8_0.YourSquad:getLocalRect()
	local var_8_8 = LAYOUT.GetTextWidth(arg_8_0.YourSquad)
	local var_8_9, var_8_10, var_8_11, var_8_12 = arg_8_0.YourSquadCount:getLocalRect()
	local var_8_13 = LAYOUT.GetTextWidth(arg_8_0.YourSquadCount)
	local var_8_14 = 32 * _1080p
	local var_8_15

	if var_8_13 < var_8_8 then
		arg_8_0.YourSquadCount:SetRight(var_8_4 + var_8_8 - var_8_14)

		var_8_15 = arg_8_0.YourSquad
	else
		arg_8_0.YourSquad:SetRight(var_8_9 + var_8_13 - var_8_14)

		var_8_15 = arg_8_0.YourSquadCount
	end

	LAYOUT.SetTextBoxSize(var_8_15, arg_8_0.DoubleNotchedBacker, var_8_15:getText(), var_8_14, nil, LUI.Alignment.Left, 0)
end

local function var_0_6(arg_9_0, arg_9_1)
	Engine.DHFCHIIJCA("squad_lobby")

	arg_9_0.lobbyTimer = LUI.UITimer.new({
		interval = 500,
		event = "update_lobby"
	})
	arg_9_0.lobbyTimer.id = "lobbyTimer"

	arg_9_0:addElement(arg_9_0.lobbyTimer)
	arg_9_0:registerEventHandler("update_lobby", function(arg_10_0, arg_10_1)
		local var_10_0 = FrontEndScene.MaxLobbyCharacters
		local var_10_1 = {
			forceSuperfactionBasedOnTeam = false,
			maxCharactersToShow = var_10_0,
			widget = arg_9_0
		}

		Lobby.UpdateClientCharactersDelayed(arg_9_0, arg_9_1, var_10_1)
	end)
end

local function var_0_7(arg_11_0, arg_11_1)
	if MatchRules.EAIEFBHGJ() then
		var_0_5(arg_11_0)
		var_0_4(arg_11_0)
	end

	arg_11_0.lobbyTimer = LUI.UITimer.new({
		interval = 1000,
		event = "update_squad_count"
	})
	arg_11_0.lobbyTimer.id = "SquadCountTimer"

	arg_11_0:addElement(arg_11_0.lobbyTimer)
	arg_11_0:addEventHandler("update_squad_count", function(arg_12_0, arg_12_1)
		if MatchRules.EAIEFBHGJ() then
			var_0_5(arg_11_0)
			var_0_4(arg_11_0)
		end
	end)
end

local function var_0_8(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0._areWeGameHost = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost"):GetValue(arg_13_1)

	var_0_6(arg_13_0, arg_13_1)
	var_0_0(arg_13_0, arg_13_1)
	arg_13_0:addEventHandler("menu_create", function(arg_14_0, arg_14_1)
		var_0_3(arg_14_0, arg_13_1)
	end)
	var_0_7(arg_13_0)
end

function WarzonePrivateMatchLobbyPlayMenu(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIHorizontalNavigator.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_15_0.id = "WarzonePrivateMatchLobbyPlayMenu"

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = LUI.UIImage.new()

	var_15_4.id = "GradientRight"

	var_15_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_15_4:SetAlpha(0.5, 0)
	var_15_4:setImage(RegisterMaterial("gradient_curve"), 0)
	var_15_4:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * -900, _1080p * 160, _1080p * -70)
	var_15_0:addElement(var_15_4)

	var_15_0.GradientRight = var_15_4

	local var_15_5
	local var_15_6 = LUI.UIImage.new()

	var_15_6.id = "Vignette"

	var_15_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_15_6:SetAlpha(0.5, 0)
	var_15_6:setImage(RegisterMaterial("gradient_curve"), 0)
	var_15_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 900, _1080p * 160, _1080p * -70)
	var_15_0:addElement(var_15_6)

	var_15_0.Vignette = var_15_6

	local var_15_7
	local var_15_8 = MenuBuilder.BuildRegisteredType("WarzonePrivateMatchPlayMenuButtons", {
		controllerIndex = var_15_1
	})

	var_15_8.id = "WarzonePrivateMatchPlayMenuButtons"

	var_15_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 216, _1080p * 516)
	var_15_0:addElement(var_15_8)

	var_15_0.WarzonePrivateMatchPlayMenuButtons = var_15_8

	local var_15_9

	if CONDITIONS.AlwaysFalse(var_15_0) then
		local var_15_10 = MenuBuilder.BuildRegisteredType("LobbyMembers", {
			controllerIndex = var_15_1
		})

		var_15_10.id = "LobbyMembers"

		var_15_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 254, _1080p * 864, _1080p * 213, _1080p * 822)
		var_15_0:addElement(var_15_10)

		var_15_0.LobbyMembers = var_15_10
	end

	local var_15_11
	local var_15_12 = MenuBuilder.BuildRegisteredType("LobbyMap", {
		controllerIndex = var_15_1
	})

	var_15_12.id = "LobbyMap"

	var_15_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 83, _1080p * 539, _1080p * -349, _1080p * -105)
	var_15_0:addElement(var_15_12)

	var_15_0.LobbyMap = var_15_12

	local var_15_13
	local var_15_14 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_15_1
	})

	var_15_14.id = "DoubleNotchedBacker"

	var_15_14:SetAlpha(0.6, 0)
	var_15_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 602, _1080p * 874, _1080p * 213, _1080p * 319)
	var_15_0:addElement(var_15_14)

	var_15_0.DoubleNotchedBacker = var_15_14

	local var_15_15
	local var_15_16 = LUI.UIStyledText.new()

	var_15_16.id = "LobbyCount"

	var_15_16:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_15_16:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/WZ_PRIVATE_MATCH_REQUIRMENT"), 0)
	var_15_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_16:SetWordWrap(false)
	var_15_16:SetAlignment(LUI.Alignment.Left)
	var_15_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 183, _1080p * 207)
	var_15_0:addElement(var_15_16)

	var_15_0.LobbyCount = var_15_16

	local var_15_17
	local var_15_18 = LUI.UIStyledText.new()

	var_15_18.id = "YourSquad"

	var_15_18:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_15_18:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/YOUR_SQUAD")), 0)
	var_15_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_15_18:SetWordWrap(false)
	var_15_18:SetAlignment(LUI.Alignment.Left)
	var_15_18:SetOptOutRightToLeftAlignmentFlip(true)
	var_15_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 634, _1080p * 842, _1080p * 229, _1080p * 279)
	var_15_0:addElement(var_15_18)

	var_15_0.YourSquad = var_15_18

	local var_15_19
	local var_15_20 = LUI.UIStyledText.new()

	var_15_20.id = "YourSquadCount"

	var_15_20:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_15_20:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/WZ_SQUAD_COUNT"), 0)
	var_15_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_20:SetWordWrap(false)
	var_15_20:SetAlignment(LUI.Alignment.Left)
	var_15_20:SetOptOutRightToLeftAlignmentFlip(true)
	var_15_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 634, _1080p * 748, _1080p * 279, _1080p * 302)
	var_15_0:addElement(var_15_20)

	var_15_0.YourSquadCount = var_15_20

	local var_15_21
	local var_15_22 = LUI.UIImage.new()

	var_15_22.id = "Fade"

	var_15_22:SetRGBFromInt(0, 0)
	var_15_22:SetAlpha(0, 0)
	var_15_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -198, _1080p * 2081, _1080p * -145, _1080p * 1210)
	var_15_0:addElement(var_15_22)

	var_15_0.Fade = var_15_22

	var_0_8(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("WarzonePrivateMatchLobbyPlayMenu", WarzonePrivateMatchLobbyPlayMenu)
LockTable(_M)
