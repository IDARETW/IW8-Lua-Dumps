module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
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

local function var_0_1(arg_2_0, arg_2_1)
	if not arg_2_0.FillToggleButton then
		arg_2_0.FillToggleButton = Lobby.CreateFillToggleButton(arg_2_0, arg_2_1)

		arg_2_0.FillToggleButton:addElementBefore(arg_2_0.TutorialButton)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = #arg_3_2

	if var_3_0 > 0 then
		arg_3_1:addElementAfter(arg_3_2[var_3_0])
	elseif arg_3_3 == PlaylistUtils.ButtonType.PROMOTED then
		if Dvar.IBEGCHEFE("LNRQKOQLNN") then
			arg_3_1:addElementBefore(arg_3_0.BRGameModesButton)
		elseif arg_3_0.featuredButtonWidgets and #arg_3_0.featuredButtonWidgets > 1 then
			arg_3_1:addElementAfter(arg_3_0.featuredButtonWidgets[#arg_3_0.featuredButtonWidgets])
		else
			arg_3_1:addElementAfter(arg_3_0.BRGameModesButton)
		end
	elseif Dvar.IBEGCHEFE("LNRQKOQLNN") then
		if arg_3_0.promotedButtonWidgets and #arg_3_0.promotedButtonWidgets > 1 then
			arg_3_1:addElementAfter(arg_3_0.promotedButtonWidgets[#arg_3_0.promotedButtonWidgets])
		else
			arg_3_1:addElementAfter(arg_3_0.BRGameModesButton)
		end
	else
		arg_3_1:addElementAfter(arg_3_0.BRGameModesButton)
	end

	table.insert(arg_3_2, arg_3_1)
end

local function var_0_3(arg_4_0)
	if Dvar.IBEGCHEFE("LNRQKOQLNN") and arg_4_0.promotedButtonWidgets and arg_4_0.promotedButtonWidgets[1] then
		return arg_4_0.promotedButtonWidgets[1]
	end

	return arg_4_0.BRGameModesButton
end

local function var_0_4(arg_5_0)
	return arg_5_0.TutorialButton
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	if not CONDITIONS.IsWZTrialsAccessEnabled(arg_6_0) then
		if not Dvar.IBEGCHEFE("MNRTKTQMLS") then
			arg_6_0.TutorialButton.PlayButtonWrapper.PlayButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/TRAINING")))
		else
			arg_6_0.TutorialButton.PlayButtonWrapper.PlayButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WZ_PRACTICE_MODES")))
		end
	else
		ACTIONS.AnimateSequence(arg_6_0.TutorialButton, "TrialsEnabled")
		arg_6_0.TutorialButton.PlayButtonWrapper.PlayButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WZ_PRACTICE_MODES_AND_TRIALS")))
	end

	arg_6_0.TutorialButton.PlayButtonWrapper.PlayButton:registerEventHandler("button_action", function(arg_7_0, arg_7_1)
		if Dvar.IBEGCHEFE("MNRTKTQMLS") or CONDITIONS.IsBMTutorialMapAvailable() or CONDITIONS.IsWZTrialsAccessEnabled(arg_6_0) then
			local var_7_0 = MenuBuilder.BuildRegisteredType("BRPracticeModesPopup", arg_6_2)

			LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_6_1, false, {
				disableQuickAccessShortcuts = false,
				widget = var_7_0
			})
		else
			Lobby.AttemptOpenBRTutorial(arg_6_1, Lobby.BRTutorialLobbyType.TUTORIAL)
		end
	end)
end

local function var_0_6(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_0.TrialEventButton then
		arg_8_0.TrialEventButton:addEventHandler("button_action", function(arg_9_0, arg_9_1)
			TRIALS.OpenTrialEventMenu(arg_8_0, arg_9_1.controller)

			return true
		end)
		arg_8_0.TrialEventButton:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, soundOptions)
		arg_8_0.TrialEventButton:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, soundOptions)
	end
end

local function var_0_7(arg_10_0, arg_10_1)
	arg_10_0.TournamentButton = MenuBuilder.BuildRegisteredType("BRPromotedButton", {
		isTournament = true,
		controllerIndex = arg_10_1
	})
	arg_10_0.TournamentButton.id = "TournamentButton"

	arg_10_0.TournamentButton.GamemodeName:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TOURNAMENT")))
	arg_10_0.TournamentButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/TOURNAMENT_DESC"))
	arg_10_0.TournamentButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"))
	arg_10_0.TournamentButton:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 130)
	arg_10_0.TournamentButton.Background.BackgroundImage:setImage(RegisterMaterial("Button_tournament"))
	arg_10_0.TournamentButton:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, soundOptions)
	arg_10_0.TournamentButton:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, soundOptions)

	local var_10_0 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

	arg_10_0.TournamentButton:SetButtonDisabled(var_10_0)

	if not CONDITIONS.IsMagmaGameMode(arg_10_0) then
		var_0_0(arg_10_0, arg_10_1, arg_10_0.TournamentButton, var_10_0)
	end

	var_0_2(arg_10_0, arg_10_0.TournamentButton, arg_10_0.promotedButtonWidgets, PlaylistUtils.ButtonType.PROMOTED)
end

local function var_0_8(arg_11_0, arg_11_1)
	local function var_11_0()
		local var_12_0 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

		if arg_11_0.BRPlayButton then
			arg_11_0.BRPlayButton:SetButtonDisabled(var_12_0)
			arg_11_0.BRPlayButton.PlayButton:SetButtonDisabled(var_12_0)
		end

		if arg_11_0.TutorialButton then
			arg_11_0.TutorialButton.PlayButtonWrapper.PlayButton:SetButtonDisabled(var_12_0)
		end

		if arg_11_0.FillToggleButton then
			arg_11_0.FillToggleButton:SetButtonDisabled(var_12_0)
		end

		if arg_11_0.TournamentButton then
			arg_11_0.TournamentButton.RegistrationCutoff:SetupRegistrationTimer(false)

			local var_12_1 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

			arg_11_0.TournamentButton.RegistrationCutoff:SetAlpha(var_12_1 and 0 or 1)

			if not TOURNAMENT.IsF2PTournamentAllowed() then
				arg_11_0.TournamentButton:SetButtonDisabled(true)
				arg_11_0.TournamentButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU/TOURNAMENT_EXPIRED"))
			else
				arg_11_0.TournamentButton:SetButtonDisabled(var_12_1)
				arg_11_0.TournamentButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"))
			end
		end

		arg_11_0.BRGameModesButton:SetButtonDisabled(var_12_0)
		PlaylistUtils.UpdateDisabledStateOnButtons(arg_11_1, arg_11_0, arg_11_0.featuredButtonWidgets)
	end

	local var_11_1 = DataSources.frontEnd.lobby.inSplitScreen
	local var_11_2 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_11_3 = DataSources.frontEnd.lobby.memberCount

	arg_11_0:SubscribeToModel(var_11_2:GetModel(arg_11_1), var_11_0, true)
	arg_11_0:SubscribeToModel(var_11_3:GetModel(arg_11_1), var_11_0, true)
	arg_11_0:SubscribeToModel(var_11_1:GetModel(arg_11_1), var_11_0)
	arg_11_0:addEventHandler("update_publisher_variables", var_11_0)
end

local function var_0_9(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.GetFirstButtonWidget = var_0_3
	arg_13_0.GetLastButtonWidget = var_0_4
	arg_13_0.InsertIntoButtonList = var_0_2
	arg_13_0.AddButtonTooltipData = var_0_0
	arg_13_0.AddFillToggleButton = var_0_1
	arg_13_0.UpdateSubscriptions = var_0_8
	arg_13_0.SetupTournamentButton = var_0_7

	var_0_6(arg_13_0, arg_13_1, arg_13_2)
	var_0_5(arg_13_0, arg_13_1, arg_13_2)

	arg_13_0.featuredButtonWidgets = {}
	arg_13_0.promotedButtonWidgets = {}

	var_0_8(arg_13_0, arg_13_1)
end

function BRPlayMenuButtons(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIVerticalList.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 400 * _1080p)

	var_14_0.id = "BRPlayMenuButtons"

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0

	var_14_0:SetSpacing(14 * _1080p)

	local var_14_3
	local var_14_4 = MenuBuilder.BuildRegisteredType("BRGameModePlayButton", {
		controllerIndex = var_14_1
	})

	var_14_4.id = "BRGameModesButton"

	var_14_4.BRPlaylistButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_14_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 792, 0, _1080p * 130)

	local function var_14_5()
		local var_15_0 = var_14_0:GetDataSource().DataSources.frontEnd.MP.playlist.desc:GetValue(var_14_1)

		if var_15_0 ~= nil then
			var_14_4.BRPlaylistButton.Description:setText(var_15_0, 0)
		end
	end

	var_14_4:SubscribeToModelThroughElement(var_14_0, "DataSources.frontEnd.MP.playlist.desc", var_14_5)
	var_14_0:addElement(var_14_4)

	var_14_0.BRGameModesButton = var_14_4

	local var_14_6
	local var_14_7 = MenuBuilder.BuildRegisteredType("BRPlayButton", {
		controllerIndex = var_14_1
	})

	var_14_7.id = "BRPlayButton"

	var_14_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 144, _1080p * 194)
	var_14_0:addElement(var_14_7)

	var_14_0.BRPlayButton = var_14_7

	local var_14_8

	if CONDITIONS.IsTrialEventAvailableInWZ(var_14_0) then
		local var_14_9 = MenuBuilder.BuildRegisteredType("TrialEventAccordionButton", {
			controllerIndex = var_14_1
		})

		var_14_9.id = "TrialEventButton"

		var_14_9.Text:setText(Engine.CBBHFCGDIC("TRIALEVENT/PLAY_MENU_BUTTON"), 0)
		var_14_9.Description:setText(Engine.CBBHFCGDIC("TRIALEVENT/MAIN_MENU_BUTTON_DESC"), 0)
		var_14_9.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_14_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 208, _1080p * 258)
		var_14_0:addElement(var_14_9)

		var_14_0.TrialEventButton = var_14_9
	end

	local var_14_10
	local var_14_11 = MenuBuilder.BuildRegisteredType("BRTrialsPlayButton", {
		controllerIndex = var_14_1
	})

	var_14_11.id = "TutorialButton"

	var_14_11:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 272, _1080p * 322)
	var_14_0:addElement(var_14_11)

	var_14_0.TutorialButton = var_14_11

	var_0_9(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("BRPlayMenuButtons", BRPlayMenuButtons)
LockTable(_M)
