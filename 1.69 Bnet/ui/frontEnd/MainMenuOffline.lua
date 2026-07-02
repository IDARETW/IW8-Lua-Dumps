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

local function var_0_0(arg_1_0, arg_1_1)
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1.controller)
end

local function var_0_1()
	Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
	Dvar.DHEGHJJJHI("LPSPMQSNPQ", false)
	Dvar.DHEGHJJJHI("splitscreen", false)
	Dvar.DHEGHJJJHI("LSTLQTSSRM", false)
	Dvar.DHEGHJJJHI("QTQRQPLNK", false)
	DebugPrint("MainMenuButtonsOffline - ResetDvars")
	Dvar.DHEGHJJJHI("MQNNLTKNTS", false)
end

local function var_0_2(arg_3_0)
	assert(arg_3_0)
	Engine.CDGCBCBAJ("Pressed a Main Menu button", arg_3_0)
end

local function var_0_3(arg_4_0)
	var_0_1()
	Dvar.DHEGHJJJHI("LPSPMQSNPQ", true)

	local var_4_0 = LUI.FlowManager.FlowMenus[PartyUIRoot.MP_SYSTEM_LINK]

	Engine.CDGCBCBAJ("Opening " .. var_4_0, arg_4_0)
	LUI.FlowManager.RequestAddMenu(var_4_0, true, arg_4_0, false)
end

local function var_0_4(arg_5_0)
	var_0_1()
	Dvar.DHEGHJJJHI("LPSPMQSNPQ", true)

	local var_5_0 = LUI.FlowManager.FlowMenus[PartyUIRoot.CP_SYSTEM_LINK]

	Engine.CDGCBCBAJ("Opening " .. var_5_0, arg_5_0)
	LUI.FlowManager.RequestAddMenu(var_5_0, true, arg_5_0, false)
end

local function var_0_5(arg_6_0, arg_6_1)
	if Engine.DIEEIEFCFF() and not Engine.BAJHDFAJJF(CoD.SP_MAP_PACK_1_INDEX) or Engine.FABABBDBA() then
		return
	end

	if CONDITIONS.ShouldCheckDLC() and Fences.BIDGFFEBCD() then
		local function var_6_0(arg_7_0, arg_7_1)
			if Engine.CFHBIHABCB(arg_7_1) then
				if CONDITIONS.IsBattleNetModifyInstallEnabled() then
					LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_7_1, false)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_7_1, false)
				end
			end
		end

		local var_6_1 = CoD.CheckForMissingSPDataPacks()

		if var_6_1 ~= nil then
			LUI.FlowManager.RequestPopupMenu(arg_6_0, "PopupOK", true, arg_6_1, false, {
				message = var_6_1,
				action = var_6_0
			})

			return
		end
	end

	if Dvar.IBEGCHEFE("MSRRMTLOQP") == true then
		local var_6_2 = {
			title = Engine.CBBHFCGDIC("MENU/NOTICE"),
			message = Engine.CBBHFCGDIC("PLATFORM/TU_REQUIRED")
		}

		LUI.FlowManager.RequestPopupMenu(nil, "live_dialog_text_box", false, nil, false, var_6_2, nil, false, true)

		return
	end

	var_0_2(arg_6_1)

	local var_6_3 = ONBOARDING_DATA.GetOnboardingMatureContentData()

	function var_6_3.confirmButton.action(arg_8_0, arg_8_1)
		ACTIONS.LeaveMenu(arg_8_0)
		LUI.FlowManager.RequestAddMenu("CampaignMenuOffline", true, arg_8_1, false, nil, false)
	end

	LUI.FlowManager.RequestPopupMenu(arg_6_0, "OnboardingFeaturePopup", true, arg_6_1, false, var_6_3)
end

local function var_0_6(arg_9_0, arg_9_1)
	if not CONDITIONS.IsLaunchChunk() then
		if CONDITIONS.ShouldCheckDLC() and Fences.BIDGFFEBCD() then
			local function var_9_0(arg_10_0, arg_10_1)
				if Engine.CFHBIHABCB(arg_10_1) then
					if CONDITIONS.IsBattleNetModifyInstallEnabled() then
						LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_10_1, false)
					else
						LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_10_1, false)
					end
				end
			end

			local var_9_1 = CoD.CheckForMissingMPDataPacks()

			if var_9_1 ~= nil then
				LUI.FlowManager.RequestPopupMenu(arg_9_0, "PopupOK", true, arg_9_1, false, {
					message = var_9_1,
					action = var_9_0
				})

				return
			end
		end

		if Dvar.IBEGCHEFE("NPNQOLKSLP") == true then
			local var_9_2 = {
				title = Engine.CBBHFCGDIC("MENU/NOTICE"),
				message = Engine.CBBHFCGDIC("PLATFORM/TU_REQUIRED")
			}

			LUI.FlowManager.RequestPopupMenu(nil, "live_dialog_text_box", false, nil, false, var_9_2, nil, false, true)

			return
		end
	end

	var_0_2(arg_9_1)
	var_0_3(arg_9_1)
end

local function var_0_7(arg_11_0, arg_11_1)
	if CONDITIONS.ShouldCheckDLC() and Fences.BIDGFFEBCD() then
		local var_11_0

		local function var_11_1(arg_12_0, arg_12_1)
			if Engine.CFHBIHABCB(arg_12_1) then
				if CONDITIONS.IsBattleNetModifyInstallEnabled() then
					LUI.FlowManager.RequestPopupMenu(nil, "ModifyBattlenetInstallPopup", true, arg_12_1, false)
				else
					LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_12_1, false)
				end
			end
		end

		Engine.EBCBBHIJHJ()

		local var_11_2 = CoD.CheckForMissingCPDataPacks()

		if var_11_2 ~= nil then
			LUI.FlowManager.RequestPopupMenu(arg_11_0, "PopupOK", true, arg_11_1, false, {
				message = var_11_2,
				action = var_11_1
			})

			return
		end
	end

	if Dvar.IBEGCHEFE("MQNSRRKQOT") == true then
		local var_11_3 = {
			title = Engine.CBBHFCGDIC("MENU/NOTICE"),
			message = Engine.CBBHFCGDIC("PLATFORM/TU_REQUIRED")
		}

		LUI.FlowManager.RequestPopupMenu(nil, "live_dialog_text_box", false, nil, false, var_11_3, nil, false, true)

		return
	end

	var_0_2(arg_11_1)
	var_0_4(arg_11_1)
end

local function var_0_8(arg_13_0, arg_13_1, arg_13_2)
	assert(arg_13_0.OfflineStatusText)

	arg_13_0.AttemptOpenCampaign = var_0_5
	arg_13_0.AttemptOpenLocalPlay = var_0_6
	arg_13_0.AttemptOpenCoop = var_0_7

	Engine.DFCGFCGBFD("main_menu", VideoPlaybackFlags.LOOP)
	arg_13_0:addEventHandler("menu_close", function(arg_14_0, arg_14_1)
		Engine.EBCGADABJ()
	end)

	if not Dvar.IBEGCHEFE("LRKPTLNQTT") or Engine.CFHBIHABCB(arg_13_1) then
		arg_13_0.MainMenuBladeLayout:SetupBlades(arg_13_1, MAIN_MENU.BladeType.Shutter, MAIN_MENU.LayoutWidths.KronosOffline, MAIN_MENU.OfflineBladeData)
		ACTIONS.AnimateSequence(arg_13_0, "KronosLayout")
	else
		MAIN_MENU.CleanMagmaBladeNames()
		arg_13_0.MainMenuBladeLayout:SetupBlades(arg_13_1, MAIN_MENU.BladeType.Accordion, MAIN_MENU.LayoutWidths.MagmaOffline, MAIN_MENU.OfflineBladeDataMagma)
		ACTIONS.AnimateSequence(arg_13_0, "MagmaLayout")
	end

	arg_13_0.OfflineStatusText:setText(Engine.CBBHFCGDIC("MENU/STATUS", "LUA_MENU/OFFLINE"))

	arg_13_0.chatOptOut = true

	if CONDITIONS.IsLaunchChunk(arg_13_0) or CONDITIONS.IsBattleNetLanOnly(arg_13_0) then
		arg_13_0:RemoveElement(arg_13_0.OnlineControlsText)

		arg_13_0.OnlineControlsText = nil
	else
		arg_13_0.bindButton:addEventHandler("button_select", function(arg_15_0, arg_15_1)
			var_0_2(arg_15_1.controller)
			LUI.FlowManager.RequestAddMenu("MainMenu", false, arg_15_1.controller, false, false)
		end)
	end

	arg_13_0:registerEventHandler("not_below_blocking_fence", function(arg_16_0, arg_16_1)
		Engine.BIGIHAGAAA()
		Engine.BBEEIGHJBA(CoD.Music.MainSPMusic)
		Engine.CDGCBCBAJ("MainMenuOffline menu opened")
		Dvar.DHEGHJJJHI("LPSPMQSNPQ", false)
	end)
	arg_13_0.bindButton:addEventHandler("button_alt1", function(arg_17_0, arg_17_1)
		if not CONDITIONS.IsLaunchChunk(arg_13_0) then
			local var_17_0 = LUI.FlowManager.GetScopedData(arg_13_0)

			if var_17_0 and var_17_0.currentSelectedMenuType then
				LUI.FlowManager.RequestAddMenu("GameInstallManager", true, arg_13_1, false, {
					gameMode = var_17_0.currentSelectedMenuType
				})
			end
		end
	end)
	assert(arg_13_0.bindButton)
	arg_13_0.bindButton:addEventHandler("button_secondary", function(arg_18_0, arg_18_1)
		if Engine.HDGDBCJFG() then
			LUI.FlowManager.RequestLeaveMenu(arg_18_0, true, true)
		else
			LUI.FlowManager.RequestPopupMenu(arg_13_0, "quit_popmenu", false, arg_18_1.controller)
		end

		return true
	end)

	if CONDITIONS.IsXboxLive(arg_13_0) and CONDITIONS.IsLaunchChunk(arg_13_0) then
		ACTIONS.AnimateSequence(arg_13_0, "LaunchChunk")
	end

	ACTIONS.ScaleFullscreen(arg_13_0.Background)

	if Engine.CGABICJHAI() and Dvar.IBEGCHEFE("LNQTQQPLRO") then
		Engine.CBHCHAFFBG()
	end
end

function MainMenuOffline(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIElement.new()

	var_19_0.id = "MainMenuOffline"
	var_19_0._animationSets = var_19_0._animationSets or {}
	var_19_0._sequences = var_19_0._sequences or {}

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	var_19_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_19_1
	})
	var_19_0.HelperBar.id = "HelperBar"

	var_19_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_19_0.HelperBar:setPriority(10)
	var_19_0:addElement(var_19_0.HelperBar)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = LUI.UIImage.new()

	var_19_4.id = "Background"

	var_19_4:setImage(RegisterMaterial("frontend_main_menu"), 0)
	var_19_0:addElement(var_19_4)

	var_19_0.Background = var_19_4

	local var_19_5
	local var_19_6 = MenuBuilder.BuildRegisteredType("MainMenuBladeLayout", {
		controllerIndex = var_19_1
	})

	var_19_6.id = "MainMenuBladeLayout"

	var_19_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_19_0:addElement(var_19_6)

	var_19_0.MainMenuBladeLayout = var_19_6

	local var_19_7

	if CONDITIONS.IsXboxLive(var_19_0) then
		var_19_7 = MenuBuilder.BuildRegisteredType("PlayerLogIn", {
			controllerIndex = var_19_1
		})
		var_19_7.id = "Gamertag"

		var_19_7.TextLabel:SetAlignment(LUI.Alignment.Right)
		var_19_7:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -940, _1080p * -96, _1080p * 54, _1080p * 78)
		var_19_0:addElement(var_19_7)

		var_19_0.Gamertag = var_19_7
	end

	local var_19_8
	local var_19_9 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_19_1
	})

	var_19_9.id = "Backer"

	var_19_9:SetAlpha(0, 0)
	var_19_9.Background:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_19_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 79, _1080p * 266, _1080p * 72, _1080p * 162)
	var_19_0:addElement(var_19_9)

	var_19_0.Backer = var_19_9

	local var_19_10
	local var_19_11 = LUI.UIText.new()

	var_19_11.id = "OfflineStatusText"

	var_19_11:setText("", 0)
	var_19_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_11:SetAlignment(LUI.Alignment.Left)
	var_19_11:SetOptOutRightToLeftAlignmentFlip(true)
	var_19_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 696, _1080p * 88, _1080p * 112)
	var_19_0:addElement(var_19_11)

	var_19_0.OfflineStatusText = var_19_11

	local var_19_12
	local var_19_13 = LUI.UIText.new()

	var_19_13.id = "OnlineControlsText"

	var_19_13:setText(Engine.CBBHFCGDIC("LUA_MENU/GO_ONLINE"), 0)
	var_19_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_13:SetAlignment(LUI.Alignment.Left)
	var_19_13:SetOptOutRightToLeftAlignmentFlip(true)
	var_19_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 696, _1080p * 120, _1080p * 144)
	var_19_0:addElement(var_19_13)

	var_19_0.OnlineControlsText = var_19_13

	local function var_19_14()
		return
	end

	var_19_0._sequences.DefaultSequence = var_19_14

	local function var_19_15()
		return
	end

	var_19_0._sequences.ShowCopyright = var_19_15

	local var_19_16

	if CONDITIONS.IsXboxLive(var_19_0) then
		local var_19_17 = {
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

		var_19_7:RegisterAnimationSequence("LaunchChunk", var_19_17)
	end

	local function var_19_18()
		if CONDITIONS.IsXboxLive(var_19_0) then
			var_19_7:AnimateSequence("LaunchChunk")
		end
	end

	var_19_0._sequences.LaunchChunk = var_19_18

	local var_19_19
	local var_19_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.MagmaLayout
		}
	}

	var_19_4:RegisterAnimationSequence("MagmaLayout", var_19_20)

	local var_19_21 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_9:RegisterAnimationSequence("MagmaLayout", var_19_21)

	local function var_19_22()
		var_19_4:AnimateSequence("MagmaLayout")
		var_19_9:AnimateSequence("MagmaLayout")
	end

	var_19_0._sequences.MagmaLayout = var_19_22

	local var_19_23
	local var_19_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.KronosLayout
		}
	}

	var_19_4:RegisterAnimationSequence("KronosLayout", var_19_24)

	local function var_19_25()
		var_19_4:AnimateSequence("KronosLayout")
	end

	var_19_0._sequences.KronosLayout = var_19_25

	var_19_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_19_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_19_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_19_26 = LUI.UIBindButton.new()

	var_19_26.id = "selfBindButton"

	var_19_0:addElement(var_19_26)

	var_19_0.bindButton = var_19_26

	var_19_0.bindButton:addEventHandler("button_start", function(arg_25_0, arg_25_1)
		local var_25_0 = arg_25_1.controller or var_19_1

		ACTIONS.OpenOptionsMenu(var_25_0, "", "")
	end)
	var_0_8(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("MainMenuOffline", MainMenuOffline)
LockTable(_M)
