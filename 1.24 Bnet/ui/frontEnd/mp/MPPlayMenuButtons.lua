module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	if arg_1_2.PlayMenuButton then
		arg_1_2 = arg_1_2.PlayMenuButton
	end

	local var_1_0

	if arg_1_3 == true then
		local var_1_1 = arg_1_2.DisabledText and arg_1_2.DisabledText:getText() or Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST")

		var_1_0 = arg_1_2.Description:getText() .. "\n\n^3" .. var_1_1 .. "^7"
	elseif arg_1_2 == arg_1_0.TournamentButton then
		var_1_0 = Engine.CBBHFCGDIC("LUA_MENU/TOURNAMENT_DESC_KBM")
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
	assert(arg_2_0.QuickPlayButtonContainer.QuickPlayButton.Description)
	arg_2_0:SubscribeToModelThroughElement(arg_2_0.QuickPlayButtonContainer.QuickPlayButton, "name", function()
		local var_3_0 = MarkLocalized(arg_2_0.QuickPlayButtonContainer.QuickPlayButton:GetDataSource().name:GetValue(arg_2_1))
		local var_3_1 = "button_alt1"
		local var_3_2 = {
			{
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/FILTER_TYPE_KBM", var_3_0),
				button_ref = var_3_1
			}
		}
		local var_3_3 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

		var_0_0(arg_2_0, arg_2_1, arg_2_0.QuickPlayButtonContainer.QuickPlayButton, var_3_3, var_3_2)
	end)
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0 = #arg_4_2

	if var_4_0 > 0 then
		arg_4_1:addElementAfter(arg_4_2[var_4_0])
	elseif arg_4_3 == PlaylistUtils.ButtonType.PROMOTED then
		if arg_4_0.TrialEventButton then
			arg_4_1:addElementAfter(arg_4_0.TrialEventButton)
		elseif arg_4_0.TournamentButton then
			arg_4_1:addElementAfter(arg_4_0.TournamentButton)
		elseif arg_4_0.QuickPlayButtonContainer then
			arg_4_1:addElementAfter(arg_4_0.QuickPlayButtonContainer)
		end
	else
		local var_4_1 = #arg_4_0.promotedButtonWidgets

		if var_4_1 > 0 then
			arg_4_1:addElementAfter(arg_4_0.promotedButtonWidgets[var_4_1])
		elseif arg_4_0.TrialEventButton then
			arg_4_1:addElementAfter(arg_4_0.TrialEventButton)
		elseif arg_4_0.TournamentButton then
			arg_4_1:addElementAfter(arg_4_0.TournamentButton)
		elseif arg_4_0.QuickPlayButtonContainer then
			arg_4_1:addElementAfter(arg_4_0.QuickPlayButtonContainer)
		end
	end

	table.insert(arg_4_2, arg_4_1)
end

local function var_0_3(arg_5_0, arg_5_1)
	arg_5_0.QuickPlayButtonContainer.QuickPlayButton:SetNormalFilteredDataSource(arg_5_1)
end

local function var_0_4(arg_6_0, arg_6_1)
	arg_6_0.QuickPlayButtonContainer.QuickPlayButton:SetHardcoreFilteredDataSource(arg_6_1)
end

local function var_0_5(arg_7_0, arg_7_1)
	arg_7_0.QuickPlayButtonContainer.QuickPlayButton:SetCDLFilteredDataSource(arg_7_1)
end

local function var_0_6(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.QuickPlayButtonContainer.QuickPlayButton:SetupButton(arg_8_1, arg_8_2)

	local var_8_0 = arg_8_0.QuickPlayButtonContainer.QuickPlayFilterButton.NewItemSmallIcon

	if var_8_0 then
		var_8_0:SetAlpha(arg_8_2 and 1 or 0)
	end
end

local function var_0_7(arg_9_0)
	local var_9_0 = {}

	if arg_9_0.TournamentButton then
		table.insert(var_9_0, arg_9_0.TournamentButton)
	end

	if arg_9_0.TrialEventButton then
		table.insert(var_9_0, arg_9_0.TrialEventButton)
	end

	if arg_9_0.PrivateMatchButton then
		table.insert(var_9_0, arg_9_0.PrivateMatchButton)
	end

	if arg_9_0.QuickPlayButtonContainer then
		for iter_9_0 = 1, #var_9_0 do
			var_9_0[iter_9_0].navigation = {}
			var_9_0[iter_9_0].navigation.right = arg_9_0.QuickPlayButtonContainer.QuickPlayFilterButton
		end
	end
end

local function var_0_8(arg_10_0, arg_10_1)
	local var_10_0 = DataSources.frontEnd.lobby.inSplitScreen
	local var_10_1 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_10_2 = DataSources.frontEnd.lobby.memberCount

	local function var_10_3()
		local var_11_0 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

		if arg_10_0.QuickPlayButtonContainer.QuickPlayButton then
			arg_10_0.QuickPlayButtonContainer.QuickPlayButton:SetButtonDisabled(var_11_0)
		end

		if arg_10_0.TournamentButton then
			arg_10_0.TournamentButton._isTournament = true

			arg_10_0.TournamentButton.RegistrationCutoff:SetupRegistrationTimer(false)

			local var_11_1 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

			arg_10_0.TournamentButton.RegistrationCutoff:SetAlpha(var_11_1 and 0 or 1)

			if not CONDITIONS.IsTournamentModeAllowed() then
				arg_10_0.TournamentButton:SetButtonDisabled(true)
				arg_10_0.TournamentButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU/TOURNAMENT_EXPIRED"))
				var_0_0(arg_10_0, arg_10_1, arg_10_0.TournamentButton, true)
			else
				arg_10_0.TournamentButton:SetButtonDisabled(var_11_1)
				arg_10_0.TournamentButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"))
				var_0_0(arg_10_0, arg_10_1, arg_10_0.TournamentButton, var_11_1)
			end
		end

		if arg_10_0.TrialEventButton then
			var_0_0(arg_10_0, arg_10_1, arg_10_0.TrialEventButton, false)
		end

		if arg_10_0.PrivateMatchButton then
			if not CONDITIONS.IsMPPrivateMatchEnabled() then
				arg_10_0.PrivateMatchButton:SetButtonDisabled(true)
				arg_10_0.PrivateMatchButton.TrialsButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU/FEATURE_TEMPORARILY_DISABLED"))
				var_0_0(arg_10_0, arg_10_1, arg_10_0.PrivateMatchButton.TrialsButton, true)
			else
				local var_11_2 = CONDITIONS.IsGameBattlesAllowed(arg_10_0)
				local var_11_3 = CONDITIONS.AreTrialsEnabled(arg_10_0)
				local var_11_4 = "LUA_MENU/PRIVATE_MATCH"
				local var_11_5 = "PLATFORM/PRIVATE_MATCH_DESC"

				if var_11_2 and var_11_3 then
					var_11_4 = "LUA_MENU/PRIVATE_MATCH_TRIALS_AND_GAMEBATTLES"
					var_11_5 = "PLATFORM/PRIVATE_MATCH_GAMEBATTLES_TRIALS_DESC"
				elseif var_11_2 and not var_11_3 then
					var_11_4 = "LUA_MENU/PRIVATE_MATCH_AND_GAMEBATTLES"
					var_11_5 = "PLATFORM/PRIVATE_MATCH_GAMEBATTLES_DESC"
				elseif not var_11_2 and var_11_3 then
					var_11_4 = "LUA_MENU/PRIVATE_MATCH_AND_TRIALS"
					var_11_5 = "PLATFORM/PRIVATE_MATCH_TRIALS_DESC"
				end

				arg_10_0.PrivateMatchButton:SetButtonDisabled(var_11_0)
				arg_10_0.PrivateMatchButton.TrialsButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"))
				arg_10_0.PrivateMatchButton.TrialsButton.Description:setText(Engine.CBBHFCGDIC(var_11_5))
				arg_10_0.PrivateMatchButton.TrialsButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC(var_11_4)))
				var_0_0(arg_10_0, arg_10_1, arg_10_0.PrivateMatchButton.TrialsButton, var_11_0)
			end
		end

		for iter_11_0 = 1, #arg_10_0.featuredButtonWidgets do
			local var_11_6 = arg_10_0.featuredButtonWidgets[iter_11_0]

			if var_11_0 then
				var_11_6:SetButtonDisabled(var_11_0)
				var_11_6.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"))
				var_0_0(arg_10_0, arg_10_1, var_11_6, var_11_0)
			elseif var_10_0:GetValue(arg_10_1) and not PlaylistUtils.DoesPlaylistSupportSplitScreen(var_11_6:GetDataSource(), arg_10_1) then
				var_11_6:SetButtonDisabled(true)
				var_11_6.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MODE_DOESNOT_SUPPORT_SPLITSCREEN", Engine.JCBDICCAH(var_11_6:GetDataSource().name:GetValue(arg_10_1))))
				var_0_0(arg_10_0, arg_10_1, var_11_6, true)
			else
				var_11_6:SetButtonDisabled(false)
			end
		end

		for iter_11_1 = 1, #arg_10_0.promotedButtonWidgets do
			local var_11_7 = arg_10_0.promotedButtonWidgets[iter_11_1]

			if var_11_0 then
				var_11_7:SetButtonDisabled(var_11_0)
				var_11_7.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"))
				var_0_0(arg_10_0, arg_10_1, var_11_7, var_11_0)
			elseif var_10_0:GetValue(arg_10_1) and not PlaylistUtils.DoesCategorySupportSplitScreen(var_11_7:GetDataSource(), arg_10_1) then
				var_11_7:SetButtonDisabled(true)
				var_11_7.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MODE_DOESNOT_SUPPORT_SPLITSCREEN", Engine.JCBDICCAH(var_11_7:GetDataSource().name:GetValue(arg_10_1))))
				var_0_0(arg_10_0, arg_10_1, var_11_7, true)
			else
				var_11_7:SetButtonDisabled(false)
			end
		end
	end

	arg_10_0:SubscribeToModel(var_10_1:GetModel(arg_10_1), var_10_3, true)
	arg_10_0:SubscribeToModel(var_10_2:GetModel(arg_10_1), var_10_3, true)
	arg_10_0:SubscribeToModel(var_10_0:GetModel(arg_10_1), var_10_3)
	arg_10_0:registerEventHandler("update_publisher_variables", var_10_3)
end

local function var_0_9(arg_12_0, arg_12_1, arg_12_2)
	assert(arg_12_0.QuickPlayButtonContainer.QuickPlayButton)

	arg_12_0.SetupFeaturedButtons = SetupFeaturedButtons
	arg_12_0.SetupQuickplayButton = var_0_6
	arg_12_0.SetupPromotedButtons = SetupPromotedButtons
	arg_12_0.SetQuickplayButtonFilteredDataSource = var_0_3
	arg_12_0.SetQuickplayButtonHardcoreDataSource = var_0_4
	arg_12_0.SetQuickplayButtonCDLDataSource = var_0_5
	arg_12_0.AddButtonTooltipData = var_0_0
	arg_12_0.InsertIntoButtonList = var_0_2
	arg_12_0.CheckSubscriptions = var_0_8
	arg_12_0.featuredButtonWidgets = {}
	arg_12_0.promotedButtonWidgets = {}

	var_0_1(arg_12_0, arg_12_1)
	var_0_7(arg_12_0)

	local var_12_0 = {
		clearChildrenSFX = true
	}

	arg_12_0.QuickPlayButtonContainer:dispatchEventToChildren({
		name = "play_menu_create"
	})

	if arg_12_0.QuickPlayButtonContainer.QuickPlayButton then
		arg_12_0.QuickPlayButtonContainer.QuickPlayButton:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, var_12_0)
		arg_12_0.QuickPlayButtonContainer.QuickPlayButton:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, var_12_0)
	end

	if arg_12_0.TournamentButton then
		arg_12_0.TournamentButton:addEventHandler("button_action", function(arg_13_0, arg_13_1)
			TOURNAMENT.ButtonAction(arg_13_1.controller)
		end)
		arg_12_0.TournamentButton:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, var_12_0)
		arg_12_0.TournamentButton:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, var_12_0)
	end

	if arg_12_0.TrialEventButton then
		arg_12_0.TrialEventButton:addEventHandler("button_action", function(arg_14_0, arg_14_1)
			TRIALS.OpenTrialEventMenu(arg_12_0, arg_14_1.controller)

			return true
		end)
		arg_12_0.TrialEventButton:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, var_12_0)
		arg_12_0.TrialEventButton:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, var_12_0)
	end

	if arg_12_0.PrivateMatchButton then
		arg_12_0.PrivateMatchButton:addEventHandler("button_action", function(arg_15_0, arg_15_1)
			local var_15_0 = MenuBuilder.BuildRegisteredType("PrivateMatchPopup", arg_12_2)

			if CONDITIONS.AreTrialsEnabled(arg_12_0) or CONDITIONS.IsLocalPlayAllowed(arg_12_0) then
				LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", false, arg_15_1.controller, false, {
					disableQuickAccessShortcuts = false,
					widget = var_15_0
				})
			else
				local function var_15_1()
					Lobby.OpenPrivateMatchLobby({
						controller = arg_15_1.controller
					})
				end

				Lobby.TryNavigateToLobby(var_15_1)
			end
		end)
		arg_12_0.PrivateMatchButton:setGainFocusSFX(SOUND_SETS.mpMainMenu.move, var_12_0)
		arg_12_0.PrivateMatchButton:setGainFocusGamepadDifferentSFX(SOUND_SETS.mpMainMenu.moveUp, SOUND_SETS.mpMainMenu.moveDown, var_12_0)
	end
end

function MPPlayMenuButtons(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIVerticalList.new()

	var_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 757 * _1080p)

	var_17_0.id = "MPPlayMenuButtons"

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0

	var_17_0:SetSpacing(14 * _1080p)

	local var_17_3
	local var_17_4 = MenuBuilder.BuildRegisteredType("QuickPlayButtonContainer", {
		controllerIndex = var_17_1
	})

	var_17_4.id = "QuickPlayButtonContainer"

	var_17_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
	var_17_0:addElement(var_17_4)

	var_17_0.QuickPlayButtonContainer = var_17_4

	local var_17_5

	if CONDITIONS.IsTournamentModeAllowed(var_17_0) then
		local var_17_6 = MenuBuilder.BuildRegisteredType("FeaturedAccordionButton", {
			controllerIndex = var_17_1
		})

		var_17_6.id = "TournamentButton"

		var_17_6.Background.BackgroundImage:setImage(RegisterMaterial("button_tournament"), 0)
		var_17_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TOURNAMENT")), 0)
		var_17_6.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/TOURNAMENT_DESC"), 0)
		var_17_6.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
		var_17_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 64, _1080p * 114)
		var_17_0:addElement(var_17_6)

		var_17_0.TournamentButton = var_17_6
	end

	local var_17_7

	if CONDITIONS.IsTrialEventAvailable(var_17_0) then
		local var_17_8 = MenuBuilder.BuildRegisteredType("TrialEventAccordionButton", {
			controllerIndex = var_17_1
		})

		var_17_8.id = "TrialEventButton"

		var_17_8.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("TRIALEVENT/PLAY_MENU_BUTTON")), 0)
		var_17_8.Description:setText(Engine.CBBHFCGDIC("TRIALEVENT/MAIN_MENU_BUTTON_DESC"), 0)
		var_17_8.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
		var_17_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 128, _1080p * 178)
		var_17_0:addElement(var_17_8)

		var_17_0.TrialEventButton = var_17_8
	end

	local var_17_9

	if CONDITIONS.IsMPPrivateMatchEnabled(var_17_0) then
		local var_17_10 = MenuBuilder.BuildRegisteredType("TrialsButton", {
			controllerIndex = var_17_1
		})

		var_17_10.id = "PrivateMatchButton"

		var_17_10.TrialsButton.Background.BackgroundImage:setImage(RegisterMaterial("button_private"), 0)
		var_17_10.TrialsButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PRIVATE_MATCH_AND_TRIALS")), 0)
		var_17_10.TrialsButton.Description:setText(Engine.CBBHFCGDIC("PLATFORM/PRIVATE_MATCH_TRIALS_DESC"), 0)
		var_17_10.TrialsButton.DisabledText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
		var_17_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 192, _1080p * 242)
		var_17_0:addElement(var_17_10)

		var_17_0.PrivateMatchButton = var_17_10
	end

	var_0_9(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("MPPlayMenuButtons", MPPlayMenuButtons)
LockTable(_M)
