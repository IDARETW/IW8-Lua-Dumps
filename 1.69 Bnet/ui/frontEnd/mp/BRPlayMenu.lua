module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = PlaylistUtils.GetPublicPlaylistDatasources()
	local var_1_1 = var_1_0:GetCountValue(arg_1_1) - 1

	arg_1_0._devDataSourcesFromPlaylistFile = {}

	for iter_1_0 = 0, var_1_1 do
		local var_1_2 = var_1_0:GetDataSourceAtIndex(iter_1_0)
		local var_1_3 = var_1_2.type:GetValue(arg_1_1)

		if var_1_3 == PlaylistUtils.CategoryClass.MAGMA or var_1_3 == PlaylistUtils.CategoryClass.ALL then
			local var_1_4 = var_1_2.index:GetValue(arg_1_1)

			if Playlist.CFECCDIFGE(var_1_4) then
				if var_1_2.playlists:GetCountValue(arg_1_1) > 1 then
					arg_1_0.BRPlayMenuButtons:SetupBRGameModesButton(arg_1_1, var_1_2, {
						id = "WZ_CategoryButton_" .. var_1_4
					})
				elseif Playlist.BICHEFEAHB(var_1_4) then
					PlaylistUtils.SetupPromotedButtons(arg_1_0.BRPlayMenuButtons, arg_1_1, var_1_2, {
						id = "WZ_PromotedButton_" .. var_1_4
					})
				else
					PlaylistUtils.SetupFeaturedButtons(arg_1_0.BRPlayMenuButtons, arg_1_1, var_1_2, {
						id = "WZ_FeatureButton_" .. var_1_4
					})
				end
			else
				table.insert(arg_1_0._devDataSourcesFromPlaylistFile, var_1_2)
			end
		end
	end

	PlaylistUtils.AddDisableOtherButtonFocusOnButtons(arg_1_0.BRPlayMenuButtons)
	arg_1_0.BRPlayMenuButtons:UpdateSubscriptions(arg_1_1)

	if TOURNAMENT.IsF2PTournamentAllowed() then
		arg_1_0.BRPlayMenuButtons:SetupTournamentButton(arg_1_1)
	end

	if Dvar.IBEGCHEFE("NKOOQPNSKM") then
		arg_1_0.BRPlayMenuSquadButtons:AddFillToggleButton(arg_1_1)
	end

	if not Dvar.IBEGCHEFE("LKOQOKRKPM") then
		arg_1_0.BRPlayMenuSquadButtons:AddLookForPartyButton(arg_1_1)
	end

	arg_1_0.BRPlayMenuButtons:UpdateSubscriptions(arg_1_1)
	arg_1_0.BRPlayMenuSquadButtons:UpdateSubscriptions(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1)
	ACTIONS.AnimateSequence(arg_2_0, "InitDevLayout")
	arg_2_0.PlaylistMenuButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		Dvar.DHEGHJJJHI("MTMMPLSRNL", false)
		LUI.FlowManager.RequestAddMenu("PlaylistMenu", false, arg_3_1.controller, false, {}, true)
	end)

	if arg_2_0.SquadLobbyButton then
		arg_2_0.SquadLobbyButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
			LUI.FlowManager.RequestAddMenu("DebugClientCharacters", false, arg_4_1.controller, false, {}, true)
		end)
	end

	arg_2_0._firstButtonWidget.navigation = {}
	arg_2_0._firstButtonWidget.navigation.up = arg_2_0.PlaylistMenuButton
	arg_2_0._lastButtonWidget.navigation = {}
	arg_2_0._firstSquadButtonWidget.navigation = {}
	arg_2_0._lastButtonWidget.navigation.down = arg_2_0._firstSquadButtonWidget
	arg_2_0._firstSquadButtonWidget.navigation.up = arg_2_0._lastButtonWidget
	arg_2_0._lastSquadButtonWidget.navigation = {}
	arg_2_0.PlaylistMenuButton.navigation = {}
	arg_2_0.PlaylistMenuButton.navigation.down = arg_2_0._firstButtonWidget
	arg_2_0.PlaylistMenuButton.navigation.up = arg_2_0._lastSquadButtonWidget
	arg_2_0._lastSquadButtonWidget.navigation.down = arg_2_0.PlaylistMenuButton

	if arg_2_0.SquadLobbyButton then
		arg_2_0.SquadLobbyButton.navigation = {}

		if arg_2_0.PlaylistEventButton then
			arg_2_0.PlaylistEventButton.navigation.up = arg_2_0.SquadLobbyButton
			arg_2_0.SquadLobbyButton.navigation.down = arg_2_0.PlaylistEventButton
		end

		arg_2_0.PlaylistMenuButton.navigation.down = arg_2_0.SquadLobbyButton
		arg_2_0.SquadLobbyButton.navigation.up = arg_2_0.PlaylistMenuButton
	end

	local function var_2_0()
		local var_5_0 = Lobby.GFFECBCCF()
		local var_5_1 = Lobby.BGIADHIHAG()
		local var_5_2 = var_5_0 and not var_5_1

		arg_2_0.PlaylistMenuButton:SetButtonDisabled(var_5_2)

		if arg_2_0.SquadLobbyButton then
			arg_2_0.SquadLobbyButton:SetButtonDisabled(var_5_2)
		end
	end

	local var_2_1 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_2_2 = DataSources.frontEnd.lobby.memberCount

	arg_2_0:SubscribeToModel(var_2_1:GetModel(arg_2_1), var_2_0)
	arg_2_0:SubscribeToModel(var_2_2:GetModel(arg_2_1), var_2_0)

	local var_2_3 = 0

	if arg_2_0._devDataSourcesFromPlaylistFile then
		local var_2_4
		local var_2_5
		local var_2_6 = arg_2_0.SquadLobbyButton and arg_2_0.SquadLobbyButton or arg_2_0.PlaylistMenuButton

		for iter_2_0, iter_2_1 in ipairs(arg_2_0._devDataSourcesFromPlaylistFile) do
			local var_2_7 = "BRPlayButton" .. var_2_3

			arg_2_0[var_2_7] = MenuBuilder.BuildRegisteredType("BRPlayButton", {
				controllerIndex = arg_2_1
			})
			arg_2_0[var_2_7].id = var_2_7

			arg_2_0[var_2_7]:SetAnchorsAndPosition(0, 1, 0, 1, 375, _1080p * 805, _1080p * (730 + var_2_3 * 50), _1080p * (780 + var_2_3 * 50))
			arg_2_0:addElement(arg_2_0[var_2_7])
			arg_2_0[var_2_7]:Setup(arg_2_1, iter_2_1)

			var_2_3 = var_2_3 + 1
			arg_2_0[var_2_7].navigation = {}
			arg_2_0[var_2_7].navigation.down = arg_2_0._firstButtonWidget
			arg_2_0._firstButtonWidget.navigation.up = arg_2_0[var_2_7]

			if var_2_5 then
				arg_2_0[var_2_7].navigation.up = arg_2_0[var_2_5]
				arg_2_0[var_2_5].navigation.down = arg_2_0[var_2_7]
			else
				arg_2_0[var_2_7].navigation.up = var_2_6
				var_2_6.navigation.down = arg_2_0[var_2_7]
			end

			var_2_5 = var_2_7
		end
	end
end

local function var_0_2(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_0._challengesVisible == arg_6_1 then
		return
	end

	arg_6_0._challengesVisible = arg_6_1
end

local function var_0_3(arg_7_0, arg_7_1)
	if arg_7_0.BRPlayMenuSquadButtons then
		arg_7_0.BRPlayMenuSquadButtons:UpdateLockStatus(arg_7_1)
	end
end

local function var_0_4(arg_8_0)
	if arg_8_0.DoubleXPNotifications then
		local var_8_0 = arg_8_0.DoubleXPNotifications:GetEnablePrompt()

		ACTIONS.AnimateSequence(arg_8_0, var_8_0 and "ShowTokenPrompt" or "HideTokenPrompt")
	end
end

local function var_0_5(arg_9_0, arg_9_1)
	if arg_9_1 and arg_9_0.BRPlayMenuButtons[arg_9_1] and arg_9_0.BRPlayMenuButtons:GetIndexForElement(arg_9_0.BRPlayMenuButtons[arg_9_1]) then
		arg_9_0.BRPlayMenuButtons:processEvent({
			name = "lose_focus"
		})
		arg_9_0.BRPlayMenuButtons[arg_9_1]:processEvent({
			name = "gain_focus"
		})
	end
end

local function var_0_6(arg_10_0)
	if AAR.IsMatchClientDataAvailable() then
		local var_10_0 = LUI.UIBindButton.new()

		var_10_0.id = "bindButton"

		arg_10_0:addElement(var_10_0)

		arg_10_0.bindButton = var_10_0

		arg_10_0.bindButton:registerEventHandler("button_left_trigger", function(arg_11_0, arg_11_1)
			Lobby.OpenAfterActionReport(arg_11_1.controller, true, false)
		end)
	end
end

local function var_0_7(arg_12_0, arg_12_1, arg_12_2)
	assert(arg_12_0.BRPlayMenuButtons)
	assert(arg_12_0.BRPlayMenuSquadButtons)
	assert(arg_12_0.Vignette)

	Lobby.lfpPlaylistBtnCount = 0

	var_0_0(arg_12_0, arg_12_1)

	arg_12_0._challengesVisible = true
	arg_12_0._firstButtonWidget = arg_12_0.BRPlayMenuButtons:GetElementAtIndex(1)
	arg_12_0._lastButtonWidget = arg_12_0.BRPlayMenuButtons:GetLastElement()
	arg_12_0._firstSquadButtonWidget = arg_12_0.BRPlayMenuSquadButtons:GetElementAtIndex(1)
	arg_12_0._lastSquadButtonWidget = arg_12_0.BRPlayMenuSquadButtons:GetLastElement()
	arg_12_0.FocusButtonByName = var_0_5
	arg_12_0._challengesVisible = nil
	arg_12_0.UpdateChallengesVisibility = var_0_2
	arg_12_0.UpdateSquadButtonLockStatus = var_0_3

	LAYOUT.SetupScalingBackgroundVignette(arg_12_0)

	local var_12_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		enableSway = true,
		controllerIndex = arg_12_1
	})

	var_12_0:SetLimits(-2, 2, -2, 2)
	arg_12_0:addElement(var_12_0)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(arg_12_0) then
		var_0_1(arg_12_0, arg_12_1)
	else
		arg_12_0._firstButtonWidget.navigation = {}
		arg_12_0._lastButtonWidget.navigation = {}
		arg_12_0._firstSquadButtonWidget.navigation = {}
		arg_12_0._lastSquadButtonWidget.navigation = {}
		arg_12_0._firstButtonWidget.navigation.up = arg_12_0._lastSquadButtonWidget
		arg_12_0._lastButtonWidget.navigation.down = arg_12_0._firstSquadButtonWidget
		arg_12_0._firstSquadButtonWidget.navigation.up = arg_12_0._lastButtonWidget
		arg_12_0._lastSquadButtonWidget.navigation.down = arg_12_0._firstButtonWidget
	end

	arg_12_0._maxLobbyCharactersInPlayMenu = FrontEndScene.MaxClientCharactersMPMainMenu
	arg_12_0.characterDetailsWidgets = Lobby.BuildCharacterDetailWidgets(arg_12_0._maxLobbyCharactersInPlayMenu, arg_12_0, arg_12_1)

	if not arg_12_0.characterTimer then
		arg_12_0.characterTimer = LUI.UITimer.new({
			interval = 2000,
			event = "update_client_characters"
		})
		arg_12_0.characterTimer.id = "lobbyTimer"

		arg_12_0:addElement(arg_12_0.characterTimer)
	end

	local function var_12_1()
		local var_13_0 = {
			maxCharactersToShow = arg_12_0._maxLobbyCharactersInPlayMenu,
			widget = arg_12_0,
			dataSourcePath = Lobby.SquadMembersPath
		}

		Lobby.UpdateClientCharactersDelayed(arg_12_0, arg_12_1, var_13_0, function(arg_14_0)
			arg_12_0._clientCharacterMap = arg_14_0

			Lobby.UpdateCharacterDetailsWidgets(arg_12_0._clientCharacterMap, arg_12_0.characterDetailsWidgets, arg_12_1)
		end)
	end

	OPERATOR.ShowGhostTeaser(arg_12_1, arg_12_0)
	arg_12_0:addAndCallEventHandler("update_double_xp_token", function(arg_15_0, arg_15_1)
		var_0_4(arg_15_0)
	end)

	local var_12_2 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")

	arg_12_0:SubscribeToModel(var_12_2:GetModel(arg_12_1), function(arg_16_0)
		local var_16_0 = var_12_2:GetValue(arg_16_0)

		if var_16_0 ~= nil then
			arg_12_0._maxLobbyCharactersInPlayMenu = math.min(var_16_0, 6)

			Lobby.UpdateSquadLobbyScene(var_16_0)
		end
	end)
	arg_12_0:registerEventHandler("update_client_characters", function(arg_17_0, arg_17_1)
		var_12_1()
	end)
	var_12_1()
	Lobby.PreloadViewHandsForLocalPlayer(arg_12_1)
	var_0_6(arg_12_0)

	if arg_12_0.EventPromoBanner then
		arg_12_0.EventPromoBanner:Setup()
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_12_0, "WZWipSetup")
	end

	if Dvar.CFHDGABACF("NOSQLRPRKO") ~= 1 then
		local var_12_3, var_12_4, var_12_5, var_12_6 = MAIN_MENU.GetCortezProductOwned(arg_12_1, true)

		if var_12_4 and var_12_4.owned then
			if not Onboarding.CortezInstantGratPopup.WasCompleted(arg_12_0, arg_12_1) then
				LUI.FlowManager.RequestPopupMenu(arg_12_0, "InstantGratPopup", true, arg_12_1, false)
			elseif Dvar.CFHDGABACF("MNNPPNRKMN") == 1 and not Onboarding.CortezInstantGratPopupAfterSeasonStart.WasCompleted(arg_12_0, arg_12_1) then
				LUI.FlowManager.RequestPopupMenu(arg_12_0, "InstantGratPopup", true, arg_12_1, false)
			end
		end
	end

	arg_12_0:addEventHandler("gift_queued_in", function(arg_18_0, arg_18_1)
		GIFT.ProcessQueuedBundleGifts(arg_12_1)

		return true
	end)
	GIFT.ProcessQueuedBundleGifts(arg_12_1)

	if CONDITIONS.IsPostSeason() then
		ACTIONS.AnimateSequence(arg_12_0, "HideXPBoost")
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_12_0, "Arabic")
	end
end

function BRPlayMenu(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIVerticalNavigator.new()

	var_19_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_19_0.id = "BRPlayMenu"
	var_19_0._animationSets = var_19_0._animationSets or {}
	var_19_0._sequences = var_19_0._sequences or {}

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_19_1
	})

	var_19_4.id = "Vignette"

	var_19_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_19_0:addElement(var_19_4)

	var_19_0.Vignette = var_19_4

	local var_19_5
	local var_19_6 = MenuBuilder.BuildRegisteredType("BRPlayMenuButtons", {
		controllerIndex = var_19_1
	})

	var_19_6.id = "BRPlayMenuButtons"

	var_19_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 216, _1080p * 616)
	var_19_0:addElement(var_19_6)

	var_19_0.BRPlayMenuButtons = var_19_6

	local var_19_7
	local var_19_8 = MenuBuilder.BuildRegisteredType("BRPlayMenuSquadButtons", {
		controllerIndex = var_19_1
	})

	var_19_8.id = "BRPlayMenuSquadButtons"

	var_19_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 526, _1080p * -222, _1080p * -106)
	var_19_0:addElement(var_19_8)

	var_19_0.BRPlayMenuSquadButtons = var_19_8

	local var_19_9
	local var_19_10 = LUI.UIText.new()

	var_19_10.id = "SquadLabel"

	var_19_10:SetRGBFromTable(SWATCHES.CH2.TabMenuNoFocus, 0)
	var_19_10:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/SQUAD_AND_PARTY")), 0)
	var_19_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_19_10:SetAlignment(LUI.Alignment.Left)
	var_19_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 526, _1080p * -254, _1080p * -224)
	var_19_0:addElement(var_19_10)

	var_19_0.SquadLabel = var_19_10

	local var_19_11

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled() then
		var_19_11 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
			controllerIndex = var_19_1
		})
		var_19_11.id = "PlaylistMenuButton"

		var_19_11:SetAlpha(0, 0)

		if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled() then
			-- block empty
		end

		var_19_11.Text:setText("Playlist Menu", 0)
		var_19_11.Description:setText("OG Playlist menu", 0)
		var_19_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 565, _1080p * 915, _1080p * 876, _1080p * 916)
		var_19_0:addElement(var_19_11)

		var_19_0.PlaylistMenuButton = var_19_11
	end

	local var_19_12

	if CONDITIONS.IsDevelopmentBuild() then
		var_19_12 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
			controllerIndex = var_19_1
		})
		var_19_12.id = "SquadLobbyButton"

		if CONDITIONS.IsDevelopmentBuild() then
			-- block empty
		end

		var_19_12.Text:setText("Debug Squad Lobby", 0)
		var_19_12.Description:setText("", 0)
		var_19_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 564, _1080p * 914, _1080p * 918, _1080p * 962)
		var_19_0:addElement(var_19_12)

		var_19_0.SquadLobbyButton = var_19_12
	end

	local var_19_13

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled() then
		var_19_13 = LUI.UIText.new()
		var_19_13.id = "DevLabel"

		var_19_13:SetRGBFromTable(SWATCHES.text.primaryText, 0)
		var_19_13:SetAlpha(0, 0)
		var_19_13:setText("DEVELOPMENT", 0)
		var_19_13:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_19_13:SetAlignment(LUI.Alignment.Left)
		var_19_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 565, _1080p * 915, _1080p * 836, _1080p * 866)
		var_19_0:addElement(var_19_13)

		var_19_0.DevLabel = var_19_13
	end

	local var_19_14

	if not CONDITIONS.IsWebMotdEnabled() then
		local var_19_15 = MenuBuilder.BuildRegisteredType("CRMMain", {
			controllerIndex = var_19_1
		})

		var_19_15.id = "CRMMain"

		var_19_15:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -526, _1080p * -96, _1080p * 236, _1080p * 511)
		var_19_0:addElement(var_19_15)

		var_19_0.CRMMain = var_19_15
	end

	local var_19_16

	if CONDITIONS.IsWebMotdEnabled() then
		local var_19_17 = MenuBuilder.BuildRegisteredType("CRMWeb", {
			controllerIndex = var_19_1
		})

		var_19_17.id = "CRMWeb"

		var_19_17:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -526, _1080p * -96, _1080p * 220, _1080p * 470)
		var_19_0:addElement(var_19_17)

		var_19_0.CRMWeb = var_19_17
	end

	local var_19_18
	local var_19_19 = MenuBuilder.BuildRegisteredType("ChallengesSummary", {
		controllerIndex = var_19_1
	})

	var_19_19.id = "Challenges"

	var_19_19:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -526, _1080p * -96, _1080p * -346, _1080p * 36)
	var_19_0:addElement(var_19_19)

	var_19_0.Challenges = var_19_19

	local var_19_20
	local var_19_21 = MenuBuilder.BuildRegisteredType("HappyHourNotificationWidget", {
		controllerIndex = var_19_1
	})

	var_19_21.id = "HappyHourNotificationWidget"

	var_19_21:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -666, _1080p * -538, _1080p * 129, _1080p * 221)
	var_19_0:addElement(var_19_21)

	var_19_0.HappyHourNotificationWidget = var_19_21

	local var_19_22

	if CONDITIONS.IsEventPromoActive() then
		local var_19_23 = MenuBuilder.BuildRegisteredType("EventPromoBanner", {
			controllerIndex = var_19_1
		})

		var_19_23.id = "EventPromoBanner"

		var_19_23:SetAlpha(0, 0)
		var_19_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 173, _1080p * 203)
		var_19_0:addElement(var_19_23)

		var_19_0.EventPromoBanner = var_19_23
	end

	local var_19_24
	local var_19_25 = LUI.UIImage.new()

	var_19_25.id = "SquadIcon"

	var_19_25:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_19_25:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 450, _1080p * 494, _1080p * -156, _1080p * -113)
	var_19_0:addElement(var_19_25)

	var_19_0.SquadIcon = var_19_25

	local var_19_26

	if not CONDITIONS.IsPostSeasonAndMagma() then
		local var_19_27 = MenuBuilder.BuildRegisteredType("WideDoubleXPNotifications", {
			controllerIndex = var_19_1
		})

		var_19_27.id = "DoubleXPNotifications"

		var_19_27:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -526, _1080p * -96, _1080p * 42, _1080p * 204)
		var_19_0:addElement(var_19_27)

		var_19_0.DoubleXPNotifications = var_19_27
	end

	local var_19_28

	if CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
		var_19_28 = MenuBuilder.BuildRegisteredType("XPBoost", {
			controllerIndex = var_19_1
		})
		var_19_28.id = "XPBoost"

		var_19_28:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -1120, _1080p * -536, _1080p * 236, _1080p * 418)
		var_19_0:addElement(var_19_28)

		var_19_0.XPBoost = var_19_28
	end

	local var_19_29

	if CONDITIONS.SeasonalEventIsFestiveFervor() then
		local var_19_30 = MenuBuilder.BuildRegisteredType("DailyModifierCountdown", {
			controllerIndex = var_19_1
		})

		var_19_30.id = "DailyTimer"

		var_19_30:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 564, _1080p * 994, _1080p * -222, _1080p * -106)
		var_19_0:addElement(var_19_30)

		var_19_0.DailyTimer = var_19_30
	end

	local function var_19_31()
		return
	end

	var_19_0._sequences.DefaultSequence = var_19_31

	local var_19_32
	local var_19_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_6:RegisterAnimationSequence("MenuFocused", var_19_33)

	local function var_19_34()
		var_19_6:AnimateSequence("MenuFocused")
	end

	var_19_0._sequences.MenuFocused = var_19_34

	local var_19_35
	local var_19_36 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_19_19:RegisterAnimationSequence("HideChallenges", var_19_36)

	local function var_19_37()
		var_19_19:AnimateSequence("HideChallenges")
	end

	var_19_0._sequences.HideChallenges = var_19_37

	local var_19_38
	local var_19_39 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_19_19:RegisterAnimationSequence("ShowChallenges", var_19_39)

	local function var_19_40()
		var_19_19:AnimateSequence("ShowChallenges")
	end

	var_19_0._sequences.ShowChallenges = var_19_40

	local var_19_41

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled() then
		local var_19_42 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 565
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 915
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 633
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 673
			}
		}

		var_19_11:RegisterAnimationSequence("InitDevLayout", var_19_42)
	end

	if CONDITIONS.IsDevelopmentBuild() then
		local var_19_43 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 564
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 914
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 675
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 719
			}
		}

		var_19_12:RegisterAnimationSequence("InitDevLayout", var_19_43)
	end

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled() then
		local var_19_44 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 565
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 915
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 593
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 623
			}
		}

		var_19_13:RegisterAnimationSequence("InitDevLayout", var_19_44)
	end

	local function var_19_45()
		if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled() then
			var_19_11:AnimateSequence("InitDevLayout")
		end

		if CONDITIONS.IsDevelopmentBuild() then
			var_19_12:AnimateSequence("InitDevLayout")
		end

		if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled() then
			var_19_13:AnimateSequence("InitDevLayout")
		end
	end

	var_19_0._sequences.InitDevLayout = var_19_45

	local var_19_46
	local var_19_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.TabMenuNoFocus
		}
	}

	var_19_10:RegisterAnimationSequence("WZWipSetup", var_19_47)

	local function var_19_48()
		var_19_10:AnimateSequence("WZWipSetup")
	end

	var_19_0._sequences.WZWipSetup = var_19_48

	local var_19_49
	local var_19_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.TabMenuNoFocus
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_19_10:RegisterAnimationSequence("SquadSelected", var_19_50)

	local function var_19_51()
		var_19_10:AnimateSequence("SquadSelected")
	end

	var_19_0._sequences.SquadSelected = var_19_51

	local var_19_52
	local var_19_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.TabMenuNoFocus
		}
	}

	var_19_10:RegisterAnimationSequence("SquadUnSelected", var_19_53)

	local function var_19_54()
		var_19_10:AnimateSequence("SquadUnSelected")
	end

	var_19_0._sequences.SquadUnSelected = var_19_54

	local var_19_55
	local var_19_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 113
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 157
		}
	}

	var_19_25:RegisterAnimationSequence("Arabic", var_19_56)

	local function var_19_57()
		var_19_25:AnimateSequence("Arabic")
	end

	var_19_0._sequences.Arabic = var_19_57

	local var_19_58

	if CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
		local var_19_59 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_19_28:RegisterAnimationSequence("HideXPBoost", var_19_59)
	end

	local function var_19_60()
		if CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
			var_19_28:AnimateSequence("HideXPBoost")
		end
	end

	var_19_0._sequences.HideXPBoost = var_19_60

	var_0_7(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("BRPlayMenu", BRPlayMenu)
LockTable(_M)
