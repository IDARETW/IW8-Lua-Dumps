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
		arg_3_0._clientCharacterMap = Lobby.UpdateClientCharacters(arg_3_1, var_3_0)
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

	arg_3_0:addAndCallEventHandler("update_double_xp_token", function(arg_9_0, arg_9_1)
		var_0_1(arg_9_0)
	end)
	assert(arg_3_0.Vignette)
	assert(arg_3_0.GradientRight)
	ACTIONS.ScaleFullscreen(arg_3_0.Vignette)

	if Engine.CGABICJHAI() then
		LAYOUT.AddAspectRatioFadeFrame(arg_3_0, arg_3_1, nil)
	end

	local function var_3_3()
		local var_10_0 = CoD.GetAspectRatioScaleAdjust(0.3)

		arg_3_0.GradientRight:SetScale(var_10_0)
	end

	arg_3_0:addAndCallEventHandler("onVideoChange", var_3_3)
	OPERATOR.ShowGhostTeaser(arg_3_1, arg_3_0)
	Lobby.PreloadViewHandsForLocalPlayer(arg_3_1)
end

function CPPublicLobbyPlayMenu(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIVerticalNavigator.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_11_0.id = "CPPublicLobbyPlayMenu"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "GradientRight"

	var_11_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_11_4:SetAlpha(0.4, 0)
	var_11_4:setImage(RegisterMaterial("gradient_curve"), 0)
	var_11_4:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * -1056, _1080p * 160, _1080p * -70)
	var_11_0:addElement(var_11_4)

	var_11_0.GradientRight = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "Vignette"

	var_11_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_11_6:SetAlpha(0.5, 0)
	var_11_6:setImage(RegisterMaterial("gradient_curve"), 0)
	var_11_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -1006, _1080p * 160, _1080p * -70)
	var_11_0:addElement(var_11_6)

	var_11_0.Vignette = var_11_6

	local var_11_7
	local var_11_8 = MenuBuilder.BuildRegisteredType("LobbyMap", {
		controllerIndex = var_11_1
	})

	var_11_8.id = "LobbyMap"

	var_11_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 526, _1080p * -336, _1080p * -116)
	var_11_0:addElement(var_11_8)

	var_11_0.LobbyMap = var_11_8

	local var_11_9
	local var_11_10 = MenuBuilder.BuildRegisteredType("CRMMain", {
		controllerIndex = var_11_1
	})

	var_11_10.id = "CRMMain"

	var_11_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1394, _1080p * 1824, _1080p * -341, _1080p * -66)
	var_11_0:addElement(var_11_10)

	var_11_0.CRMMain = var_11_10

	local var_11_11
	local var_11_12 = MenuBuilder.BuildRegisteredType("DoubleXPNotifications", {
		controllerIndex = var_11_1
	})

	var_11_12.id = "DoubleXPNotifications"

	var_11_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1000, _1080p * 1384, _1080p * -222, _1080p * -92)
	var_11_0:addElement(var_11_12)

	var_11_0.DoubleXPNotifications = var_11_12

	local var_11_13

	if Engine.EAIICIFIFA() and CONDITIONS.AreSpecOpsStarsEnabled(var_11_0) then
		local var_11_14 = MenuBuilder.BuildRegisteredType("SOStarRequirementsSmall", {
			controllerIndex = var_11_1
		})

		var_11_14.id = "StarRequirements"

		var_11_14:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 526, _1080p * -245, _1080p * -116)
		var_11_0:addElement(var_11_14)

		var_11_0.StarRequirements = var_11_14
	end

	local var_11_15

	if Engine.EAIICIFIFA() and CONDITIONS.AreSpecOpsRewardsEnabled(var_11_0) then
		local var_11_16 = MenuBuilder.BuildRegisteredType("SOStarRewardNext", {
			controllerIndex = var_11_1
		})

		var_11_16.id = "StarReward"

		var_11_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 536, _1080p * 676, _1080p * -336, _1080p * -116)
		var_11_0:addElement(var_11_16)

		var_11_0.StarReward = var_11_16
	end

	local var_11_17
	local var_11_18 = MenuBuilder.BuildRegisteredType("HappyHourNotificationWidget", {
		controllerIndex = var_11_1
	})

	var_11_18.id = "HappyHourNotificationWidget"

	var_11_18:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1256, _1080p * 1384, _1080p * -354, _1080p * -264)
	var_11_0:addElement(var_11_18)

	var_11_0.HappyHourNotificationWidget = var_11_18

	local var_11_19

	if CONDITIONS.IsCpRaidMode(var_11_0) then
		local var_11_20 = MenuBuilder.BuildRegisteredType("CPCheckpointWidget", {
			controllerIndex = var_11_1
		})

		var_11_20.id = "CPCheckpointWidget"

		var_11_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 676, _1080p * 1076, _1080p * 744, _1080p * 844)
		var_11_0:addElement(var_11_20)

		var_11_0.CPCheckpointWidget = var_11_20
	end

	local var_11_21
	local var_11_22 = MenuBuilder.BuildRegisteredType("CPRelicsStripActiveFrontEnd", {
		controllerIndex = var_11_1
	})

	var_11_22.id = "Relics"

	var_11_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 744, _1080p * 794)
	var_11_0:addElement(var_11_22)

	var_11_0.Relics = var_11_22

	local var_11_23
	local var_11_24 = MenuBuilder.BuildRegisteredType("CPPlaylistDifficulty", {
		controllerIndex = var_11_1
	})

	var_11_24.id = "Difficulty"

	var_11_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 939, _1080p * 967)
	var_11_0:addElement(var_11_24)

	var_11_0.Difficulty = var_11_24

	local var_11_25
	local var_11_26 = MenuBuilder.BuildRegisteredType("ChallengesSummary", {
		controllerIndex = var_11_1
	})

	var_11_26.id = "Challenges"

	var_11_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1394, _1080p * 1824, _1080p * 216, _1080p * 716)
	var_11_0:addElement(var_11_26)

	var_11_0.Challenges = var_11_26

	local var_11_27
	local var_11_28 = MenuBuilder.BuildRegisteredType("BLMBanner", {
		controllerIndex = var_11_1
	})

	var_11_28.id = "BLMBanner"

	var_11_28:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 200, _1080p * 256)
	var_11_0:addElement(var_11_28)

	var_11_0.BLMBanner = var_11_28

	local function var_11_29()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_29

	local var_11_30
	local var_11_31 = {
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

	var_11_12:RegisterAnimationSequence("CRMMinimized", var_11_31)

	local function var_11_32()
		var_11_12:AnimateSequence("CRMMinimized")
	end

	var_11_0._sequences.CRMMinimized = var_11_32

	local var_11_33
	local var_11_34 = {
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

	var_11_12:RegisterAnimationSequence("CRMMaximized", var_11_34)

	local function var_11_35()
		var_11_12:AnimateSequence("CRMMaximized")
	end

	var_11_0._sequences.CRMMaximized = var_11_35

	local var_11_36
	local var_11_37 = {
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

	var_11_12:RegisterAnimationSequence("ShowTokenPrompt", var_11_37)

	local function var_11_38()
		var_11_12:AnimateSequence("ShowTokenPrompt")
	end

	var_11_0._sequences.ShowTokenPrompt = var_11_38

	local var_11_39
	local var_11_40 = {
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

	var_11_12:RegisterAnimationSequence("HideTokenPrompt", var_11_40)

	local function var_11_41()
		var_11_12:AnimateSequence("HideTokenPrompt")
	end

	var_11_0._sequences.HideTokenPrompt = var_11_41

	function var_11_0.addButtonHelperFunction(arg_17_0, arg_17_1)
		arg_17_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
		arg_17_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("MENU/BACK")
		})
	end

	var_11_0:addEventHandler("menu_create", var_11_0.addButtonHelperFunction)

	local var_11_42 = LUI.UIBindButton.new()

	var_11_42.id = "selfBindButton"

	var_11_0:addElement(var_11_42)

	var_11_0.bindButton = var_11_42

	var_0_2(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("CPPublicLobbyPlayMenu", CPPublicLobbyPlayMenu)
LockTable(_M)
