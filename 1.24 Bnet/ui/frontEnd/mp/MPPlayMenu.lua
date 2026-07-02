module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = PlaylistUtils.GetPublicPlaylistDatasources()
	local var_1_1 = false
	local var_1_2 = false
	local var_1_3 = {}
	local var_1_4 = var_1_0:GetCountValue(arg_1_1) - 1

	for iter_1_0 = 0, var_1_4 do
		local var_1_5 = var_1_0:GetDataSourceAtIndex(iter_1_0)
		local var_1_6 = var_1_5.type:GetValue(arg_1_1)

		if var_1_6 == PlaylistUtils.CategoryClass.CORE or var_1_6 == PlaylistUtils.CategoryClass.ALL then
			local var_1_7 = var_1_5.index:GetValue(arg_1_1)

			if Playlist.BICHEFEAHB(var_1_7) and Playlist.FAHJDGFJI(var_1_7) then
				table.insert(var_1_3, var_1_5)
			elseif Playlist.DDIDBIIJIF(var_1_7) then
				local var_1_8 = true

				PlaylistUtils.SetupFeaturedButtons(arg_1_0.MPPlayMenuButtons, arg_1_1, var_1_5)
			elseif Playlist.BIAICJCDDH(var_1_7) then
				arg_1_0.MPPlayMenuButtons:SetQuickplayButtonHardcoreDataSource(var_1_5)
			elseif Playlist.CCJCFIFHJA(var_1_7) then
				if Dvar.IBEGCHEFE("MMTOPPQOON") then
					arg_1_0.MPPlayMenuButtons:SetQuickplayButtonCDLDataSource(var_1_5)
				end
			elseif Playlist.FAHJDGFJI(var_1_7) then
				arg_1_0.MPPlayMenuButtons:SetQuickplayButtonFilteredDataSource(var_1_5)

				var_1_1 = PlaylistUtils.ContainsNewPlaylist(arg_1_1, var_1_5)
			end
		end
	end

	arg_1_0.MPPlayMenuButtons:SetupQuickplayButton(arg_1_1, var_1_1)
	PlaylistUtils.SetupPromotedButtons(arg_1_0.MPPlayMenuButtons, arg_1_1, var_1_3)
	arg_1_0.MPPlayMenuButtons:CheckSubscriptions(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1)
	if not CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(arg_2_0) then
		return
	end

	if arg_2_0.SquadLobbyButton then
		arg_2_0.SquadLobbyButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			LUI.FlowManager.RequestAddMenu("DebugClientCharacters", false, arg_3_1.controller, false, {}, true)
		end)
	end

	if arg_2_0.CODTvButton then
		arg_2_0.CODTvButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
			LUI.FlowManager.RequestAddMenu("CODTvMenu", false, arg_4_1.controller, false, {}, true)
		end)
	end

	arg_2_0.PlaylistMenuButton:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		Dvar.DHEGHJJJHI("MTMMPLSRNL", false)
		LUI.FlowManager.RequestAddMenu("PlaylistMenu", false, arg_5_1.controller, false, {}, true)
	end)

	arg_2_0.MPPlayMenuButtons.QuickPlayButtonContainer.navigation = {}
	arg_2_0.PlaylistMenuButton.navigation = {}

	if arg_2_0.SquadLobbyButton then
		arg_2_0.MPPlayMenuButtons.QuickPlayButtonContainer.navigation.up = arg_2_0.SquadLobbyButton
		arg_2_0.SquadLobbyButton.navigation = {}
		arg_2_0.SquadLobbyButton.navigation.down = arg_2_0.MPPlayMenuButtons.QuickPlayButtonContainer
		arg_2_0.PlaylistMenuButton.navigation.down = arg_2_0.SquadLobbyButton
		arg_2_0.SquadLobbyButton.navigation.up = arg_2_0.PlaylistMenuButton
	end

	if arg_2_0.CODTvButton then
		arg_2_0.CODTvButton.navigation = {}

		if arg_2_0.SquadLobbyButton then
			arg_2_0.SquadLobbyButton.navigation.down = arg_2_0.CODTvButton
			arg_2_0.CODTvButton.navigation.up = arg_2_0.SquadLobbyButton
		else
			arg_2_0.PlaylistMenuButton.navigation.down = arg_2_0.CODTvButton
			arg_2_0.CODTvButton.navigation.up = arg_2_0.PlaylistMenuButton
		end

		arg_2_0.MPPlayMenuButtons.QuickPlayButtonContainer.navigation.up = arg_2_0.CODTvButton
		arg_2_0.CODTvButton.navigation.down = arg_2_0.MPPlayMenuButtons.QuickPlayButtonContainer
	end

	if arg_2_0.MPPlayMenuButtons.GameBattlesButton then
		arg_2_0.MPPlayMenuButtons.GameBattlesButton.navigation = {}
		arg_2_0.MPPlayMenuButtons.GameBattlesButton.navigation.down = arg_2_0.PlaylistMenuButton
		arg_2_0.PlaylistMenuButton.navigation.up = arg_2_0.MPPlayMenuButtons.GameBattlesButton
	elseif arg_2_0.MPPlayMenuButtons.PrivateMatchButton then
		arg_2_0.MPPlayMenuButtons.PrivateMatchButton.navigation = {}
		arg_2_0.MPPlayMenuButtons.PrivateMatchButton.navigation.down = arg_2_0.PlaylistMenuButton
		arg_2_0.PlaylistMenuButton.navigation.up = arg_2_0.MPPlayMenuButtons.PrivateMatchButton
	elseif arg_2_0.MPPlayMenuButtons.TrialsButton then
		arg_2_0.MPPlayMenuButtons.TrialsButton.navigation = {}
		arg_2_0.MPPlayMenuButtons.TrialsButton.navigation.down = arg_2_0.PlaylistMenuButton
		arg_2_0.PlaylistMenuButton.navigation.up = arg_2_0.MPPlayMenuButtons.TrialsButton
	elseif arg_2_0.MPPlayMenuButtons.PlaylistFeaturedButton3 then
		arg_2_0.MPPlayMenuButtons.PlaylistFeaturedButton3.navigation = {}
		arg_2_0.MPPlayMenuButtons.PlaylistFeaturedButton3.navigation.down = arg_2_0.PlaylistMenuButton
		arg_2_0.PlaylistMenuButton.navigation.up = arg_2_0.MPPlayMenuButtons.PlaylistFeaturedButton3
	elseif arg_2_0.MPPlayMenuButtons.PlaylistFeaturedButton2 then
		arg_2_0.MPPlayMenuButtons.PlaylistFeaturedButton2.navigation = {}
		arg_2_0.MPPlayMenuButtons.PlaylistFeaturedButton2.navigation.down = arg_2_0.PlaylistMenuButton
		arg_2_0.PlaylistMenuButton.navigation.up = arg_2_0.MPPlayMenuButtons.PlaylistFeaturedButton2
	elseif arg_2_0.MPPlayMenuButtons.PlaylistFeaturedButton1 then
		arg_2_0.MPPlayMenuButtons.PlaylistFeaturedButton1.navigation = {}
		arg_2_0.MPPlayMenuButtons.PlaylistFeaturedButton1.navigation.down = arg_2_0.PlaylistMenuButton
		arg_2_0.PlaylistMenuButton.navigation.up = arg_2_0.MPPlayMenuButtons.PlaylistFeaturedButton1
	elseif arg_2_0.MPPlayMenuButtons.TournamentButton then
		arg_2_0.MPPlayMenuButtons.TournamentButton.navigation = {}
		arg_2_0.MPPlayMenuButtons.TournamentButton.navigation.down = arg_2_0.PlaylistMenuButton
		arg_2_0.PlaylistMenuButton.navigation.up = arg_2_0.MPPlayMenuButtons.TournamentButton
	else
		arg_2_0.MPPlayMenuButtons.QuickPlayButtonContainer.navigation.down = arg_2_0.PlaylistMenuButton
		arg_2_0.PlaylistMenuButton.navigation.up = arg_2_0.MPPlayMenuButtons.QuickPlayButtonContainer
	end

	local function var_2_0()
		local var_6_0 = Lobby.GFFECBCCF()
		local var_6_1 = Lobby.BGIADHIHAG()
		local var_6_2 = var_6_0 and not var_6_1

		arg_2_0.PlaylistMenuButton:SetButtonDisabled(var_6_2)

		if arg_2_0.SquadLobbyButton then
			arg_2_0.SquadLobbyButton:SetButtonDisabled(var_6_2)
		end

		if arg_2_0.CODTvButton then
			arg_2_0.CODTvButton:SetButtonDisabled(var_6_2)
		end
	end

	local var_2_1 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_2_2 = DataSources.frontEnd.lobby.memberCount

	arg_2_0:SubscribeToModel(var_2_1:GetModel(arg_2_1), var_2_0)
	arg_2_0:SubscribeToModel(var_2_2:GetModel(arg_2_1), var_2_0)
end

local function var_0_2(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_0._challengesVisible == arg_7_1 then
		return
	end

	arg_7_0._challengesVisible = arg_7_1

	if arg_7_2 then
		arg_7_0.Challenges:SetAlpha(0)
	else
		ACTIONS.AnimateSequence(arg_7_0, arg_7_1 and "ShowChallenges" or "HideChallenges")
	end
end

local function var_0_3(arg_8_0)
	if arg_8_0.DoubleXPNotifications then
		local var_8_0 = arg_8_0.DoubleXPNotifications:GetEnablePrompt()
		local var_8_1 = true

		ACTIONS.AnimateSequence(arg_8_0, var_8_1 and "ShowTokenPrompt" or "HideTokenPrompt")
	end
end

local function var_0_4(arg_9_0, arg_9_1)
	if arg_9_1 and arg_9_0.MPPlayMenuButtons[arg_9_1] and arg_9_0.MPPlayMenuButtons:GetIndexForElement(arg_9_0.MPPlayMenuButtons[arg_9_1]) then
		arg_9_0.MPPlayMenuButtons:processEvent({
			name = "lose_focus"
		})
		arg_9_0.MPPlayMenuButtons[arg_9_1]:processEvent({
			name = "gain_focus"
		})
	end
end

local function var_0_5(arg_10_0, arg_10_1, arg_10_2)
	assert(arg_10_0.MPPlayMenuButtons)
	assert(arg_10_0.Vignette)
	assert(arg_10_0.Challenges)

	arg_10_0._challengesVisible = true
	arg_10_0.FocusButtonByName = var_0_4
	arg_10_0.UpdateChallengesVisibility = var_0_2

	local function var_10_0()
		local var_11_0 = CoD.GetAspectRatioScaleAdjust(0.4)

		arg_10_0.Vignette:SetScale(var_11_0)
		arg_10_0.GradientRight:SetScale(var_11_0)
	end

	arg_10_0:addAndCallEventHandler("onVideoChange", var_10_0)

	local var_10_1 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		enableSway = true,
		controllerIndex = arg_10_1
	})

	var_10_1:SetLimits(-2, 2, -2, 2)
	arg_10_0:addElement(var_10_1)
	Engine.DHFCHIIJCA("squad_lobby")
	var_0_0(arg_10_0, arg_10_1)
	var_0_1(arg_10_0, arg_10_1)

	arg_10_0._maxLobbyCharactersInPlayMenu = FrontEndScene.MaxClientCharactersMPMainMenu
	arg_10_0.characterDetailsWidgets = Lobby.BuildCharacterDetailWidgets(arg_10_0._maxLobbyCharactersInPlayMenu, arg_10_0, arg_10_1)

	if not arg_10_0.characterTimer then
		arg_10_0.characterTimer = LUI.UITimer.new({
			interval = 2000,
			event = "update_client_characters"
		})
		arg_10_0.characterTimer.id = "lobbyTimer"

		arg_10_0:addElement(arg_10_0.characterTimer)
	end

	local function var_10_2()
		local var_12_0 = {
			maxCharactersToShow = arg_10_0._maxLobbyCharactersInPlayMenu,
			widget = arg_10_0,
			dataSourcePath = Lobby.SquadMembersPath
		}

		arg_10_0._clientCharacterMap = Lobby.UpdateClientCharacters(arg_10_1, var_12_0)

		Lobby.UpdateCharacterDetailsWidgets(arg_10_0._clientCharacterMap, arg_10_0.characterDetailsWidgets, arg_10_1)
	end

	local var_10_3 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")

	arg_10_0:SubscribeToModel(var_10_3:GetModel(arg_10_1), function(arg_13_0)
		local var_13_0 = var_10_3:GetValue(arg_13_0)

		if var_13_0 ~= nil then
			arg_10_0._maxLobbyCharactersInPlayMenu = math.min(var_13_0, 6)

			Lobby.UpdateSquadLobbyScene(var_13_0)
		end
	end)
	arg_10_0:registerEventHandler("update_client_characters", function(arg_14_0, arg_14_1)
		var_10_2()
	end)
	var_10_2()
	OPERATOR.ShowGhostTeaser(arg_10_1, arg_10_0)
	arg_10_0:addAndCallEventHandler("update_double_xp_token", function(arg_15_0, arg_15_1)
		var_0_3(arg_15_0)
	end)

	if arg_10_0.CDLRestrictionTag and MLG.IsCDLActive(arg_10_1) then
		local var_10_4 = MP.GetLastQuickplayFilter(arg_10_1)

		arg_10_0.CDLRestrictionTag:SetAlpha(var_10_4 == MP.PLAYLIST_FILTER_MODE.CDLRules and 1 or 0)
	end

	Lobby.PreloadViewHandsForLocalPlayer(arg_10_1)

	if Dvar.IBEGCHEFE("LNLNSSNKQ") then
		arg_10_0._mapInFocus = false

		local var_10_5 = WORLD_MAP.BuildCurrentMap(arg_10_1)

		if var_10_5 then
			arg_10_0:addElement(var_10_5)

			arg_10_0.worldMap = var_10_5
		end

		local function var_10_6(arg_16_0, arg_16_1)
			if arg_10_0.worldMap then
				if not arg_10_0._mapInFocus then
					ACTIONS.AnimateSequence(arg_10_0, "MapFocused")
					arg_10_0:RemoveElement(arg_10_0.MPPlayMenuVerticalLayout)
					arg_10_0:RemoveElement(arg_10_0.BattleRoyaleButton)
					arg_10_0.worldMap:processEvent({
						name = "gain_focus"
					})
					WORLD_MAP.SetHandleMouse(arg_10_0.worldMap, true)

					arg_10_0._mapInFocus = true
				else
					LUI.FlowManager.RequestPopupMenu(nil, "OperationDetailsPopup", true, arg_10_1, false, {})
				end

				return true
			end

			return false
		end

		local function var_10_7(arg_17_0, arg_17_1)
			if arg_10_0.worldMap and arg_10_0._mapInFocus then
				arg_10_0:addElement(arg_10_0.MPPlayMenuVerticalLayout)
				arg_10_0:addElement(arg_10_0.BattleRoyaleButton)
				arg_10_0.worldMap:processEvent({
					name = "lose_focus"
				})
				WORLD_MAP.SetHandleMouse(arg_10_0.worldMap, false)
				ACTIONS.AnimateSequence(arg_10_0, "MenuFocused")

				arg_10_0._mapInFocus = false

				return true
			end

			return false
		end
	end

	arg_10_0:registerEventHandler("matchrules_updated", function(arg_18_0, arg_18_1)
		arg_18_0.CDLRestrictionTag:UpdateVisibility(arg_10_1)
	end)
end

function MPPlayMenu(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIVerticalNavigator.new()

	var_19_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_19_0.id = "MPPlayMenu"
	var_19_0._animationSets = var_19_0._animationSets or {}
	var_19_0._sequences = var_19_0._sequences or {}

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0
	local var_19_3

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(var_19_0) then
		local var_19_4 = LUI.UIImage.new()

		var_19_4.id = "DevButtonsBackground"

		var_19_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
		var_19_4:SetAlpha(0.4, 0)
		var_19_4:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
		var_19_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 544, _1080p * 924, _1080p * 796, _1080p * 1026)
		var_19_0:addElement(var_19_4)

		var_19_0.DevButtonsBackground = var_19_4
	end

	local var_19_5
	local var_19_6 = LUI.UIImage.new()

	var_19_6.id = "Vignette"

	var_19_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_19_6:SetAlpha(0.5, 0)
	var_19_6:setImage(RegisterMaterial("gradient_curve"), 0)
	var_19_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 900, _1080p * 160, _1080p * -70)
	var_19_0:addElement(var_19_6)

	var_19_0.Vignette = var_19_6

	local var_19_7
	local var_19_8 = LUI.UIImage.new()

	var_19_8.id = "GradientRight"

	var_19_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_19_8:SetAlpha(0.5, 0)
	var_19_8:setImage(RegisterMaterial("gradient_curve"), 0)
	var_19_8:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * -900, _1080p * 160, _1080p * -70)
	var_19_0:addElement(var_19_8)

	var_19_0.GradientRight = var_19_8

	local var_19_9
	local var_19_10 = MenuBuilder.BuildRegisteredType("MPPlayMenuButtons", {
		controllerIndex = var_19_1
	})

	var_19_10.id = "MPPlayMenuButtons"

	var_19_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 216, _1080p * 972)
	var_19_0:addElement(var_19_10)

	var_19_0.MPPlayMenuButtons = var_19_10

	local var_19_11

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(var_19_0) then
		local var_19_12 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
			controllerIndex = var_19_1
		})

		var_19_12.id = "PlaylistMenuButton"

		if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(var_19_0) then
			-- block empty
		end

		var_19_12.Text:setText("Playlist Menu", 0)
		var_19_12.Description:setText("OG Playlist menu", 0)
		var_19_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 559, _1080p * 909, _1080p * 843, _1080p * 883)
		var_19_0:addElement(var_19_12)

		var_19_0.PlaylistMenuButton = var_19_12
	end

	local var_19_13

	if CONDITIONS.IsCODTvEnabled(var_19_0) then
		local var_19_14 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_19_1
		})

		var_19_14.id = "CODTvButton"

		if CONDITIONS.IsCODTvEnabled(var_19_0) then
			-- block empty
		end

		var_19_14.Text:SetLeft(_1080p * 20, 0)
		var_19_14.Text:setText(ToUpperCase("COD Tv"), 0)
		var_19_14.Text:SetAlignment(LUI.Alignment.Left)
		var_19_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 559, _1080p * 909, _1080p * 941, _1080p * 979)
		var_19_0:addElement(var_19_14)

		var_19_0.CODTvButton = var_19_14
	end

	local var_19_15

	if CONDITIONS.IsDevelopmentBuild(var_19_0) then
		local var_19_16 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
			controllerIndex = var_19_1
		})

		var_19_16.id = "SquadLobbyButton"

		if CONDITIONS.IsDevelopmentBuild(var_19_0) then
			-- block empty
		end

		var_19_16.Text:setText("Debug Squad Lobby", 0)
		var_19_16.Description:setText("", 0)
		var_19_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 559, _1080p * 909, _1080p * 889, _1080p * 933)
		var_19_0:addElement(var_19_16)

		var_19_0.SquadLobbyButton = var_19_16
	end

	local var_19_17

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(var_19_0) then
		local var_19_18 = LUI.UIText.new()

		var_19_18.id = "DevLabel"

		var_19_18:SetRGBFromTable(SWATCHES.text.primaryText, 0)
		var_19_18:setText("DEVELOPMENT", 0)
		var_19_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_19_18:SetAlignment(LUI.Alignment.Left)
		var_19_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 559, _1080p * 909, _1080p * 803, _1080p * 833)
		var_19_0:addElement(var_19_18)

		var_19_0.DevLabel = var_19_18
	end

	local var_19_19
	local var_19_20 = MenuBuilder.BuildRegisteredType("CRMMain", {
		controllerIndex = var_19_1
	})

	var_19_20.id = "CRMMain"

	var_19_20:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1394, _1080p * 1824, _1080p * -342, _1080p * -66)
	var_19_0:addElement(var_19_20)

	var_19_0.CRMMain = var_19_20

	local var_19_21
	local var_19_22 = MenuBuilder.BuildRegisteredType("ChallengesSummary", {
		controllerIndex = var_19_1
	})

	var_19_22.id = "Challenges"

	var_19_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1394, _1080p * 1824, _1080p * 216, _1080p * 716)
	var_19_0:addElement(var_19_22)

	var_19_0.Challenges = var_19_22

	local var_19_23
	local var_19_24 = MenuBuilder.BuildRegisteredType("DoubleXPNotifications", {
		controllerIndex = var_19_1
	})

	var_19_24.id = "DoubleXPNotifications"

	var_19_24:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1000, _1080p * 1384, _1080p * -223, _1080p * -93)
	var_19_0:addElement(var_19_24)

	var_19_0.DoubleXPNotifications = var_19_24

	local var_19_25
	local var_19_26 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
		controllerIndex = var_19_1
	})

	var_19_26.id = "CDLRestrictionTag"

	var_19_26:SetAlpha(0, 0)
	var_19_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 446, _1080p * 173, _1080p * 203)
	var_19_0:addElement(var_19_26)

	var_19_0.CDLRestrictionTag = var_19_26

	local var_19_27
	local var_19_28 = MenuBuilder.BuildRegisteredType("HappyHourNotificationWidget", {
		controllerIndex = var_19_1
	})

	var_19_28.id = "HappyHourNotificationWidget"

	var_19_28:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1256, _1080p * 1384, _1080p * -364, _1080p * -274)
	var_19_0:addElement(var_19_28)

	var_19_0.HappyHourNotificationWidget = var_19_28

	local var_19_29
	local var_19_30 = MenuBuilder.BuildRegisteredType("BLMBanner", {
		controllerIndex = var_19_1
	})

	var_19_30.id = "BLMBanner"

	var_19_30:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 200, _1080p * 256)
	var_19_0:addElement(var_19_30)

	var_19_0.BLMBanner = var_19_30

	local function var_19_31()
		return
	end

	var_19_0._sequences.DefaultSequence = var_19_31

	local function var_19_32()
		return
	end

	var_19_0._sequences.MapFocused = var_19_32

	local var_19_33
	local var_19_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_19_10:RegisterAnimationSequence("MenuFocused", var_19_34)

	local function var_19_35()
		var_19_10:AnimateSequence("MenuFocused")
	end

	var_19_0._sequences.MenuFocused = var_19_35

	local var_19_36
	local var_19_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1394
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1824
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1920,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2350,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_19_22:RegisterAnimationSequence("HideChallenges", var_19_37)

	local function var_19_38()
		var_19_22:AnimateSequence("HideChallenges")
	end

	var_19_0._sequences.HideChallenges = var_19_38

	local var_19_39
	local var_19_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1920
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2350
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1394,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1824,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_19_22:RegisterAnimationSequence("ShowChallenges", var_19_40)

	local function var_19_41()
		var_19_22:AnimateSequence("ShowChallenges")
	end

	var_19_0._sequences.ShowChallenges = var_19_41

	local var_19_42
	local var_19_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -223
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -93
		}
	}

	var_19_24:RegisterAnimationSequence("ShowTokenPrompt", var_19_43)

	local function var_19_44()
		var_19_24:AnimateSequence("ShowTokenPrompt")
	end

	var_19_0._sequences.ShowTokenPrompt = var_19_44

	local var_19_45
	local var_19_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -189
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -59
		}
	}

	var_19_24:RegisterAnimationSequence("HideTokenPrompt", var_19_46)

	local function var_19_47()
		var_19_24:AnimateSequence("HideTokenPrompt")
	end

	var_19_0._sequences.HideTokenPrompt = var_19_47

	local var_19_48
	local var_19_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_26:RegisterAnimationSequence("ShowCDLRules", var_19_49)

	local function var_19_50()
		var_19_26:AnimateSequence("ShowCDLRules")
	end

	var_19_0._sequences.ShowCDLRules = var_19_50

	var_0_5(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("MPPlayMenu", MPPlayMenu)
LockTable(_M)
