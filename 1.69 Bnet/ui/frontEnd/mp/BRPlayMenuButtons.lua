module(..., package.seeall)

local var_0_0 = {
	TRIALS = 3,
	SPECIAL_FIRST = -10,
	LOOK_FOR_PARTY = 40,
	FILL_TOGGLE = 30,
	TUTORIAL = 20
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local var_1_0

	if arg_1_3 == true then
		local var_1_1 = arg_1_2.DisabledText ~= nil and arg_1_2.DisabledText:getText() or Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST")

		var_1_0 = arg_1_2.Description:getText() .. "\n\n^3" .. var_1_1 .. "^7"
	else
		var_1_0 = arg_1_2.Description:getText()
	end

	if arg_1_4 then
		local var_1_2 = {
			tooltipDescription = var_1_0,
			promptsData = arg_1_4
		}

		arg_1_2:AddTooltipData(arg_1_1, var_1_2)
	else
		arg_1_2:AddTooltipData(arg_1_1, {
			tooltipDescription = var_1_0
		})
	end
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0:addElement(arg_2_1)
	table.insert(arg_2_2, arg_2_1)

	Lobby.lfpPlaylistBtnCount = Lobby.lfpPlaylistBtnCount + 1
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	if Dvar.IBEGCHEFE("NLPRPOQLQM") then
		return
	end

	arg_3_0.TutorialButton = MenuBuilder.BuildRegisteredType("BRTrialsPlayButton", {
		controllerIndex = arg_3_1
	})
	arg_3_0.TutorialButton.id = "TutorialButton"

	arg_3_0.TutorialButton:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 128, _1080p * 178)
	arg_3_0.TutorialButton:setPriority(var_0_0.TUTORIAL)
	arg_3_0:addElement(arg_3_0.TutorialButton)

	if not CONDITIONS.IsWZTrialsAccessEnabled(arg_3_0) then
		if not Dvar.IBEGCHEFE("MNRTKTQMLS") then
			arg_3_0.TutorialButton.PlayButtonWrapper.PlayButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/TRAINING")))
		else
			arg_3_0.TutorialButton.PlayButtonWrapper.PlayButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WZ_PRACTICE_MODES")))
		end
	else
		ACTIONS.AnimateSequence(arg_3_0.TutorialButton, "TrialsEnabled")
		arg_3_0.TutorialButton.PlayButtonWrapper.PlayButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WZ_PRIVATE_MATCH_PRACTICE_MODES_AND_TRIALS")))
	end

	local var_3_0 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

	arg_3_0.TutorialButton:SetButtonDisabled(var_3_0)
	arg_3_0.TutorialButton.PlayButtonWrapper.PlayButton:registerEventHandler("button_action", function(arg_4_0, arg_4_1)
		if not (Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()) then
			if CONDITIONS.IsBRPracticeModeAvailable() or CONDITIONS.IsBMTutorialMapAvailable() or CONDITIONS.IsWZTrialsAccessEnabled(arg_3_0) then
				local var_4_0 = MenuBuilder.BuildRegisteredType("BRPracticeModesPopup", arg_3_2)

				LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_3_1, false, {
					disableQuickAccessShortcuts = false,
					widget = var_4_0
				})
			else
				Lobby.AttemptOpenBRTutorial(arg_3_1, Lobby.BRTutorialLobbyType.TUTORIAL)
			end
		end
	end)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	return (PlaylistUtils.BuildPlaylistEventButton(arg_5_0, arg_5_1, {
		_isVanguardTrialEvent = true,
		ignoreCountdownTimer = false,
		eventRefIdDvarName = "MRKOMSNLRK",
		eventAccessPeriodDvarName = "NRMNMOOLSM",
		eventDataSource = CSV.brPlaylistEvents,
		eventButtonAction = function(arg_6_0, arg_6_1)
			local var_6_0 = "CROSS_LAUNCH"
			local var_6_1 = "STORE_DOWNLOAD"

			CrossLaunchUtils.CrossLaunchWithDeepLink(arg_6_0, arg_6_1, {
				_fromPlaylistEventButton = true,
				_useUpsellPopupIfNotOwned = true,
				_deepLinkGame = LUI.DEEP_LINK_GAME.VANGUARD
			})
			METRICS.TrialDownloadInitiatedDLogEvent(arg_5_0, {
				controllerIndex = arg_6_1,
				downloadAction = CONDITIONS.IsOwnerOfCurrentUpsellTitle(arg_6_1) and var_6_0 or var_6_1
			})
		end
	}))
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0
	local var_7_1 = Dvar.CFHDGABACF("NRMNMOOLSM")

	if var_7_1 then
		local var_7_2 = {
			accessPeriod = var_7_1
		}

		var_7_0 = MenuBuilder.BuildRegisteredType("PlaylistFeaturedCoundownTimer", {
			controllerIndex = arg_7_1,
			eventData = var_7_2
		})

		var_7_0:SetButtonDisabled(true)

		var_7_0._allowNavigation = false

		arg_7_0:addElement(var_7_0)
	else
		DebugPrint("[BRPlayMenuButtons] 'wz_playlist_dov2_countdown_enabled' is set, yet no 'wz_playlist_event_access_period_utc' is provided, unable to create timer")
	end

	return var_7_0
end

local function var_0_6(arg_8_0, arg_8_1, arg_8_2)
	if Dvar.IBEGCHEFE("LRQPKPTPSN") then
		local var_8_0 = MenuBuilder.BuildRegisteredType("NewGameRevealCountdownTimer", {
			useTimer = false,
			controllerIndex = arg_8_1,
			eventData = eventInfo,
			gameRevealType = MAIN_MENU.NGGameRevealType.CortezFreeTrial
		})

		arg_8_0:addElement(var_8_0)
	end

	local var_8_1 = Dvar.DHEEJCCJBH("MMOPQOLLMQ")
	local var_8_2 = {
		accessPeriod = var_8_1
	}

	if var_8_1 then
		local var_8_3 = MAIN_MENU.GetNGBladeState()

		if var_8_3 < MAIN_MENU.NGBladeStates.HideCortezRetail then
			local var_8_4 = MenuBuilder.BuildRegisteredType("NewGameRevealCountdownTimer", {
				useTimer = true,
				controllerIndex = arg_8_1,
				eventData = var_8_2,
				gameRevealType = MAIN_MENU.NGGameRevealType.Cortez
			})

			arg_8_0:addElement(var_8_4)
		end

		if var_8_3 >= MAIN_MENU.NGBladeStates.StyxReleaseCountdown then
			local var_8_5 = MenuBuilder.BuildRegisteredType("NewGameRevealCountdownTimer", {
				useTimer = true,
				controllerIndex = arg_8_1,
				eventData = var_8_2,
				gameRevealType = MAIN_MENU.NGGameRevealType.WZ2
			})

			arg_8_0:addElement(var_8_5)
		end
	end
end

local function var_0_7(arg_9_0, arg_9_1, arg_9_2)
	if CONDITIONS.IsTrialEventAvailableInWZ(arg_9_0) then
		arg_9_0.TrialEventButton = MenuBuilder.BuildRegisteredType("TrialEventAccordionButton", {
			controllerIndex = arg_9_1
		})
		arg_9_0.TrialEventButton.id = "TrialEventButton"

		arg_9_0.TrialEventButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("TRIALEVENT/PLAY_MENU_BUTTON")), 0)
		arg_9_0.TrialEventButton.Description:setText(Engine.CBBHFCGDIC("TRIALEVENT/MAIN_MENU_BUTTON_DESC"), 0)
		arg_9_0.TrialEventButton.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		arg_9_0.TrialEventButton:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 64, _1080p * 114)
		arg_9_0.TrialEventButton:setPriority(var_0_0.TRIALS)
		arg_9_0:addElement(arg_9_0.TrialEventButton)
		arg_9_0.TrialEventButton:addEventHandler("button_action", function(arg_10_0, arg_10_1)
			TRIALS.OpenTrialEventMenu(arg_9_0, arg_10_1.controller)

			return true
		end)
		arg_9_0.TrialEventButton:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, soundOptions)
		arg_9_0.TrialEventButton:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, soundOptions)
	end
end

local function var_0_8(arg_11_0, arg_11_1)
	arg_11_0.TournamentButton = MenuBuilder.BuildRegisteredType("BRPromotedButton", {
		isTournament = true,
		controllerIndex = arg_11_1
	})
	arg_11_0.TournamentButton.id = "TournamentButton"

	arg_11_0.TournamentButton.GamemodeName:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TOURNAMENT")))
	arg_11_0.TournamentButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/TOURNAMENT_DESC"))
	arg_11_0.TournamentButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"))
	arg_11_0.TournamentButton:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 130)
	arg_11_0.TournamentButton.Background.BackgroundImage:setImage(RegisterMaterial("Button_tournament"))

	if Dvar.IBEGCHEFE("NLMSQOPNMK") then
		arg_11_0.TournamentButton:setPriority(var_0_0.SPECIAL_FIRST)
	end

	arg_11_0.TournamentButton:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, soundOptions)
	arg_11_0.TournamentButton:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, soundOptions)

	local var_11_0 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

	arg_11_0.TournamentButton:SetButtonDisabled(var_11_0)

	if not CONDITIONS.IsMagmaGameMode(arg_11_0) then
		var_0_1(arg_11_0, arg_11_1, arg_11_0.TournamentButton, var_11_0)
	end

	var_0_2(arg_11_0, arg_11_0.TournamentButton, arg_11_0.promotedButtonWidgets, PlaylistUtils.ButtonType.PROMOTED)
end

local function var_0_9(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = MenuBuilder.BuildRegisteredType("BRGameModePlayButton", {
		controllerIndex = arg_12_1
	})

	var_12_0.id = arg_12_3 and arg_12_3.id and arg_12_3.id or "BRGameModesButton"

	var_12_0.BRPlaylistButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * PlaylistUtils.BR_GAME_MODE_BUTTON_WIDTH, 0, _1080p * PlaylistUtils.BUTTON_COLLAPSE_BOTTOM_SIZE)

	local function var_12_1()
		local var_13_0 = arg_12_0:GetDataSource().DataSources.frontEnd.MP.playlist.desc:GetValue(arg_12_1)

		if var_13_0 ~= nil then
			var_12_0.BRPlaylistButton.Description:setText(var_13_0, 0)
		end
	end

	var_12_0:SubscribeToModelThroughElement(arg_12_0, "DataSources.frontEnd.MP.playlist.desc", var_12_1)
	arg_12_0:addElement(var_12_0)
	table.insert(arg_12_0.brGameModePlayButtonWidgets, var_12_0)

	Lobby.lfpPlaylistBtnCount = Lobby.lfpPlaylistBtnCount + 3

	var_12_0:Setup(arg_12_1, arg_12_2)
end

local function var_0_10(arg_14_0, arg_14_1)
	local function var_14_0()
		local var_15_0 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

		if arg_14_0.TutorialButton then
			arg_14_0.TutorialButton:SetButtonDisabled(var_15_0)
		end

		if arg_14_0.TrialEventButton then
			var_0_1(arg_14_0, arg_14_1, arg_14_0.TrialEventButton, false)
			arg_14_0.TrialEventButton:SetButtonDisabled(var_15_0)
		end

		if arg_14_0.TournamentButton then
			arg_14_0.TournamentButton.RegistrationCutoff:SetupRegistrationTimer(false)
			arg_14_0.TournamentButton.RegistrationCutoff:SetAlpha(var_15_0 and 0 or 1)

			if not TOURNAMENT.IsF2PTournamentAllowed() then
				arg_14_0.TournamentButton:SetButtonDisabled(true)
				arg_14_0.TournamentButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU/TOURNAMENT_EXPIRED"))
			else
				arg_14_0.TournamentButton:SetButtonDisabled(var_15_0)
				arg_14_0.TournamentButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"))
			end

			if Lobby.IsSplitScreenEnabled() then
				arg_14_0.TournamentButton:SetButtonDisabled(true)
				arg_14_0.TournamentButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MODE_DOESNOT_SUPPORT_SPLITSCREEN", Engine.JCBDICCAH(arg_14_0.TournamentButton.GamemodeName:getText())))
			end
		end

		for iter_15_0, iter_15_1 in ipairs(arg_14_0.brGameModePlayButtonWidgets) do
			if iter_15_1 then
				iter_15_1:SetButtonDisabled(var_15_0 or Lobby.IsSplitScreenEnabled())
			end
		end

		PlaylistUtils.UpdateDisabledStateOnButtons(arg_14_1, arg_14_0, arg_14_0.featuredButtonWidgets)
		PlaylistUtils.UpdateDisabledStateOnButtons(arg_14_1, arg_14_0, arg_14_0.promotedButtonWidgets)
	end

	local var_14_1 = DataSources.frontEnd.lobby.inSplitScreen
	local var_14_2 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_14_3 = DataSources.frontEnd.lobby.memberCount

	arg_14_0:SubscribeToModel(var_14_2:GetModel(arg_14_1), var_14_0, true)
	arg_14_0:SubscribeToModel(var_14_3:GetModel(arg_14_1), var_14_0, true)
	arg_14_0:SubscribeToModel(var_14_1:GetModel(arg_14_1), var_14_0)
	arg_14_0:addEventHandler("update_publisher_variables", var_14_0)
end

local function var_0_11(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0.InsertIntoButtonList = var_0_2
	arg_16_0.AddButtonTooltipData = var_0_1
	arg_16_0.UpdateSubscriptions = var_0_10
	arg_16_0.SetupTournamentButton = var_0_8
	arg_16_0.SetupBRGameModesButton = var_0_9

	if Dvar.IBEGCHEFE("NSNLRONNTR") then
		var_0_4(arg_16_0, arg_16_1, arg_16_2)
	elseif Dvar.IBEGCHEFE("wz_playlist_dov2_countdown_enabled") then
		var_0_5(arg_16_0, arg_16_1, arg_16_2)
	elseif CONDITIONS.IsNewGameRevealEventActive() then
		var_0_6(arg_16_0, arg_16_1, arg_16_2)
	end

	var_0_7(arg_16_0, arg_16_1, arg_16_2)
	var_0_3(arg_16_0, arg_16_1, arg_16_2)

	arg_16_0.featuredButtonWidgets = {}
	arg_16_0.promotedButtonWidgets = {}
	arg_16_0.brGameModePlayButtonWidgets = {}
end

function BRPlayMenuButtons(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIVerticalList.new()

	var_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 400 * _1080p)

	var_17_0.id = "BRPlayMenuButtons"

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0

	var_0_11(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("BRPlayMenuButtons", BRPlayMenuButtons)
LockTable(_M)
