module(..., package.seeall)
LUI.FlowManager.RequestSetStack("WarzonePrivateMatchLobby", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	},
	{
		name = "BRMainMenu"
	}
})

local function var_0_0(arg_1_0, arg_1_1)
	return function(arg_2_0, arg_2_1)
		if arg_1_0._areWeGameHost then
			PRIVATE_MATCH.ClearupWZPrivateGameModeRecipe(arg_1_0)
		end

		Lobby.LeaveCustomGameLobby()
		LUI.FlowManager.RequestLeaveMenu(arg_1_0, true, true)
	end
end

local function var_0_1()
	if Dvar.IBEGCHEFE("TQRNTTMSL") then
		RANDOM.RollForAll()
	end
end

local function var_0_2(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1.controller or Engine.IJEBHJIJF()

	PRIVATE_MATCH.SetupPrivateMatchTabs(arg_4_0, var_4_0, {
		firstTabName = "LUA_MENU/PLAY",
		firstTabWidget = "WarzonePrivateMatchLobbyPlayMenu",
		leaveMenuFunction = function(arg_5_0, arg_5_1)
			if Lobby.EBFDFHJDJG(var_4_0) then
				Lobby.BEDBHJJHDC(var_4_0)
				Lobby.BJCJAHAGDC(false)
				arg_4_0:dispatchEventToChildren({
					name = "cancel_wz_private_match",
					controllerIndex = var_4_0
				})

				return
			end

			local var_5_0

			if Lobby.IsOurPrivatePartyHostInLobby() then
				var_5_0 = Engine.CBBHFCGDIC("@XBOXLIVE/LEAVEPARTYANDLOBBY")
			else
				var_5_0 = Engine.CBBHFCGDIC("@XBOXLIVE/LEAVELOBBY")
			end

			LUI.FlowManager.RequestPopupMenu(arg_4_0, "PopupYesNo", true, arg_5_1.controller, false, {
				yesAction = var_0_0(arg_4_0, var_4_0),
				message = var_5_0,
				actionSFX = SOUND_SETS.popups.privateSelect,
				popupSFX = SOUND_SETS.popups.privatePopup
			})

			return true
		end,
		callbackFunc = function(arg_6_0)
			local var_6_0 = arg_6_0 == 0

			Lobby.SetupReopenAAR(arg_4_0, var_4_0, var_6_0)
		end
	})
end

local function var_0_3(arg_7_0, arg_7_1)
	arg_7_0.bindButton = LUI.UIBindButton.new()
	arg_7_0.bindButton.id = "selfBindButton"

	arg_7_0:addElement(arg_7_0.bindButton)
	arg_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	arg_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	arg_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		priority = 1,
		side = "left",
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})
	arg_7_0.bindButton:addEventHandler("button_start", function(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_1.controller or arg_7_1

		ACTIONS.OpenOptionsMenu(var_8_0)
		ACTIONS.PlaySoundSetSound(arg_7_0, "selectAlt", false)
	end)
end

local function var_0_4(arg_9_0, arg_9_1)
	DebugPrint("wz private match ui_opensummary " .. tostring(Dvar.IBEGCHEFE("MQNNLTKNTS")))

	if Dvar.IBEGCHEFE("MQNNLTKNTS") == true then
		Lobby.OpenAfterActionReport(arg_9_1, false, true)
		Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
	end
end

local function var_0_5(arg_10_0, arg_10_1)
	MP_COMMON.SetupParty()
	MP_COMMON.SetupPrivateMatch()
	Lobby.DDDCGDHHJF(arg_10_1)
	Lobby.EAHFJBBBBD(PartyUIRoot.WZ_PRIVATE_MATCH_LOBBY)
	Lobby.CGHDJEDGHC(true)
	Engine.EAIBAGFDCD(CoD.PresenceContext.LOBBY)
end

local function var_0_6(arg_11_0, arg_11_1)
	local var_11_0 = LUI.FlowManager.GetScopedData(arg_11_0)

	var_11_0.isWarzone = true

	if not var_11_0.matchmakerSettings then
		var_11_0.matchmakerSettings = LUI.DeepCopy(Lobby.EMPTY_WARZONE_PRIVATE_MATCH)
	end
end

local function var_0_7(arg_12_0, arg_12_1, arg_12_2)
	Dvar.DHEGHJJJHI("LSTLQTSSRM", true)
	Engine.BJEAFDBHHJ()
	Dvar.BDEHAEGHAF("MOLPOSLOMO", "br")
	PRIVATE_MATCH.SetupPrivateMatchGameType(Lobby.MatchmakingGameType.GAME_TYPE_BR)
end

local function var_0_8(arg_13_0, arg_13_1, arg_13_2)
	assert(arg_13_0.MenuTitle)
	assert(arg_13_0.Tabs)
	assert(arg_13_0.HelperBar)
	arg_13_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/WARZONE_PRIVATE_MATCH"), Dvar.IBEGCHEFE("MQNNLTKNTS"))
	var_0_5(arg_13_0, arg_13_1)
	var_0_6(arg_13_0, arg_13_1)
	PRIVATE_MATCH.SetupPrivateMatchLobbyScene(arg_13_0, arg_13_1)
	var_0_3(arg_13_0, arg_13_1)
	var_0_4(arg_13_0, arg_13_1)
	Lobby.DGDIGJDHH(Lobby.BotTeams.Friendly, 0)
	Lobby.DGDIGJDHH(Lobby.BotTeams.Enemy, 0)

	arg_13_0._areWeGameHost = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost"):GetValue(arg_13_1)

	arg_13_0:addEventHandler("menu_create", var_0_2)
	assert(arg_13_0.TabBacker)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_13_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrame(arg_13_0, arg_13_1)
	Lobby.PreloadViewHandsForLocalPlayer(arg_13_1)
	arg_13_0:registerEventHandler("wz_lobby_fade_out", function(arg_14_0, arg_14_1)
		arg_13_0.Fade:SetAlpha(1)
	end)

	if Dvar.IBEGCHEFE("MNMTKTRPPP") then
		Lobby.LeaveCustomGameLobby()
		LUI.FlowManager.RequestLeaveMenu(arg_13_0:GetCurrentMenu())
	end

	arg_13_0:addEventHandler("OverwolfDetectedEvent", function(arg_15_0, arg_15_1)
		Lobby.LeaveCustomGameLobby()
		LUI.FlowManager.RequestLeaveMenu(arg_13_0:GetCurrentMenu())
	end)
	LOADING.StreamLoadscreenImages(arg_13_0, arg_13_1)
end

function WarzonePrivateMatchLobby(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIElement.new()

	var_16_0.id = "WarzonePrivateMatchLobby"

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)
	var_0_7(var_16_0, var_16_1, arg_16_1)

	var_16_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_16_1
	})
	var_16_0.HelperBar.id = "HelperBar"

	var_16_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_16_0.HelperBar:setPriority(10)
	var_16_0:addElement(var_16_0.HelperBar)

	local var_16_2 = var_16_0
	local var_16_3
	local var_16_4 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_16_1
	})

	var_16_4.id = "TabBacker"

	var_16_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_16_0:addElement(var_16_4)

	var_16_0.TabBacker = var_16_4

	local var_16_5
	local var_16_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_16_1
	})

	var_16_6.id = "MenuTitle"

	var_16_6.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/WARZONE_PRIVATE_MATCH"), 0)
	var_16_6.Line:SetLeft(0, 0)
	var_16_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_16_0:addElement(var_16_6)

	var_16_0.MenuTitle = var_16_6

	local var_16_7
	local var_16_8 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_16_1
			})
		end,
		controllerIndex = var_16_1
	}
	local var_16_9 = LUI.TabManager.new(var_16_8)

	var_16_9.id = "Tabs"

	var_16_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 996, _1080p * 108, _1080p * 160)
	var_16_0:addElement(var_16_9)

	var_16_0.Tabs = var_16_9

	local var_16_10
	local var_16_11 = MenuBuilder.BuildRegisteredType("SocialPartyWidget", {
		controllerIndex = var_16_1
	})

	var_16_11.id = "PartyWidget"

	var_16_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1224, _1080p * 1824, _1080p * 94, _1080p * 264)
	var_16_0:addElement(var_16_11)

	var_16_0.PartyWidget = var_16_11

	local var_16_12
	local var_16_13 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_16_1
	})

	var_16_13.id = "LobbyMembersFooter"

	var_16_13:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_16_0:addElement(var_16_13)

	var_16_0.LobbyMembersFooter = var_16_13

	local var_16_14

	if CONDITIONS.IsUserSignedInDemonware(var_16_1) then
		local var_16_15 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_16_1
		})

		var_16_15.id = "MPPlayerDetails"

		var_16_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_16_0:addElement(var_16_15)

		var_16_0.MPPlayerDetails = var_16_15
	end

	local var_16_16
	local var_16_17 = LUI.UIImage.new()

	var_16_17.id = "Fade"

	var_16_17:SetRGBFromInt(0, 0)
	var_16_17:SetAlpha(0, 0)
	var_16_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -198, _1080p * 2081, _1080p * -145, _1080p * 1210)
	var_16_0:addElement(var_16_17)

	var_16_0.Fade = var_16_17

	var_0_8(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("WarzonePrivateMatchLobby", WarzonePrivateMatchLobby)
LUI.FlowManager.RegisterStackPushBehaviour("WarzonePrivateMatchLobby", var_0_1)
LockTable(_M)
