module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("CampaignMenu", {
	"premium",
	"sp",
	"spInstall",
	"spOnlineData"
})
LUI.FlowManager.RequestSetStack("CampaignMenu", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	}
})
LUI.FlowManager.RegisterFenceGroup("CampaignMenuOffline", {
	"premium",
	"sp",
	"spInstall"
})
LUI.FlowManager.RequestSetStack("CampaignMenuOffline", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenuOffline"
	}
})

local function var_0_0(arg_1_0)
	if CONDITIONS.IsDevelopmentBuild(arg_1_0) or SPSharedUtils.IsMissionCheatEnabled(arg_1_0._controllerIndex) then
		return true
	end

	local var_1_0 = StringTable.CBGJCDIHCE(CSV.levels.file, 0, CSV.levels.cols.name)

	return SPSharedUtils.GetMissionStateForLevel(var_1_0, 0) == "complete"
end

local function var_0_1(arg_2_0)
	arg_2_0._numAttempts = 0
	arg_2_0._maxAttempts = 15
	arg_2_0._waitTimeForMap = 200
	arg_2_0._campaignWorldMapImage = "campaign_world_map"
	arg_2_0._imageStreamer = LUI.UIElement.new()
	arg_2_0._imageStreamer.id = "ImageStreamer"

	arg_2_0:addElement(arg_2_0._imageStreamer)
	arg_2_0._imageStreamer:SetupImageTableStreamer({
		RegisterMaterial(arg_2_0._campaignWorldMapImage)
	}, false)
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = LUI.FlowManager.GetScopedData(arg_3_0)

	var_0_1(arg_3_0)

	local var_3_1 = {}

	var_3_1[#var_3_1 + 1] = {
		menuName = "CampaignPlayMenu",
		name = ToUpperCase(Engine.CBBHFCGDIC("MENU_SP/STORY_CAPS"))
	}
	var_3_1[#var_3_1 + 1] = {
		menuName = "SPCinematicSelect",
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CINEMATICS")),
		disabled = Dvar.IBEGCHEFE("Kleenex") or not var_0_0(arg_3_0)
	}

	local function var_3_2(arg_4_0)
		local var_4_0 = arg_4_0.activeTabWidget

		if var_4_0 and not var_4_0.BackButtonOverride then
			function var_4_0.BackButtonOverride(arg_5_0, arg_5_1)
				local var_5_0 = arg_5_1.qualifier ~= "keyboard" and arg_5_1.qualifier ~= "gamepad" and FocusType.MouseOver or FocusType.Gamepad

				arg_4_0.Tabs:FocusTab(arg_4_0._controllerIndex, 0, var_5_0)

				return false
			end
		end
	end

	local var_3_3 = {}

	for iter_3_0, iter_3_1 in ipairs(var_3_1) do
		table.insert(var_3_3, {
			name = iter_3_1.name,
			disabled = iter_3_1.disabled,
			hasDefaultFocus = iter_3_0 - 1 == var_3_0.activeTabIndex,
			focusFunction = function(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
				if var_3_0.activeTabIndex and arg_6_2 == var_3_0.activeTabIndex and arg_3_0.activeTabWidget then
					return
				end

				if iter_3_1.menuName == "CampaignPlayMenu" then
					Engine.BJDBIAGIDA(CoD.SFX.FocusGamepad)

					local var_6_0

					local function var_6_1(arg_7_0, arg_7_1)
						if Engine.CIGHGHEJHH(arg_3_0._campaignWorldMapImage) or arg_3_0._numAttempts > arg_3_0._maxAttempts then
							arg_3_0._numAttempts = 0

							TAB.UpdateBuiltWidgetOnTabChange(arg_3_0, var_3_0.activeTabIndex, "activeTabWidget", arg_6_2, arg_6_3, iter_3_1.menuName, {
								buildPriority = -1,
								controllerIndex = arg_6_1
							})

							var_3_0.activeTabIndex = arg_6_2

							arg_3_0.activeTabWidget:SetupButtonHelpers()

							if arg_6_2 ~= 0 then
								var_3_2(arg_3_0)
							end

							if arg_7_1 == nil and not LUI.IsLastInputMouseNavigation(arg_6_1) then
								arg_3_0:processEvent({
									name = "gain_focus"
								})
							end
						else
							arg_3_0._numAttempts = arg_3_0._numAttempts + 1
							arg_3_0:Wait(arg_3_0._waitTimeForMap, true).onComplete = var_6_1
						end
					end

					var_6_1(nil, true)
					arg_3_0:AddButtonHelperText({
						side = "left",
						button_ref = "button_primary",
						priority = 1,
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
					})
				else
					arg_3_0.HelperBar.ButtonHelperText:PopButtonPrompt({
						button_ref = "button_alt1"
					})
					arg_3_0.HelperBar.ButtonHelperText:PopButtonPrompt({
						button_ref = "button_alt2"
					})

					if iter_3_1.menuName == "SPCinematicSelect" then
						arg_3_0:AddButtonHelperText({
							side = "left",
							button_ref = "button_primary",
							priority = 1,
							helper_text = Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN")
						})
					end

					TAB.UpdateBuiltWidgetOnTabChange(arg_3_0, var_3_0.activeTabIndex, "activeTabWidget", arg_6_2, arg_6_3, iter_3_1.menuName, {
						buildPriority = -1,
						controllerIndex = arg_6_1
					})

					var_3_0.activeTabIndex = arg_6_2

					if arg_6_2 ~= 0 then
						var_3_2(arg_3_0)
					end
				end
			end
		})
	end

	arg_3_0.Tabs:SetTabs(var_3_3)
end

local function var_0_3()
	if not Engine.HDDHJIBDH() and Dvar.IBEGCHEFE("Kleenex") then
		Engine.CDGCBCBAJ("Kleenex disable for Level Select Menu")
	end

	Dvar.DHEGHJJJHI("QTQRQPLNK", false)
	Engine.BBEEIGHJBA(CoD.Music.MainSPMusic)
	Engine.EBIDFIDHIE("Updatedvarsfromprofile")
	Engine.EBIDFIDHIE("profile_difficultyLoad")
end

MenuBuilder.registerType("CampaignMenuOffline", function(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1 or {}

	var_9_0.chatOptOut = true

	return MenuBuilder.BuildRegisteredType("CampaignMenu", var_9_0)
end)
LUI.FlowManager.RegisterStackPushBehaviour("CampaignMenuOffline", var_0_3)

local function var_0_4(arg_10_0, arg_10_1, arg_10_2)
	assert(arg_10_0.MenuTitle)
	arg_10_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MENU/CAMPAIGN"))

	arg_10_0._controllerIndex = arg_10_1

	Engine.BHEJICHIDE()
	Engine.DFJDIFJEGA("initialGameMode", MAIN_MENU.BladeKeys.SP, arg_10_1)
	Engine.DFJDIFJEGA("isSPNew", 0, arg_10_1)
	Engine.EBIDFIDHIE("updategamerprofile")
	Engine.EBIDFIDHIE("updatesavegameavailable")

	if arg_10_0.MPPlayerDetails then
		ACTIONS.AnimateSequence(arg_10_0.MPPlayerDetails, "HideRank")
	end

	arg_10_0.SetupTabs = var_0_2

	arg_10_0:addEventHandler("menu_create", arg_10_0.SetupTabs)
	arg_10_0.Tabs:SetAlignment(LUI.Alignment.Left)

	if arg_10_2 then
		arg_10_0.chatOptOut = arg_10_2.chatOptOut
	end

	Dvar.DHEGHJJJHI("splitscreen", false)
	Dvar.BDEHAEGHAF("ui_prev_map", "")
	Dvar.DHEGHJJJHI("credits_active", false)
	Dvar.DFIJDJFIFD("ROQSKRSPL", 0)
	Engine.EAIBAGFDCD(CoD.PresenceContext.NOT_IN_GAME)

	if CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() then
		Engine.DAGFFDGFII("xstopprivateparty 0 1", arg_10_1)
	end

	if Dvar.IBEGCHEFE("sp_lockout_start_override") then
		Dvar.BDEHAEGHAF("start", "")
	end

	if Dvar.IBEGCHEFE("Kleenex") then
		arg_10_0:RemoveButtonHelperText("button_secondary", "right")
		Dvar.BDEHAEGHAF("start", "")
	end

	if CONDITIONS.IsPCAchievementsMenuAvailable(arg_10_0) then
		arg_10_0:addEventHandler("menu_create", function(arg_11_0, arg_11_1)
			arg_11_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_right_stick",
				priority = 10,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/ACHIEVEMENT")
			})
		end)
		arg_10_0.bindButton:addEventHandler("button_right_stick", function(arg_12_0, arg_12_1)
			ACTIONS.OpenPCAchievementMenu(arg_12_1.controller)
		end)
	end

	assert(arg_10_0.bindButton)
	arg_10_0.bindButton:addEventHandler("button_secondary", function(arg_13_0, arg_13_1)
		local var_13_0 = arg_10_0.activeTabWidget
		local var_13_1 = true

		if var_13_0 and var_13_0.BackButtonOverride then
			var_13_1 = var_13_0.BackButtonOverride(arg_13_0, arg_13_1)
		end

		if var_13_1 and not Dvar.IBEGCHEFE("Kleenex") then
			LUI.FlowManager.RequestLeaveMenu(arg_10_0)
		end
	end)
	LAYOUT.AddAspectRatioFadeFrame(arg_10_0, arg_10_1)
	OnlineProgression.HGBFIHEHE(arg_10_1)
end

function CampaignMenu(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIElement.new()

	var_14_0.id = "CampaignMenu"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	var_14_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_14_1
	})
	var_14_0.HelperBar.id = "HelperBar"

	var_14_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_14_0.HelperBar:setPriority(10)
	var_14_0:addElement(var_14_0.HelperBar)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = LUI.UIText.new()

	var_14_4.id = "Copyright"

	var_14_4:SetRGBFromInt(14277081, 0)
	var_14_4:SetAlpha(0, 0)
	var_14_4:setText(Engine.CBBHFCGDIC("LUA_MENU/LEGAL_COPYRIGHT"), 0)
	var_14_4:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_14_4:SetAlignment(LUI.Alignment.Center)
	var_14_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 880, _1080p * 925)
	var_14_0:addElement(var_14_4)

	var_14_0.Copyright = var_14_4

	local var_14_5

	if CONDITIONS.IsUserSignedInDemonware(var_14_1) then
		local var_14_6 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_14_1
		})

		var_14_6.id = "MPPlayerDetails"

		var_14_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1404, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_14_0:addElement(var_14_6)

		var_14_0.MPPlayerDetails = var_14_6
	end

	local var_14_7
	local var_14_8 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_14_1
			})
		end,
		controllerIndex = var_14_1
	}
	local var_14_9 = LUI.TabManager.new(var_14_8)

	var_14_9.id = "Tabs"

	var_14_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 996, _1080p * 108, _1080p * 160)
	var_14_0:addElement(var_14_9)

	var_14_0.Tabs = var_14_9

	local var_14_10
	local var_14_11 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_14_1
	})

	var_14_11.id = "MenuTitle"

	var_14_11.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/CAMPAIGN")), 0)
	var_14_11.Line:SetLeft(0, 0)
	var_14_11:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_14_0:addElement(var_14_11)

	var_14_0.MenuTitle = var_14_11

	local function var_14_12()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_12

	local var_14_13 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ShowCopyright", var_14_13)

	local function var_14_14()
		var_14_4:AnimateSequence("ShowCopyright")
	end

	var_14_0._sequences.ShowCopyright = var_14_14

	var_14_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_14_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_14_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_14_15 = LUI.UIBindButton.new()

	var_14_15.id = "selfBindButton"

	var_14_0:addElement(var_14_15)

	var_14_0.bindButton = var_14_15

	var_14_0.bindButton:addEventHandler("button_start", function(arg_18_0, arg_18_1)
		local var_18_0 = arg_18_1.controller or var_14_1

		ACTIONS.OpenOptionsMenu(var_18_0, "")
	end)
	var_0_4(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("CampaignMenu", CampaignMenu)
LUI.FlowManager.RegisterStackPushBehaviour("CampaignMenu", var_0_3)
LockTable(_M)
