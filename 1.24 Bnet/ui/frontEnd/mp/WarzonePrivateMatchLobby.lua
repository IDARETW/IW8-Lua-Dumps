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
		Lobby.LeaveCustomGameLobby()
		LUI.FlowManager.RequestLeaveMenu(arg_1_0, true, true)
	end
end

local function var_0_1(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1.controller or Engine.IJEBHJIJF()

	PRIVATE_MATCH.SetupPrivateMatchTabs(arg_3_0, var_3_0, {
		firstTabName = "LUA_MENU/PLAY",
		firstTabWidget = "WarzonePrivateMatchLobbyPlayMenu",
		leaveMenuFunction = function(arg_4_0, arg_4_1)
			local var_4_0

			if Lobby.IsOurPrivatePartyHostInLobby() then
				var_4_0 = Engine.CBBHFCGDIC("@XBOXLIVE/LEAVEPARTYANDLOBBY")
			else
				var_4_0 = Engine.CBBHFCGDIC("@XBOXLIVE/LEAVELOBBY")
			end

			LUI.FlowManager.RequestPopupMenu(arg_3_0, "PopupYesNo", true, arg_4_1.controller, false, {
				yesAction = var_0_0(arg_3_0, var_3_0),
				message = var_4_0,
				actionSFX = SOUND_SETS.popups.privateSelect,
				popupSFX = SOUND_SETS.popups.privatePopup
			})

			return true
		end,
		callbackFunc = function(arg_5_0)
			local var_5_0 = arg_5_0 == 0

			Lobby.SetupReopenAAR(arg_3_0, var_3_0, var_5_0)
		end
	})
end

local function var_0_2(arg_6_0, arg_6_1)
	arg_6_0.bindButton = LUI.UIBindButton.new()
	arg_6_0.bindButton.id = "selfBindButton"

	arg_6_0:addElement(arg_6_0.bindButton)
	arg_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	arg_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	arg_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		priority = 1,
		side = "left",
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})
	arg_6_0.bindButton:addEventHandler("button_start", function(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_1.controller or arg_6_1

		ACTIONS.OpenOptionsMenu(var_7_0)
		ACTIONS.PlaySoundSetSound(arg_6_0, "selectAlt", false)
	end)
	arg_6_0.bindButton:addEventHandler("button_alt2", function(arg_8_0, arg_8_1)
		FRIENDS.OpenFriendsList(arg_8_1.controller)
	end)
end

local function var_0_3(arg_9_0, arg_9_1)
	if Dvar.IBEGCHEFE("MQNNLTKNTS") == true then
		Lobby.OpenAfterActionReport(arg_9_1, false, true)
		Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
	end
end

local function var_0_4(arg_10_0, arg_10_1)
	MP_COMMON.SetupParty()
	MP_COMMON.SetupPrivateMatch()
	Lobby.DDDCGDHHJF(arg_10_1)
	Lobby.EAHFJBBBBD(PartyUIRoot.WZ_PRIVATE_MATCH_LOBBY)
	Engine.EAIBAGFDCD(CoD.PresenceContext.LOBBY)
end

local function var_0_5(arg_11_0, arg_11_1, arg_11_2)
	Dvar.DHEGHJJJHI("LSTLQTSSRM", true)
	Engine.BJEAFDBHHJ()

	local var_11_0 = Dvar.CFHDGABACF("ROMTTTNL")

	Dvar.DFIJDJFIFD("OOTQKOTRM", var_11_0)
end

local function var_0_6(arg_12_0, arg_12_1, arg_12_2)
	assert(arg_12_0.MenuTitle)
	assert(arg_12_0.Tabs)
	assert(arg_12_0.HelperBar)

	local var_12_0 = LUI.FlowManager.GetScopedData(arg_12_0)

	var_12_0.isWarzone = true

	if not var_12_0.matchmakerSettings then
		var_12_0.matchmakerSettings = LUI.DeepCopy(Lobby.DEFAULT_WARZONE)
	end

	arg_12_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/WARZONE_PRIVATE_MATCH"), Dvar.IBEGCHEFE("MQNNLTKNTS"))
	var_0_4(arg_12_0, arg_12_1)
	PRIVATE_MATCH.SetupPrivateMatchLobbyScene(arg_12_0, arg_12_1)
	var_0_2(arg_12_0, arg_12_1)
	var_0_3(arg_12_0, arg_12_1)
	arg_12_0:addEventHandler("menu_create", var_0_1)
	assert(arg_12_0.TabBacker)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_12_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrame(arg_12_0, arg_12_1)
	Lobby.PreloadViewHandsForLocalPlayer(arg_12_1)
end

function WarzonePrivateMatchLobby(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIElement.new()

	var_13_0.id = "WarzonePrivateMatchLobby"

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)
	var_0_5(var_13_0, var_13_1, arg_13_1)

	var_13_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_13_1
	})
	var_13_0.HelperBar.id = "HelperBar"

	var_13_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_13_0.HelperBar:setPriority(10)
	var_13_0:addElement(var_13_0.HelperBar)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_13_1
	})

	var_13_4.id = "TabBacker"

	var_13_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_13_0:addElement(var_13_4)

	var_13_0.TabBacker = var_13_4

	local var_13_5
	local var_13_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_13_1
	})

	var_13_6.id = "MenuTitle"

	var_13_6.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/WARZONE_PRIVATE_MATCH"), 0)
	var_13_6.Line:SetLeft(0, 0)
	var_13_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_13_0:addElement(var_13_6)

	var_13_0.MenuTitle = var_13_6

	local var_13_7
	local var_13_8 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_13_1
			})
		end,
		controllerIndex = var_13_1
	}
	local var_13_9 = LUI.TabManager.new(var_13_8)

	var_13_9.id = "Tabs"

	var_13_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 996, _1080p * 108, _1080p * 160)
	var_13_0:addElement(var_13_9)

	var_13_0.Tabs = var_13_9

	local var_13_10
	local var_13_11 = MenuBuilder.BuildRegisteredType("SocialPartyWidget", {
		controllerIndex = var_13_1
	})

	var_13_11.id = "PartyWidget"

	var_13_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1224, _1080p * 1824, _1080p * 94, _1080p * 264)
	var_13_0:addElement(var_13_11)

	var_13_0.PartyWidget = var_13_11

	local var_13_12
	local var_13_13 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_13_1
	})

	var_13_13.id = "LobbyMembersFooter"

	var_13_13:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_13_0:addElement(var_13_13)

	var_13_0.LobbyMembersFooter = var_13_13

	local var_13_14

	if CONDITIONS.IsUserSignedInDemonware(var_13_1) then
		local var_13_15 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_13_1
		})

		var_13_15.id = "MPPlayerDetails"

		var_13_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_13_0:addElement(var_13_15)

		var_13_0.MPPlayerDetails = var_13_15
	end

	var_0_6(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("WarzonePrivateMatchLobby", WarzonePrivateMatchLobby)
LockTable(_M)
