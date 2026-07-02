module(..., package.seeall)
CoD.PrintModuleLoad(_NAME)

local function var_0_0(arg_1_0, arg_1_1)
	local function var_1_0()
		Engine.EBIDFIDHIE("profile_difficultyLoad")
		Engine.EBIDFIDHIE("loadgame_continue")
		Engine.EBIDFIDHIE("updategamerprofile")
	end

	if Engine.BBGGBGEHAI(arg_1_1) then
		LUI.FlowManager.RequestPopupMenu(nil, "FakeLoadingScreenOverlay", true, 0, false, {
			onLoadCompleteFunc = var_1_0
		})
	end
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	local function var_3_0()
		Engine.EBIDFIDHIE("spmap " .. arg_3_2)
	end

	local var_3_1 = MenuBuilder.BuildRegisteredType("SPPauseDifficultyFlyin", {
		controllerIndex = arg_3_1
	})

	var_3_1:SetMap(arg_3_2)
	LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_3_1, false, {
		widget = var_3_1
	})
end

function ResumeGamePopup(arg_5_0, arg_5_1)
	local var_5_0 = {
		message = "",
		title = Engine.CBBHFCGDIC("MENU/RESUMEGAME_Q"),
		yesAction = var_0_0
	}

	return MenuBuilder.BuildRegisteredType("PopupYesNo", var_5_0)
end

function ResumeOrRestartPopup(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1 and arg_6_1.mapName
	local var_6_1 = not Engine.BBGGBGEHAI(arg_6_1.controllerIndex)
	local var_6_2 = {
		defaultFocusIndex = 0,
		title = Engine.CBBHFCGDIC("MENU/RESUME_LEVEL_Q"),
		message = arg_6_1.levelName or "",
		buttons = {
			{
				label = Engine.CBBHFCGDIC("MENU/RESUME"),
				disabled = var_6_1,
				action = var_0_0
			},
			{
				label = Engine.CBBHFCGDIC("MENU/RESTART_MISSION"),
				action = function(arg_7_0, arg_7_1)
					var_0_1(arg_7_0, arg_7_1, var_6_0)
				end
			}
		}
	}
	local var_6_3 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_6_2)

	var_6_3.id = "ResumeOrRestartPopup"

	if var_6_1 then
		var_6_3:addEventHandler("update_save_game_available_complete", function(arg_8_0, arg_8_1)
			var_6_3:GetButton(2):SetButtonDisabled(false)
		end)
	end

	return var_6_3
end

function OverwriteSaveWarningPopup(arg_9_0, arg_9_1)
	assert(arg_9_1)

	local var_9_0 = {
		title = Engine.CBBHFCGDIC("MENU/MISSION_SELECT"),
		message = Engine.CBBHFCGDIC("MENU/WARNING_CHECKPOINT_RESET"),
		yesAction = function(arg_10_0, arg_10_1)
			local var_10_0 = MenuBuilder.BuildRegisteredType("SPPauseDifficultyFlyin", {
				controllerIndex = arg_10_1
			})

			var_10_0:SetMap(arg_9_1.mapName)
			LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_10_1, false, {
				widget = var_10_0
			})
		end
	}
	local var_9_1 = MenuBuilder.BuildRegisteredType("PopupYesNo", var_9_0)

	var_9_1.id = "OverwriteSaveWarningPopup"

	return var_9_1
end

function OpenFirstLevel(arg_11_0, arg_11_1)
	LUI.FlowManager.RequestLeaveMenu(arg_11_0)

	local var_11_0 = MenuBuilder.BuildRegisteredType("SPPauseDifficultyFlyin", {
		controllerIndex = arg_11_1.controller
	})

	var_11_0:SetMap("proxywar")
	LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_11_1.controller, false, {
		widget = var_11_0
	})
end

function overwrite_warning_menu()
	local var_12_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NEWGAME"),
		message_text = Engine.CBBHFCGDIC("MENU/WARNING_CHECKPOINT_RESET"),
		yes_text = Engine.CBBHFCGDIC("MENU/YES_CAPS"),
		yes_action = OpenFirstLevel,
		no_text = Engine.CBBHFCGDIC("MENU/NO_CAPS"),
		no_action = MBh.LeaveMenu()
	}
	local var_12_1 = MenuBuilder.BuildRegisteredType("generic_yesno_popup", var_12_0)

	var_12_1.id = "overwrite_warning_menu"

	return var_12_1
end

function popmenu_autosave_warning()
	local var_13_0 = {
		popup_title = Engine.CBBHFCGDIC("MENU/NOTICE"),
		message_text = Engine.CBBHFCGDIC("PLATFORM/WARNING_AUTOSAVE"),
		button_text = Engine.CBBHFCGDIC("MENU/CONTINUE"),
		confirmation_action = OpenFirstLevel
	}
	local var_13_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_13_0)

	var_13_1.id = "popmenu_autosave_warning"

	return var_13_1
end

function FakeLoadingScreenOverlay(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIElement.new()

	var_14_0.id = "video_root_id"

	local var_14_1 = LUI.Cinematic.new()

	var_14_1.id = "bink"

	var_14_0:addElement(var_14_1)
	var_14_0:registerEventHandler("menu_create", function(arg_15_0, arg_15_1)
		Engine.BEFHEEBHIA()
		Engine.DFCGFCGBFD("default", VideoPlaybackFlags.LOOP)

		if Engine.CGABICJHAI() then
			local var_15_0
			local var_15_1 = LUI.UIImage.new()

			var_15_1.id = "VignetteRight"

			var_15_1:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
			var_15_1:SetAlpha(1, 0)
			var_15_1:setImage(RegisterMaterial("gradient_curve"), 0)
			var_15_1:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * 72, _1080p * -395, 0, 0)
			arg_15_0:addElement(var_15_1)

			arg_15_0.VignetteRight = var_15_1

			local var_15_2
			local var_15_3 = LUI.UIImage.new()

			var_15_3.id = "VignetteLeft"

			var_15_3:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
			var_15_3:SetAlpha(1, 0)
			var_15_3:SetYRotation(180, 0)
			var_15_3:setImage(RegisterMaterial("gradient_curve"), 0)
			var_15_3:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 395, _1080p * -72, 0, 0)
			arg_15_0:addElement(var_15_3)

			arg_15_0.VignetteLeft = var_15_3
		end

		arg_15_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
			controllerIndex = arg_14_1.controllerIndex
		})
		arg_15_0.HelperBar.id = "HelperBar"

		arg_15_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
		arg_15_0.HelperBar:setPriority(0)
		arg_15_0:addElement(arg_15_0.HelperBar)

		local var_15_4 = LUI.UIBindButton.new()

		var_15_4.id = "selfBindButton"

		arg_15_0:addElement(var_15_4)

		arg_15_0.bindButton = var_15_4
	end)

	local var_14_2 = 2000
	local var_14_3 = 12000
	local var_14_4 = LUI.UITimer.new({
		event = "fastfiles_loaded_poll",
		interval = var_14_2
	})

	var_14_4.id = "timer"

	var_14_0:addElement(var_14_4)

	local var_14_5 = false
	local var_14_6 = false
	local var_14_7 = 0

	var_14_0:registerEventHandler("fastfiles_loaded_poll", function(arg_16_0, arg_16_1)
		if Engine.CHCAFBBGGD() and not var_14_5 then
			var_14_5 = true

			if arg_14_1.onLoadCompleteFunc then
				arg_14_1.onLoadCompleteFunc()
			end

			var_14_4:closeTree()

			var_14_4 = nil
		elseif not var_14_6 then
			var_14_7 = var_14_7 + var_14_2

			if var_14_7 > var_14_3 then
				var_14_6 = true

				arg_16_0.HelperBar.ButtonHelperText:PushButtonPrompt({
					side = "left",
					button_ref = "button_secondary",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
				})
				arg_16_0.bindButton:registerEventHandler("button_secondary", function(arg_17_0, arg_17_1)
					ACTIONS.LeaveMenu()
				end)
			end
		end
	end)
	var_14_0:processEvent({
		name = "fastfiles_loaded_poll"
	})
	LUI.TextChat.SetupMenuForNoChat(var_14_0)

	return var_14_0
end

function FakeLoadingScreenOverlayPop()
	Engine.EBCGADABJ()
end

function popup_warn_sp_progress_not_online()
	Engine.CFIECCHFCA(PauseReason.SAVE_DATA_ERROR)

	local var_19_0 = {
		message_text = Engine.CBBHFCGDIC("MENU/SP_NO_ONLINE_PROGRESS")
	}

	var_19_0.controllerIndex = 0

	function var_19_0.confirmation_action()
		Engine.DIDFHBFDFG(PauseReason.SAVE_DATA_ERROR)
	end

	local var_19_1 = MenuBuilder.BuildRegisteredType("generic_confirmation_popup", var_19_0)

	var_19_1.id = "popup_warn_sp_progress_not_online"

	return var_19_1
end

function campaign_mode_anticheat_warning_popup(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1.lastUnlockedMission

	local function var_21_1()
		Engine.DIDFHBFDFG(PauseReason.SAVE_DATA_ERROR)
	end

	local var_21_2 = {
		defaultFocusIndex = 1,
		width = 600,
		title = Engine.CBBHFCGDIC("MENU_SP/ANTI_CHEAT_WARNING_TITLE"),
		message = Engine.CBBHFCGDIC("MENU_SP/ANTI_CHEAT_WARNING_MESSAGE", var_21_0),
		cancelAction = var_21_1,
		buttons = {
			{
				label = Engine.CBBHFCGDIC("MENU_SP/ANTI_CHEAT_WARNING_QUIT"),
				action = function(arg_23_0, arg_23_1)
					Dvar.DHEGHJJJHI("NMMPTOSMKQ", true)
					Engine.EBIDFIDHIE("disconnect")
					PreGame.EndDuckAudio()
					Engine.JHFJAJIDC()
				end
			},
			{
				label = Engine.CBBHFCGDIC("MENU_SP/ANTI_CHEAT_WARNING_CONTINUE"),
				action = var_21_1
			}
		}
	}
	local var_21_3 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_21_2)

	var_21_3.id = "campaign_mode_anticheat_warning_popup"

	return var_21_3
end

MenuBuilder.registerType("OverwriteSaveWarningPopup", OverwriteSaveWarningPopup)
MenuBuilder.registerType("ResumeOrRestartPopup", ResumeOrRestartPopup)
MenuBuilder.registerType("ResumeGamePopup", ResumeGamePopup)
MenuBuilder.registerType("overwrite_warning_menu", overwrite_warning_menu)
MenuBuilder.registerType("popmenu_autosave_warning", popmenu_autosave_warning)
MenuBuilder.registerType("FakeLoadingScreenOverlay", FakeLoadingScreenOverlay)
MenuBuilder.registerType("popup_warn_sp_progress_not_online", popup_warn_sp_progress_not_online)
MenuBuilder.registerType("campaign_mode_anticheat_warning_popup", campaign_mode_anticheat_warning_popup)
LUI.FlowManager.RegisterStackPopBehaviour("FakeLoadingScreenOverlay", FakeLoadingScreenOverlayPop)
LockTable(_M)
