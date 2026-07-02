module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if not arg_1_0.lobbyMemberGrid then
		local var_1_0 = {
			numRows = 4,
			controllerIndex = arg_1_1,
			modelPath = Lobby.AllMembersPath
		}

		arg_1_0.lobbyMemberGrid = MenuBuilder.BuildRegisteredType("LobbyMemberGrid", var_1_0)

		arg_1_0:addElement(arg_1_0.lobbyMemberGrid)
		arg_1_0.lobbyMemberGrid:processEvent({
			name = "gain_focus"
		})
	end
end

local function var_0_1(arg_2_0)
	if arg_2_0.DoubleXPNotifications then
		local var_2_0 = arg_2_0.DoubleXPNotifications:GetEnablePrompt()

		ACTIONS.AnimateSequence(arg_2_0, var_2_0 and "ShowTokenPrompt" or "HideTokenPrompt")
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	Streaming.BDDBGGIC(true)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	assert(arg_3_0.Vignette)
	ACTIONS.ScaleFullscreen(arg_3_0.Vignette)
	var_0_0(arg_3_0, arg_3_1, arg_3_2)

	local var_3_0 = {
		maxCharactersToShow = FrontEndScene.MaxLobbyCharacters,
		widget = arg_3_0,
		dataSourcePath = Lobby.SquadMembersPath
	}

	arg_3_0._clientCharacterMap = Lobby.UpdateClientCharacters(arg_3_1, var_3_0)

	arg_3_0:registerEventHandler("lobby_member_on_over", function(arg_4_0, arg_4_1)
		arg_4_0:SetDataSource(arg_4_1.dataSource, arg_4_1.controller)

		return true
	end)
	arg_3_0:addEventHandler("menu_create", function(arg_5_0, arg_5_1)
		arg_5_0._focusArrow = Lobby.BuildFocusArrowWidget(arg_5_0, arg_3_1)

		local function var_5_0()
			Lobby.UpdateFocusArrow(arg_5_0, arg_5_0._focusArrow, arg_3_1, arg_3_0._clientCharacterMap)
		end

		arg_5_0:SubscribeToModelThroughElement(arg_5_0, "memberIndex", var_5_0)
	end)

	local var_3_1 = LUI.UITimer.new({
		interval = 500,
		event = "update_lobby"
	})

	var_3_1.id = "lobbyTimer"

	arg_3_0:addElement(var_3_1)
	arg_3_0:registerEventHandler("update_lobby", function(arg_7_0, arg_7_1)
		Lobby.UpdateClientCharactersDelayed(arg_3_0, arg_3_1, var_3_0, function(arg_8_0)
			arg_3_0._clientCharacterMap = arg_8_0
		end)

		if CONDITIONS.IsSpecOpsGameType() and arg_3_0.StarRequirements and arg_3_0.StarReward then
			local var_7_0, var_7_1 = Lobby.BGIBDIBHH()

			if var_7_0 == Lobby.PartyState.STARTING or var_7_0 == Lobby.PartyState.STARTING_SOON then
				arg_3_0.StarRequirements:SetAlpha(1)
			end
		end
	end)
	CP.ClearWaveLoadout(arg_3_1)
	CP.ClearAllPickupMunitions(arg_3_1)

	if CONDITIONS.IsThirdGameMode() then
		local function var_3_2()
			if CONDITIONS.IsSpecOpsGameType() and CONDITIONS.AreSpecOpsStarsEnabled() then
				ACTIONS.AnimateSequence(arg_3_0.LobbyMap, "MapHeader")
			else
				ACTIONS.AnimateSequence(arg_3_0.LobbyMap, "MapDefault")
			end
		end

		arg_3_0:SubscribeToModel(DataSources.frontEnd.lobby.gameType:GetModel(arg_3_1), var_3_2)
		var_3_2()
	end

	arg_3_0:addAndCallEventHandler("update_double_xp_token", function(arg_10_0, arg_10_1)
		var_0_1(arg_10_0)
	end)
	assert(arg_3_0.Vignette)
	assert(arg_3_0.GradientRight)
	ACTIONS.ScaleFullscreen(arg_3_0.Vignette)

	if Engine.CGABICJHAI() then
		LAYOUT.AddAspectRatioFadeFrame(arg_3_0, arg_3_1, nil)
	end

	local function var_3_3()
		local var_11_0 = CoD.GetAspectRatioScaleAdjust(0.3)

		arg_3_0.GradientRight:SetScale(var_11_0)
	end

	arg_3_0:addAndCallEventHandler("onVideoChange", var_3_3)
	OPERATOR.ShowGhostTeaser(arg_3_1, arg_3_0)
	Lobby.PreloadViewHandsForLocalPlayer(arg_3_1)

	if CONDITIONS.IsSpecOpsGameType() and arg_3_0.StarRequirements and arg_3_0.StarReward then
		arg_3_0.StarRequirements:SetAlpha(0)
	end

	if arg_3_0.EventPromoBanner then
		arg_3_0.EventPromoBanner:Setup()
	end
end

function CPPublicLobbyPlayMenu(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIVerticalNavigator.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_12_0.id = "CPPublicLobbyPlayMenu"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = LUI.UIImage.new()

	var_12_4.id = "GradientRight"

	var_12_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_12_4:SetAlpha(0.4, 0)
	var_12_4:setImage(RegisterMaterial("gradient_curve"), 0)
	var_12_4:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * -1056, _1080p * 160, _1080p * -70)
	var_12_0:addElement(var_12_4)

	var_12_0.GradientRight = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIImage.new()

	var_12_6.id = "Vignette"

	var_12_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_12_6:SetAlpha(0.5, 0)
	var_12_6:setImage(RegisterMaterial("gradient_curve"), 0)
	var_12_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -1006, _1080p * 160, _1080p * -70)
	var_12_0:addElement(var_12_6)

	var_12_0.Vignette = var_12_6

	local var_12_7
	local var_12_8 = MenuBuilder.BuildRegisteredType("LobbyMap", {
		controllerIndex = var_12_1
	})

	var_12_8.id = "LobbyMap"

	var_12_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 526, _1080p * -336, _1080p * -116)
	var_12_0:addElement(var_12_8)

	var_12_0.LobbyMap = var_12_8

	local var_12_9

	if not CONDITIONS.IsWebMotdEnabled() then
		local var_12_10 = MenuBuilder.BuildRegisteredType("CRMMain", {
			controllerIndex = var_12_1
		})

		var_12_10.id = "CRMMain"

		var_12_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1394, _1080p * 1824, _1080p * -341, _1080p * -66)
		var_12_0:addElement(var_12_10)

		var_12_0.CRMMain = var_12_10
	end

	local var_12_11

	if CONDITIONS.IsWebMotdEnabled() then
		local var_12_12 = MenuBuilder.BuildRegisteredType("CRMWeb", {
			controllerIndex = var_12_1
		})

		var_12_12.id = "CRMWeb"

		var_12_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1394, _1080p * 1802, _1080p * -309, _1080p * -59)
		var_12_0:addElement(var_12_12)

		var_12_0.CRMWeb = var_12_12
	end

	local var_12_13
	local var_12_14 = MenuBuilder.BuildRegisteredType("DoubleXPNotifications", {
		controllerIndex = var_12_1
	})

	var_12_14.id = "DoubleXPNotifications"

	var_12_14:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1000, _1080p * 1384, _1080p * -222, _1080p * -92)
	var_12_0:addElement(var_12_14)

	var_12_0.DoubleXPNotifications = var_12_14

	local var_12_15

	if Engine.EAIICIFIFA() and CONDITIONS.AreSpecOpsStarsEnabled() then
		local var_12_16 = MenuBuilder.BuildRegisteredType("SOStarRequirementsSmall", {
			controllerIndex = var_12_1
		})

		var_12_16.id = "StarRequirements"

		var_12_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 526, _1080p * -245, _1080p * -116)
		var_12_0:addElement(var_12_16)

		var_12_0.StarRequirements = var_12_16
	end

	local var_12_17

	if Engine.EAIICIFIFA() and CONDITIONS.AreSpecOpsRewardsEnabled() then
		local var_12_18 = MenuBuilder.BuildRegisteredType("SOStarRewardNext", {
			controllerIndex = var_12_1
		})

		var_12_18.id = "StarReward"

		var_12_18:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 536, _1080p * 676, _1080p * -336, _1080p * -116)
		var_12_0:addElement(var_12_18)

		var_12_0.StarReward = var_12_18
	end

	local var_12_19
	local var_12_20 = MenuBuilder.BuildRegisteredType("HappyHourNotificationWidget", {
		controllerIndex = var_12_1
	})

	var_12_20.id = "HappyHourNotificationWidget"

	var_12_20:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1256, _1080p * 1384, _1080p * -365, _1080p * -275)
	var_12_0:addElement(var_12_20)

	var_12_0.HappyHourNotificationWidget = var_12_20

	local var_12_21

	if CONDITIONS.IsCpRaidMode() then
		local var_12_22 = MenuBuilder.BuildRegisteredType("CPCheckpointWidget", {
			controllerIndex = var_12_1
		})

		var_12_22.id = "CPCheckpointWidget"

		var_12_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 676, _1080p * 1076, _1080p * 744, _1080p * 844)
		var_12_0:addElement(var_12_22)

		var_12_0.CPCheckpointWidget = var_12_22
	end

	local var_12_23
	local var_12_24 = MenuBuilder.BuildRegisteredType("CPRelicsStripActiveFrontEnd", {
		controllerIndex = var_12_1
	})

	var_12_24.id = "Relics"

	var_12_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 744, _1080p * 794)
	var_12_0:addElement(var_12_24)

	var_12_0.Relics = var_12_24

	local var_12_25
	local var_12_26 = MenuBuilder.BuildRegisteredType("CPPlaylistDifficulty", {
		controllerIndex = var_12_1
	})

	var_12_26.id = "Difficulty"

	var_12_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 939, _1080p * 967)
	var_12_0:addElement(var_12_26)

	var_12_0.Difficulty = var_12_26

	local var_12_27
	local var_12_28 = MenuBuilder.BuildRegisteredType("ChallengesSummary", {
		controllerIndex = var_12_1
	})

	var_12_28.id = "Challenges"

	var_12_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1394, _1080p * 1824, _1080p * 216, _1080p * 716)
	var_12_0:addElement(var_12_28)

	var_12_0.Challenges = var_12_28

	local var_12_29
	local var_12_30 = MenuBuilder.BuildRegisteredType("BLMBanner", {
		controllerIndex = var_12_1
	})

	var_12_30.id = "BLMBanner"

	var_12_30:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 200, _1080p * 256)
	var_12_0:addElement(var_12_30)

	var_12_0.BLMBanner = var_12_30

	local var_12_31

	if CONDITIONS.IsEventPromoActive() then
		local var_12_32 = MenuBuilder.BuildRegisteredType("EventPromoBanner", {
			controllerIndex = var_12_1
		})

		var_12_32.id = "EventPromoBanner"

		var_12_32:SetAlpha(0, 0)
		var_12_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 173, _1080p * 203)
		var_12_0:addElement(var_12_32)

		var_12_0.EventPromoBanner = var_12_32
	end

	local function var_12_33()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_33

	local var_12_34
	local var_12_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 825
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 945
		}
	}

	var_12_14:RegisterAnimationSequence("CRMMinimized", var_12_35)

	local function var_12_36()
		var_12_14:AnimateSequence("CRMMinimized")
	end

	var_12_0._sequences.CRMMinimized = var_12_36

	local var_12_37
	local var_12_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 598
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 718
		}
	}

	var_12_14:RegisterAnimationSequence("CRMMaximized", var_12_38)

	local function var_12_39()
		var_12_14:AnimateSequence("CRMMaximized")
	end

	var_12_0._sequences.CRMMaximized = var_12_39

	local var_12_40
	local var_12_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -222
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -92
		}
	}

	var_12_14:RegisterAnimationSequence("ShowTokenPrompt", var_12_41)

	local function var_12_42()
		var_12_14:AnimateSequence("ShowTokenPrompt")
	end

	var_12_0._sequences.ShowTokenPrompt = var_12_42

	local var_12_43
	local var_12_44 = {
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

	var_12_14:RegisterAnimationSequence("HideTokenPrompt", var_12_44)

	local function var_12_45()
		var_12_14:AnimateSequence("HideTokenPrompt")
	end

	var_12_0._sequences.HideTokenPrompt = var_12_45

	function var_12_0.addButtonHelperFunction(arg_18_0, arg_18_1)
		arg_18_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
		arg_18_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("MENU/BACK")
		})
	end

	var_12_0:addEventHandler("menu_create", var_12_0.addButtonHelperFunction)

	local var_12_46 = LUI.UIBindButton.new()

	var_12_46.id = "selfBindButton"

	var_12_0:addElement(var_12_46)

	var_12_0.bindButton = var_12_46

	var_0_2(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("CPPublicLobbyPlayMenu", CPPublicLobbyPlayMenu)
LockTable(_M)
