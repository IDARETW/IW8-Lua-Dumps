module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("MainMenuOffline", {
	"koreanRating",
	"bootCheck",
	"signIn",
	"gamerProfile",
	"shaderUpload",
	"networking",
	"ownershipStatus"
})

if Engine.HDGDBCJFG() then
	LUI.FlowManager.RequestSetStack("MainMenuOffline", {
		{
			name = "MainLockoutMenu"
		}
	})
end

local function var_0_0()
	local var_1_0 = false

	if not CONDITIONS.IsPC(self) then
		var_1_0 = Dvar.IBEGCHEFE("LKSTRMKTML")
	end

	return var_1_0
end

local function var_0_1(arg_2_0, arg_2_1)
	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1.controller)
end

local function var_0_2()
	Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
	Dvar.DHEGHJJJHI("LPSPMQSNPQ", false)
	Dvar.DHEGHJJJHI("splitscreen", false)
	Dvar.DHEGHJJJHI("LSTLQTSSRM", false)
	Dvar.DHEGHJJJHI("QTQRQPLNK", false)
	DebugPrint("MainMenuButtonsOffline - ResetDvars")
	Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
end

local function var_0_3(arg_4_0)
	assert(arg_4_0)
	Engine.CDGCBCBAJ("Pressed a Main Menu button", arg_4_0)
end

local function var_0_4(arg_5_0)
	var_0_2()
	Dvar.DHEGHJJJHI("LPSPMQSNPQ", true)

	local var_5_0 = LUI.FlowManager.FlowMenus[PartyUIRoot.MP_SYSTEM_LINK]

	Engine.CDGCBCBAJ("Opening " .. var_5_0, arg_5_0)
	LUI.FlowManager.RequestAddMenu(var_5_0, true, arg_5_0, false)
end

local function var_0_5(arg_6_0)
	var_0_2()
	Dvar.DHEGHJJJHI("LPSPMQSNPQ", true)

	local var_6_0 = LUI.FlowManager.FlowMenus[PartyUIRoot.CP_SYSTEM_LINK]

	Engine.CDGCBCBAJ("Opening " .. var_6_0, arg_6_0)
	LUI.FlowManager.RequestAddMenu(var_6_0, true, arg_6_0, false)
end

local function var_0_6(arg_7_0, arg_7_1)
	if Engine.DIEEIEFCFF() and not Engine.BAJHDFAJJF(CoD.SP_MAP_PACK_1_INDEX) or Engine.FABABBDBA() then
		return
	end

	if var_0_0() and Fences.BIDGFFEBCD() then
		local function var_7_0(arg_8_0, arg_8_1)
			if Engine.CFHBIHABCB(arg_8_1) then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_8_1, false)
			end
		end

		local var_7_1 = MAIN_MENU.CheckForMissingSPDataPacks()

		if var_7_1 ~= nil then
			LUI.FlowManager.RequestPopupMenu(arg_7_0, "PopupOK", true, arg_7_1, false, {
				message = var_7_1,
				action = var_7_0
			})

			return
		end
	end

	if Dvar.IBEGCHEFE("MSRRMTLOQP") == true then
		local var_7_2 = {
			title = Engine.CBBHFCGDIC("MENU/NOTICE"),
			message = Engine.CBBHFCGDIC("PLATFORM/TU_REQUIRED")
		}

		LUI.FlowManager.RequestPopupMenu(nil, "live_dialog_text_box", false, nil, false, var_7_2, nil, false, true)

		return
	end

	var_0_3(arg_7_1)

	local var_7_3 = ONBOARDING_DATA.GetOnboardingMatureContentData()

	function var_7_3.confirmButton.action(arg_9_0, arg_9_1)
		ACTIONS.LeaveMenu(arg_9_0)
		LUI.FlowManager.RequestAddMenu("CampaignMenuOffline", true, arg_9_1, false, nil, false)
	end

	LUI.FlowManager.RequestPopupMenu(arg_7_0, "OnboardingFeaturePopup", true, arg_7_1, false, var_7_3)
end

local function var_0_7(arg_10_0, arg_10_1)
	if not CONDITIONS.IsLaunchChunk() then
		if var_0_0() and Fences.BIDGFFEBCD() then
			local function var_10_0(arg_11_0, arg_11_1)
				if Engine.CFHBIHABCB(arg_11_1) then
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_11_1, false)
				end
			end

			local var_10_1 = MAIN_MENU.CheckForMissingMPDataPacks()

			if var_10_1 ~= nil then
				LUI.FlowManager.RequestPopupMenu(arg_10_0, "PopupOK", true, arg_10_1, false, {
					message = var_10_1,
					action = var_10_0
				})

				return
			end
		end

		if Dvar.IBEGCHEFE("NPNQOLKSLP") == true then
			local var_10_2 = {
				title = Engine.CBBHFCGDIC("MENU/NOTICE"),
				message = Engine.CBBHFCGDIC("PLATFORM/TU_REQUIRED")
			}

			LUI.FlowManager.RequestPopupMenu(nil, "live_dialog_text_box", false, nil, false, var_10_2, nil, false, true)

			return
		end
	end

	var_0_3(arg_10_1)
	var_0_4(arg_10_1)
end

local function var_0_8(arg_12_0, arg_12_1)
	if var_0_0() and Fences.BIDGFFEBCD() then
		local var_12_0

		local function var_12_1(arg_13_0, arg_13_1)
			if Engine.CFHBIHABCB(arg_13_1) then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_13_1, false)
			end
		end

		local var_12_2 = MAIN_MENU.CheckForMissingCPDataPacks()

		if var_12_2 ~= nil then
			LUI.FlowManager.RequestPopupMenu(arg_12_0, "PopupOK", true, arg_12_1, false, {
				message = var_12_2,
				action = var_12_1
			})

			return
		end
	end

	if Dvar.IBEGCHEFE("MQNSRRKQOT") == true then
		local var_12_3 = {
			title = Engine.CBBHFCGDIC("MENU/NOTICE"),
			message = Engine.CBBHFCGDIC("PLATFORM/TU_REQUIRED")
		}

		LUI.FlowManager.RequestPopupMenu(nil, "live_dialog_text_box", false, nil, false, var_12_3, nil, false, true)

		return
	end

	var_0_3(arg_12_1)
	var_0_5(arg_12_1)
end

local function var_0_9(arg_14_0, arg_14_1, arg_14_2)
	assert(arg_14_0.OfflineStatusText)

	arg_14_0.AttemptOpenCampaign = var_0_6
	arg_14_0.AttemptOpenLocalPlay = var_0_7
	arg_14_0.AttemptOpenCoop = var_0_8

	Engine.DFCGFCGBFD("main_menu", VideoPlaybackFlags.LOOP)
	arg_14_0:addEventHandler("menu_close", function(arg_15_0, arg_15_1)
		Engine.EBCGADABJ()
	end)

	if not Dvar.IBEGCHEFE("LRKPTLNQTT") or Engine.CFHBIHABCB(arg_14_1) then
		arg_14_0.MainMenuBladeLayout:SetupBlades(arg_14_1, MAIN_MENU.BladeType.Shutter, MAIN_MENU.LayoutWidths.KronosOffline, MAIN_MENU.OfflineBladeData)
		ACTIONS.AnimateSequence(arg_14_0, "KronosLayout")
	else
		MAIN_MENU.CleanMagmaBladeNames()
		arg_14_0.MainMenuBladeLayout:SetupBlades(arg_14_1, MAIN_MENU.BladeType.Accordion, MAIN_MENU.LayoutWidths.MagmaOffline, MAIN_MENU.OfflineBladeDataMagma)
		ACTIONS.AnimateSequence(arg_14_0, "MagmaLayout")
	end

	arg_14_0.OfflineStatusText:setText(Engine.CBBHFCGDIC("MENU/STATUS", "LUA_MENU/OFFLINE"))

	arg_14_0.chatOptOut = true

	if CONDITIONS.IsLaunchChunk(arg_14_0) or CONDITIONS.IsBattleNetLanOnly(arg_14_0) then
		arg_14_0:RemoveElement(arg_14_0.OnlineControlsText)

		arg_14_0.OnlineControlsText = nil
	else
		arg_14_0.bindButton:addEventHandler("button_select", function(arg_16_0, arg_16_1)
			var_0_3(arg_16_1.controller)
			LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_16_1.controller, false, false)
		end)
	end

	arg_14_0:registerEventHandler("not_below_blocking_fence", function(arg_17_0, arg_17_1)
		Engine.BIGIHAGAAA()
		Engine.BBEEIGHJBA(CoD.Music.MainSPMusic)
		Engine.CDGCBCBAJ("MainMenuOffline menu opened")
		Dvar.DHEGHJJJHI("LPSPMQSNPQ", false)
	end)
	arg_14_0.bindButton:addEventHandler("button_alt1", function(arg_18_0, arg_18_1)
		if not CONDITIONS.IsLaunchChunk(arg_14_0) then
			local var_18_0 = LUI.FlowManager.GetScopedData(arg_14_0)

			if var_18_0 and var_18_0.currentSelectedMenuType then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_14_1, false, {
					gameMode = var_18_0.currentSelectedMenuType
				})
			end
		end
	end)
	assert(arg_14_0.bindButton)
	arg_14_0.bindButton:addEventHandler("button_secondary", function(arg_19_0, arg_19_1)
		if Engine.HDGDBCJFG() then
			LUI.FlowManager.RequestLeaveMenu(arg_19_0, true, true)
		else
			LUI.FlowManager.RequestPopupMenu(arg_14_0, "quit_popmenu", false, arg_19_1.controller)
		end

		return true
	end)

	if CONDITIONS.IsXboxLive(arg_14_0) and CONDITIONS.IsLaunchChunk(arg_14_0) then
		ACTIONS.AnimateSequence(arg_14_0, "LaunchChunk")
	end

	ACTIONS.ScaleFullscreen(arg_14_0.Background)

	if Engine.CGABICJHAI() and Dvar.IBEGCHEFE("LNQTQQPLRO") then
		Engine.CBHCHAFFBG()
	end
end

function MainMenuOffline(arg_20_0, arg_20_1)
	local var_20_0 = LUI.UIElement.new()

	var_20_0.id = "MainMenuOffline"
	var_20_0._animationSets = var_20_0._animationSets or {}
	var_20_0._sequences = var_20_0._sequences or {}

	local var_20_1 = arg_20_1 and arg_20_1.controllerIndex

	if not var_20_1 and not Engine.DDJFBBJAIG() then
		var_20_1 = var_20_0:getRootController()
	end

	assert(var_20_1)

	var_20_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_20_1
	})
	var_20_0.HelperBar.id = "HelperBar"

	var_20_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_20_0.HelperBar:setPriority(10)
	var_20_0:addElement(var_20_0.HelperBar)

	local var_20_2 = var_20_0
	local var_20_3
	local var_20_4 = LUI.UIImage.new()

	var_20_4.id = "Background"

	var_20_4:setImage(RegisterMaterial("frontend_main_menu"), 0)
	var_20_0:addElement(var_20_4)

	var_20_0.Background = var_20_4

	local var_20_5
	local var_20_6 = MenuBuilder.BuildRegisteredType("MainMenuBladeLayout", {
		controllerIndex = var_20_1
	})

	var_20_6.id = "MainMenuBladeLayout"

	var_20_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_20_0:addElement(var_20_6)

	var_20_0.MainMenuBladeLayout = var_20_6

	local var_20_7

	if CONDITIONS.IsXboxLive(var_20_0) then
		var_20_7 = MenuBuilder.BuildRegisteredType("PlayerLogIn", {
			controllerIndex = var_20_1
		})
		var_20_7.id = "Gamertag"

		var_20_7.TextLabel:SetAlignment(LUI.Alignment.Right)
		var_20_7:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -940, _1080p * -96, _1080p * 54, _1080p * 78)
		var_20_0:addElement(var_20_7)

		var_20_0.Gamertag = var_20_7
	end

	local var_20_8
	local var_20_9 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_20_1
	})

	var_20_9.id = "Backer"

	var_20_9:SetAlpha(0, 0)
	var_20_9.Background:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_20_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 79, _1080p * 266, _1080p * 72, _1080p * 162)
	var_20_0:addElement(var_20_9)

	var_20_0.Backer = var_20_9

	local var_20_10
	local var_20_11 = LUI.UIText.new()

	var_20_11.id = "OfflineStatusText"

	var_20_11:setText("", 0)
	var_20_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_20_11:SetAlignment(LUI.Alignment.Left)
	var_20_11:SetOptOutRightToLeftAlignmentFlip(true)
	var_20_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 696, _1080p * 88, _1080p * 112)
	var_20_0:addElement(var_20_11)

	var_20_0.OfflineStatusText = var_20_11

	local var_20_12
	local var_20_13 = LUI.UIText.new()

	var_20_13.id = "OnlineControlsText"

	var_20_13:setText(Engine.CBBHFCGDIC("LUA_MENU/GO_ONLINE"), 0)
	var_20_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_20_13:SetAlignment(LUI.Alignment.Left)
	var_20_13:SetOptOutRightToLeftAlignmentFlip(true)
	var_20_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 696, _1080p * 120, _1080p * 144)
	var_20_0:addElement(var_20_13)

	var_20_0.OnlineControlsText = var_20_13

	local function var_20_14()
		return
	end

	var_20_0._sequences.DefaultSequence = var_20_14

	local function var_20_15()
		return
	end

	var_20_0._sequences.ShowCopyright = var_20_15

	local var_20_16

	if CONDITIONS.IsXboxLive(var_20_0) then
		local var_20_17 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 124
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 148
			}
		}

		var_20_7:RegisterAnimationSequence("LaunchChunk", var_20_17)
	end

	local function var_20_18()
		if CONDITIONS.IsXboxLive(var_20_0) then
			var_20_7:AnimateSequence("LaunchChunk")
		end
	end

	var_20_0._sequences.LaunchChunk = var_20_18

	local var_20_19
	local var_20_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.MagmaLayout
		}
	}

	var_20_4:RegisterAnimationSequence("MagmaLayout", var_20_20)

	local var_20_21 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_20_9:RegisterAnimationSequence("MagmaLayout", var_20_21)

	local function var_20_22()
		var_20_4:AnimateSequence("MagmaLayout")
		var_20_9:AnimateSequence("MagmaLayout")
	end

	var_20_0._sequences.MagmaLayout = var_20_22

	local var_20_23
	local var_20_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.KronosLayout
		}
	}

	var_20_4:RegisterAnimationSequence("KronosLayout", var_20_24)

	local function var_20_25()
		var_20_4:AnimateSequence("KronosLayout")
	end

	var_20_0._sequences.KronosLayout = var_20_25

	var_20_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_20_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_20_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_20_26 = LUI.UIBindButton.new()

	var_20_26.id = "selfBindButton"

	var_20_0:addElement(var_20_26)

	var_20_0.bindButton = var_20_26

	var_20_0.bindButton:addEventHandler("button_start", function(arg_26_0, arg_26_1)
		local var_26_0 = arg_26_1.controller or var_20_1

		ACTIONS.OpenOptionsMenu(var_26_0, "", "")
	end)
	var_0_9(var_20_0, var_20_1, arg_20_1)

	return var_20_0
end

MenuBuilder.registerType("MainMenuOffline", MainMenuOffline)
LockTable(_M)
