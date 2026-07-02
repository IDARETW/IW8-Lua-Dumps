module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if Dvar.IBEGCHEFE("LNRQKOQLNN") then
		if #arg_1_3 > 0 then
			PlaylistUtils.SetupPromotedButtons(arg_1_0.BRPlayMenuButtons, arg_1_1, arg_1_3)
		end

		if arg_1_2 then
			PlaylistUtils.SetupFeaturedButtons(arg_1_0.BRPlayMenuButtons, arg_1_1, arg_1_2)
		end
	else
		if arg_1_2 then
			PlaylistUtils.SetupFeaturedButtons(arg_1_0.BRPlayMenuButtons, arg_1_1, arg_1_2)
		end

		if #arg_1_3 > 0 then
			PlaylistUtils.SetupPromotedButtons(arg_1_0.BRPlayMenuButtons, arg_1_1, arg_1_3)
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = PlaylistUtils.GetPublicPlaylistDatasources()
	local var_2_1 = false
	local var_2_2 = var_2_0:GetCountValue(arg_2_1) - 1
	local var_2_3 = {}
	local var_2_4
	local var_2_5

	for iter_2_0 = 0, var_2_2 do
		local var_2_6 = var_2_0:GetDataSourceAtIndex(iter_2_0)
		local var_2_7 = var_2_6.type:GetValue(arg_2_1)

		if var_2_7 == PlaylistUtils.CategoryClass.MAGMA or var_2_7 == PlaylistUtils.CategoryClass.ALL then
			local var_2_8 = var_2_6.index:GetValue(arg_2_1)

			if Playlist.CAFBGECBDJ(var_2_8) then
				arg_2_0.BRPlayMenuButtons.BRGameModesButton:Setup(arg_2_1, var_2_6)
			elseif Playlist.DDIDBIIJIF(var_2_8) then
				var_2_4 = var_2_6
			elseif Playlist.BICHEFEAHB(var_2_8) then
				table.insert(var_2_3, var_2_6)
			else
				arg_2_0.BRPlayMenuButtons.BRPlayButton:Setup(arg_2_1, var_2_6)

				var_2_1 = true
			end
		end
	end

	arg_2_0.BRPlayMenuButtons:UpdateSubscriptions(arg_2_1)

	if not var_2_1 then
		arg_2_0.BRPlayMenuButtons.BRPlayButton:closeTree()

		arg_2_0.BRPlayMenuButtons.BRPlayButton = nil
	end

	if Dvar.IBEGCHEFE("NLMSQOPNMK") then
		if TOURNAMENT.IsF2PTournamentAllowed() then
			arg_2_0.BRPlayMenuButtons:SetupTournamentButton(arg_2_1)
		end

		var_0_0(arg_2_0, arg_2_1, var_2_4, var_2_3)
	else
		var_0_0(arg_2_0, arg_2_1, var_2_4, var_2_3)

		if TOURNAMENT.IsF2PTournamentAllowed() then
			arg_2_0.BRPlayMenuButtons:SetupTournamentButton(arg_2_1)
		end
	end

	if Dvar.IBEGCHEFE("NKOOQPNSKM") then
		arg_2_0.BRPlayMenuButtons:AddFillToggleButton(arg_2_1)
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	ACTIONS.AnimateSequence(arg_3_0, "InitDevLayout")
	arg_3_0.PlaylistMenuButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		Dvar.DHEGHJJJHI("MTMMPLSRNL", false)
		LUI.FlowManager.RequestAddMenu("PlaylistMenu", false, arg_4_1.controller, false, {}, true)
	end)

	arg_3_0._firstButtonWidget.navigation = {}
	arg_3_0._firstButtonWidget.navigation.up = arg_3_0.PlaylistMenuButton
	arg_3_0._lastButtonWidget.navigation = {}
	arg_3_0.PlaylistMenuButton.navigation = {}
	arg_3_0.PlaylistMenuButton.navigation.down = arg_3_0._firstButtonWidget
	arg_3_0.PlaylistMenuButton.navigation.up = arg_3_0._lastButtonWidget
	arg_3_0._lastButtonWidget.navigation.down = arg_3_0.PlaylistMenuButton

	local function var_3_0()
		local var_5_0 = Lobby.GFFECBCCF()
		local var_5_1 = Lobby.BGIADHIHAG()
		local var_5_2 = var_5_0 and not var_5_1

		arg_3_0.PlaylistMenuButton:SetButtonDisabled(var_5_2)
	end

	local var_3_1 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_3_2 = DataSources.frontEnd.lobby.memberCount

	arg_3_0:SubscribeToModel(var_3_1:GetModel(arg_3_1), var_3_0)
	arg_3_0:SubscribeToModel(var_3_2:GetModel(arg_3_1), var_3_0)
end

local function var_0_3(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_0._challengesVisible == arg_6_1 then
		return
	end

	arg_6_0._challengesVisible = arg_6_1

	if arg_6_2 then
		arg_6_0.Challenges:SetAlpha(0)
	else
		ACTIONS.AnimateSequence(arg_6_0, arg_6_1 and "ShowChallenges" or "HideChallenges")
	end
end

local function var_0_4(arg_7_0)
	if arg_7_0.DoubleXPNotifications then
		local var_7_0 = arg_7_0.DoubleXPNotifications:GetEnablePrompt()
		local var_7_1 = true

		ACTIONS.AnimateSequence(arg_7_0, var_7_1 and "ShowTokenPrompt" or "HideTokenPrompt")
	end
end

local function var_0_5(arg_8_0, arg_8_1)
	if arg_8_1 and arg_8_0.BRPlayMenuButtons[arg_8_1] and arg_8_0.BRPlayMenuButtons:GetIndexForElement(arg_8_0.BRPlayMenuButtons[arg_8_1]) then
		arg_8_0.BRPlayMenuButtons:processEvent({
			name = "lose_focus"
		})
		arg_8_0.BRPlayMenuButtons[arg_8_1]:processEvent({
			name = "gain_focus"
		})
	end
end

local function var_0_6(arg_9_0, arg_9_1, arg_9_2)
	assert(arg_9_0.BRPlayMenuButtons)
	assert(arg_9_0.Vignette)
	assert(arg_9_0.Challenges)
	var_0_1(arg_9_0, arg_9_1)

	arg_9_0._challengesVisible = true
	arg_9_0._lastButtonWidget = arg_9_0.BRPlayMenuButtons:GetLastButtonWidget()
	arg_9_0._firstButtonWidget = arg_9_0.BRPlayMenuButtons:GetFirstButtonWidget()
	arg_9_0.FocusButtonByName = var_0_5
	arg_9_0.UpdateChallengesVisibility = var_0_3

	local function var_9_0()
		local var_10_0 = CoD.GetAspectRatioScaleAdjust(0.4)

		arg_9_0.Vignette:SetScale(var_10_0)
		arg_9_0.GradientRight:SetScale(var_10_0)
	end

	arg_9_0:addAndCallEventHandler("onVideoChange", var_9_0)

	local var_9_1 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		enableSway = true,
		controllerIndex = arg_9_1
	})

	var_9_1:SetLimits(-2, 2, -2, 2)
	arg_9_0:addElement(var_9_1)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(arg_9_0) then
		var_0_2(arg_9_0, arg_9_1)
	end

	arg_9_0._maxLobbyCharactersInPlayMenu = FrontEndScene.MaxClientCharactersMPMainMenu
	arg_9_0.characterDetailsWidgets = Lobby.BuildCharacterDetailWidgets(arg_9_0._maxLobbyCharactersInPlayMenu, arg_9_0, arg_9_1)

	if not arg_9_0.characterTimer then
		arg_9_0.characterTimer = LUI.UITimer.new({
			interval = 2000,
			event = "update_client_characters"
		})
		arg_9_0.characterTimer.id = "lobbyTimer"

		arg_9_0:addElement(arg_9_0.characterTimer)
	end

	local function var_9_2()
		local var_11_0 = {
			maxCharactersToShow = arg_9_0._maxLobbyCharactersInPlayMenu,
			widget = arg_9_0,
			dataSourcePath = Lobby.SquadMembersPath
		}

		arg_9_0._clientCharacterMap = Lobby.UpdateClientCharacters(arg_9_1, var_11_0)

		Lobby.UpdateCharacterDetailsWidgets(arg_9_0._clientCharacterMap, arg_9_0.characterDetailsWidgets, arg_9_1)
	end

	OPERATOR.ShowGhostTeaser(arg_9_1, arg_9_0)
	arg_9_0:addAndCallEventHandler("update_double_xp_token", function(arg_12_0, arg_12_1)
		var_0_4(arg_12_0)
	end)

	local var_9_3 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")

	arg_9_0:SubscribeToModel(var_9_3:GetModel(arg_9_1), function(arg_13_0)
		local var_13_0 = var_9_3:GetValue(arg_13_0)

		if var_13_0 ~= nil then
			arg_9_0._maxLobbyCharactersInPlayMenu = math.min(var_13_0, 6)

			Lobby.UpdateSquadLobbyScene(var_13_0)
		end
	end)
	arg_9_0:registerEventHandler("update_client_characters", function(arg_14_0, arg_14_1)
		var_9_2()
	end)
	var_9_2()
	Lobby.PreloadViewHandsForLocalPlayer(arg_9_1)
end

function BRPlayMenu(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIVerticalNavigator.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_15_0.id = "BRPlayMenu"
	var_15_0._animationSets = var_15_0._animationSets or {}
	var_15_0._sequences = var_15_0._sequences or {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = LUI.UIImage.new()

	var_15_4.id = "Vignette"

	var_15_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_15_4:SetAlpha(0.5, 0)
	var_15_4:setImage(RegisterMaterial("gradient_curve"), 0)
	var_15_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 900, _1080p * 160, _1080p * -70)
	var_15_0:addElement(var_15_4)

	var_15_0.Vignette = var_15_4

	local var_15_5
	local var_15_6 = LUI.UIImage.new()

	var_15_6.id = "GradientRight"

	var_15_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_15_6:SetAlpha(0.5, 0)
	var_15_6:setImage(RegisterMaterial("gradient_curve"), 0)
	var_15_6:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * -900, _1080p * 160, _1080p * -70)
	var_15_0:addElement(var_15_6)

	var_15_0.GradientRight = var_15_6

	local var_15_7
	local var_15_8 = MenuBuilder.BuildRegisteredType("BRPlayMenuButtons", {
		controllerIndex = var_15_1
	})

	var_15_8.id = "BRPlayMenuButtons"

	var_15_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 216, _1080p * 616)
	var_15_0:addElement(var_15_8)

	var_15_0.BRPlayMenuButtons = var_15_8

	local var_15_9

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(var_15_0) then
		var_15_9 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
			controllerIndex = var_15_1
		})
		var_15_9.id = "PlaylistMenuButton"

		var_15_9:SetAlpha(0, 0)

		if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(var_15_0) then
			-- block empty
		end

		var_15_9.Text:setText("Playlist Menu", 0)
		var_15_9.Description:setText("OG Playlist menu", 0)
		var_15_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 565, _1080p * 915, _1080p * 876, _1080p * 916)
		var_15_0:addElement(var_15_9)

		var_15_0.PlaylistMenuButton = var_15_9
	end

	local var_15_10

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(var_15_0) then
		var_15_10 = LUI.UIText.new()
		var_15_10.id = "DevLabel"

		var_15_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
		var_15_10:SetAlpha(0, 0)
		var_15_10:setText("DEVELOPMENT", 0)
		var_15_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_15_10:SetAlignment(LUI.Alignment.Left)
		var_15_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 565, _1080p * 915, _1080p * 836, _1080p * 866)
		var_15_0:addElement(var_15_10)

		var_15_0.DevLabel = var_15_10
	end

	local var_15_11
	local var_15_12 = MenuBuilder.BuildRegisteredType("CRMMain", {
		controllerIndex = var_15_1
	})

	var_15_12.id = "CRMMain"

	var_15_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1394, _1080p * 1824, _1080p * -341, _1080p * -66)
	var_15_0:addElement(var_15_12)

	var_15_0.CRMMain = var_15_12

	local var_15_13
	local var_15_14 = MenuBuilder.BuildRegisteredType("ChallengesSummary", {
		controllerIndex = var_15_1
	})

	var_15_14.id = "Challenges"

	var_15_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1394, _1080p * 1824, _1080p * 216, _1080p * 716)
	var_15_0:addElement(var_15_14)

	var_15_0.Challenges = var_15_14

	local var_15_15
	local var_15_16 = MenuBuilder.BuildRegisteredType("DoubleXPNotifications", {
		controllerIndex = var_15_1
	})

	var_15_16.id = "DoubleXPNotifications"

	var_15_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1000, _1080p * 1384, _1080p * -229, _1080p * -99)
	var_15_0:addElement(var_15_16)

	var_15_0.DoubleXPNotifications = var_15_16

	local var_15_17
	local var_15_18 = MenuBuilder.BuildRegisteredType("HappyHourNotificationWidget", {
		controllerIndex = var_15_1
	})

	var_15_18.id = "HappyHourNotificationWidget"

	var_15_18:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1256, _1080p * 1384, _1080p * -354, _1080p * -264)
	var_15_0:addElement(var_15_18)

	var_15_0.HappyHourNotificationWidget = var_15_18

	local var_15_19
	local var_15_20 = MenuBuilder.BuildRegisteredType("BLMBanner", {
		controllerIndex = var_15_1
	})

	var_15_20.id = "BLMBanner"

	var_15_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 200, _1080p * 256)
	var_15_0:addElement(var_15_20)

	var_15_0.BLMBanner = var_15_20

	local function var_15_21()
		return
	end

	var_15_0._sequences.DefaultSequence = var_15_21

	local var_15_22
	local var_15_23 = {
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

	var_15_8:RegisterAnimationSequence("MenuFocused", var_15_23)

	local function var_15_24()
		var_15_8:AnimateSequence("MenuFocused")
	end

	var_15_0._sequences.MenuFocused = var_15_24

	local var_15_25
	local var_15_26 = {
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

	var_15_14:RegisterAnimationSequence("HideChallenges", var_15_26)

	local function var_15_27()
		var_15_14:AnimateSequence("HideChallenges")
	end

	var_15_0._sequences.HideChallenges = var_15_27

	local var_15_28
	local var_15_29 = {
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

	var_15_14:RegisterAnimationSequence("ShowChallenges", var_15_29)

	local function var_15_30()
		var_15_14:AnimateSequence("ShowChallenges")
	end

	var_15_0._sequences.ShowChallenges = var_15_30

	local var_15_31

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(var_15_0) then
		local var_15_32 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_15_9:RegisterAnimationSequence("InitDevLayout", var_15_32)
	end

	if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(var_15_0) then
		local var_15_33 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_15_10:RegisterAnimationSequence("InitDevLayout", var_15_33)
	end

	local function var_15_34()
		if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(var_15_0) then
			var_15_9:AnimateSequence("InitDevLayout")
		end

		if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled(var_15_0) then
			var_15_10:AnimateSequence("InitDevLayout")
		end
	end

	var_15_0._sequences.InitDevLayout = var_15_34

	local var_15_35
	local var_15_36 = {
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

	var_15_16:RegisterAnimationSequence("HideTokenPrompt", var_15_36)

	local function var_15_37()
		var_15_16:AnimateSequence("HideTokenPrompt")
	end

	var_15_0._sequences.HideTokenPrompt = var_15_37

	local var_15_38
	local var_15_39 = {
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

	var_15_16:RegisterAnimationSequence("ShowTokenPrompt", var_15_39)

	local function var_15_40()
		var_15_16:AnimateSequence("ShowTokenPrompt")
	end

	var_15_0._sequences.ShowTokenPrompt = var_15_40

	var_0_6(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("BRPlayMenu", BRPlayMenu)
LockTable(_M)
