module(..., package.seeall)

local var_0_0 = "frontEnd.systemLinkMenu.serverBrowser"
local var_0_1

local function var_0_2(arg_1_0, arg_1_1)
	return var_0_1(arg_1_0, arg_1_1)
end

MenuBuilder.registerType("MPSystemLinkMenu", var_0_2)
LUI.FlowManager.RegisterFenceGroup("MPSystemLinkMenu", {
	"premiumOrLaunchChunk",
	"mp",
	"mpInstall",
	"offlineData",
	"offlineStatsReset"
})
LUI.FlowManager.RequestSetStack("MPSystemLinkMenu", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenuOffline"
	}
})
MenuBuilder.registerType("CPSystemLinkMenu", var_0_2)
LUI.FlowManager.RegisterFenceGroup("CPSystemLinkMenu", {
	"premium",
	"cp",
	"offlineData",
	"offlineStatsReset"
})
LUI.FlowManager.RequestSetStack("CPSystemLinkMenu", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenuOffline"
	}
})

local function var_0_3()
	Engine.BBEEIGHJBA(CoD.Music.MainMPMusic)
end

LUI.FlowManager.RegisterStackPushBehaviour("MPSystemLinkMenu", var_0_3)

local function var_0_4()
	Engine.BBEEIGHJBA(CoD.Music.MainCPMusic)
end

LUI.FlowManager.RegisterStackPushBehaviour("CPSystemLinkMenu", var_0_4)

local function var_0_5()
	Lobby.ClearMatchData()
	WipeGlobalModelsAtPath("frontEnd.systemLinkMenu.serverBrowser")
end

LUI.FlowManager.RegisterStackPopBehaviour("MPSystemLinkMenu", var_0_5)
LUI.FlowManager.RegisterStackPopBehaviour("CPSystemLinkMenu", var_0_5)

local function var_0_6(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1.controller

	Engine.DAGFFDGFII("xstopprivateparty", var_5_0)
	Dvar.DHEGHJJJHI("LPSPMQSNPQ", false)
	Dvar.DHEGHJJJHI("LLPNKKORPT", false)
	Engine.BIGIHAGAAA()

	if Engine.HABIAFADE() and not CONDITIONS.IsLaunchChunk() then
		local var_5_1 = CONDITIONS.IsThirdGameMode() and "CPMainMenu" or "MPMainMenu"

		LUI.FlowManager.RequestAddMenu(var_5_1, false, var_5_0)
	else
		LUI.FlowManager.RequestRestoreMenu("MainMenuOffline", false, var_5_0)
	end
end

local function var_0_7(arg_6_0, arg_6_1)
	arg_6_0.bindButton = LUI.UIBindButton.new()
	arg_6_0.bindButton.id = "selfBindButton"

	arg_6_0:addElement(arg_6_0.bindButton)
	arg_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	arg_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	arg_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})
	arg_6_0.bindButton:addEventHandler("button_start", function(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_1.controller or arg_6_1

		ACTIONS.OpenOptionsMenu(var_7_0)
		ACTIONS.PlaySoundSetSound(arg_6_0, "selectAlt", false)
	end)
end

local function var_0_8(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1.controller or Engine.IJEBHJIJF()

	PRIVATE_MATCH.SetupPrivateMatchTabs(arg_8_0, var_8_0, {
		firstTabName = "MENU/JOIN",
		firstTabWidget = "SystemLinkPlayMenu",
		leaveMenuFunction = function(arg_9_0, arg_9_1)
			if not CONDITIONS.IsThirdGameMode() or not LUI.FlowManager.GetScopedData("CPSystemLinkMenu") then
				local var_9_0 = LUI.FlowManager.GetScopedData("MPSystemLinkMenu")
			end

			var_0_6(arg_9_0, arg_9_1)
		end,
		callbackFunc = function(arg_10_0)
			local var_10_0 = arg_10_0 == 0
			local var_10_1

			var_10_1 = arg_10_0 == 1

			if var_10_0 then
				arg_8_0.HelperBar:AddButtonHelperTextToElement(arg_8_0, {
					kbm_only = true,
					priority = 3,
					side = "left",
					button_ref = "button_alt2",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/CREATE_LOCAL_GAME_BUT")
				})
				arg_8_0.HelperBar:AddButtonHelperTextToElement(arg_8_0, {
					kbm_only = true,
					priority = 4,
					side = "left",
					button_ref = "button_alt1",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/REFRESH_SERVERS_BUT")
				})
			else
				arg_8_0.HelperBar:RemoveButtonHelperTextFromElement(arg_8_0, "button_alt2", "left")
				arg_8_0.HelperBar:RemoveButtonHelperTextFromElement(arg_8_0, "button_alt1", "left")
			end
		end
	})
end

local function var_0_9(arg_11_0, arg_11_1, arg_11_2)
	Dvar.DHEGHJJJHI("MLQNQTRRTK", false)
end

local function var_0_10(arg_12_0, arg_12_1, arg_12_2)
	assert(arg_12_0.MenuTitle)
	assert(arg_12_0.Tabs)
	assert(arg_12_0.HelperBar)
	assert(arg_12_0.TabBacker)

	if CONDITIONS.IsCoreMultiplayer() then
		arg_12_0.isSignInMenu = true
	end

	if CONDITIONS.IsThirdGameMode() then
		CP.ClearAllPickupMunitions(arg_12_1)
	end

	arg_12_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("PLATFORM/SYSTEM_LINK_TITLE"))
	var_0_7(arg_12_0, arg_12_1)
	Dvar.DHEGHJJJHI("LLPNKKORPT", false)
	Dvar.BDEHAEGHAF("ui_version_show", "0")
	Dvar.DHEGHJJJHI("MTSTMKPMRM", false)
	Dvar.DHEGHJJJHI("LPSPMQSNPQ", true)

	local var_12_0 = Engine.CDCCDDJAJJ(arg_12_1)

	assert(var_12_0)

	if CONDITIONS.IsThirdGameMode() then
		Engine.DAGFFDGFII(CoD.GetMPSystemLinkCfg(), arg_12_1)
		Engine.DFJDIFJEGA("initialGameMode", MAIN_MENU.BladeKeys.CP, arg_12_1)
		Engine.DFJDIFJEGA("isCPNew", 0, arg_12_1)
		Engine.EBIDFIDHIE("updategamerprofile")
	else
		Engine.DAGFFDGFII(CoD.GetMPSystemLinkCfg(), arg_12_1)
		Engine.DFJDIFJEGA("initialGameMode", MAIN_MENU.BladeKeys.MP, arg_12_1)
		Engine.EBIDFIDHIE("updategamerprofile")
	end

	MP_COMMON.SetupStreaming(arg_12_0, arg_12_1)

	if CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() then
		Engine.DAGFFDGFII("xstopprivateparty 0", arg_12_1)
	end

	if not Lobby.GFFECBCCF() then
		Engine.DAGFFDGFII("xstartprivateparty", arg_12_1)
	end

	Engine.EBIDFIDHIE(MPConfig.default_dvars)
	Engine.BJGGCHBAGJ()

	if CONDITIONS.IsThirdGameMode() then
		Lobby.EAHFJBBBBD(PartyUIRoot.CP_SYSTEM_LINK)
	else
		Lobby.EAHFJBBBBD(PartyUIRoot.MP_SYSTEM_LINK)
	end

	Engine.EAIBAGFDCD(CoD.PresenceContext.PARTY)
	arg_12_0:addEventHandler("menu_create", var_0_8)

	if CONDITIONS.IsLaunchChunk() then
		arg_12_0:SetAlpha(0)
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_12_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrame(arg_12_0, arg_12_1)
	LOOT.CheckCustomizationsShouldBeEquipped(arg_12_1)
	WEAPON.CheckWeaponsShouldBeEquipped(arg_12_1)
	OPERATOR.CheckCustomizationsShouldBeEquipped(arg_12_1)
end

function var_0_1(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIElement.new()

	var_13_0.id = "SystemLinkMenu"

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)
	var_0_9(var_13_0, var_13_1, arg_13_1)

	var_13_0.soundSet = "cpMainMenuDefault"
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
	local var_13_6 = {
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
	local var_13_7 = LUI.TabManager.new(var_13_6)

	var_13_7.id = "Tabs"

	var_13_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 994, _1080p * 108, _1080p * 160)
	var_13_0:addElement(var_13_7)

	var_13_0.Tabs = var_13_7

	local var_13_8
	local var_13_9 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_13_1
	})

	var_13_9.id = "MenuTitle"

	var_13_9.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("PLATFORM/SYSTEM_LINK_TITLE")), 0)
	var_13_9.Line:SetLeft(0, 0)
	var_13_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_13_0:addElement(var_13_9)

	var_13_0.MenuTitle = var_13_9

	local var_13_10

	if CONDITIONS.IsUserSignedInDemonware(var_13_1) then
		local var_13_11 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_13_1
		})

		var_13_11.id = "MPPlayerDetails"

		var_13_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_13_0:addElement(var_13_11)

		var_13_0.MPPlayerDetails = var_13_11
	end

	var_0_10(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("SystemLinkMenu", var_0_1)
LUI.FlowManager.RegisterStackPopBehaviour("SystemLinkMenu", var_0_5)
LockTable(_M)
