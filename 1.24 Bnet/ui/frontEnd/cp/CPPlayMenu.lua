module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0._challengesVisible == arg_1_1 then
		return
	end

	arg_1_0._challengesVisible = arg_1_1

	if arg_1_2 then
		arg_1_0.Challenges:SetAlpha(0)
	else
		ACTIONS.AnimateSequence(arg_1_0, arg_1_1 and "ShowChallenges" or "HideChallenges")
	end
end

local function var_0_1(arg_2_0)
	if arg_2_0.DoubleXPNotifications then
		local var_2_0 = arg_2_0.DoubleXPNotifications:GetEnablePrompt()

		ACTIONS.AnimateSequence(arg_2_0, var_2_0 and "ShowTokenPrompt" or "HideTokenPrompt")
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.Vignette)
	assert(arg_3_0.Challenges)

	arg_3_0._challengesVisible = true
	arg_3_0.UpdateChallengesVisibility = var_0_0

	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")

	local function var_3_0()
		local var_4_0 = CoD.GetAspectRatioScaleAdjust(0.4)

		arg_3_0.Vignette:SetScale(var_4_0)
		arg_3_0.GradientRight:SetScale(var_4_0)
	end

	arg_3_0:addAndCallEventHandler("onVideoChange", var_3_0)

	arg_3_0._maxLobbyCharactersInPlayMenu = FrontEndScene.MaxClientCharactersMPMainMenu
	arg_3_0.characterDetailsWidgets = Lobby.BuildCharacterDetailWidgets(arg_3_0._maxLobbyCharactersInPlayMenu, arg_3_0, arg_3_1)

	if not arg_3_0.characterTimer then
		arg_3_0.characterTimer = LUI.UITimer.new({
			interval = 2000,
			event = "update_client_characters"
		})
		arg_3_0.characterTimer.id = "lobbyTimer"

		arg_3_0:addElement(arg_3_0.characterTimer)
	end

	local function var_3_1()
		local var_5_0 = {
			maxCharactersToShow = arg_3_0._maxLobbyCharactersInPlayMenu,
			widget = arg_3_0,
			dataSourcePath = Lobby.SquadMembersPath
		}

		arg_3_0._clientCharacterMap = Lobby.UpdateClientCharacters(arg_3_1, var_5_0)

		Lobby.UpdateCharacterDetailsWidgets(arg_3_0._clientCharacterMap, arg_3_0.characterDetailsWidgets, arg_3_1)
	end

	local var_3_2 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")

	arg_3_0:SubscribeToModel(var_3_2:GetModel(arg_3_1), function(arg_6_0)
		local var_6_0 = var_3_2:GetValue(arg_6_0)

		if var_6_0 ~= nil then
			arg_3_0._maxLobbyCharactersInPlayMenu = math.min(var_6_0, 6)

			Lobby.UpdateSquadLobbyScene(var_6_0)
		end
	end)
	arg_3_0:registerEventHandler("update_client_characters", function(arg_7_0, arg_7_1)
		var_3_1()
	end)
	var_3_1()
	arg_3_0:addAndCallEventHandler("update_double_xp_token", function(arg_8_0, arg_8_1)
		var_0_1(arg_8_0)
	end)
	OPERATOR.ShowGhostTeaser(arg_3_1, arg_3_0)
end

function CPPlayMenu(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_9_0.id = "CPPlayMenu"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "Vignette"

	var_9_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_9_4:SetAlpha(0.5, 0)
	var_9_4:setImage(RegisterMaterial("gradient_curve"), 0)
	var_9_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 900, _1080p * 160, _1080p * -70)
	var_9_0:addElement(var_9_4)

	var_9_0.Vignette = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIImage.new()

	var_9_6.id = "GradientRight"

	var_9_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_9_6:SetAlpha(0.5, 0)
	var_9_6:setImage(RegisterMaterial("gradient_curve"), 0)
	var_9_6:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * -900, _1080p * 160, _1080p * -70)
	var_9_0:addElement(var_9_6)

	var_9_0.GradientRight = var_9_6

	local var_9_7
	local var_9_8 = MenuBuilder.BuildRegisteredType("CPMainMenuButtons", {
		controllerIndex = var_9_1
	})

	var_9_8.id = "CPMainMenuButtons"

	var_9_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 216, _1080p * 972)
	var_9_0:addElement(var_9_8)

	var_9_0.CPMainMenuButtons = var_9_8

	local var_9_9
	local var_9_10 = MenuBuilder.BuildRegisteredType("ChallengesSummary", {
		controllerIndex = var_9_1
	})

	var_9_10.id = "Challenges"

	var_9_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1394, _1080p * 1824, _1080p * 216, _1080p * 696)
	var_9_0:addElement(var_9_10)

	var_9_0.Challenges = var_9_10

	local var_9_11
	local var_9_12 = MenuBuilder.BuildRegisteredType("CRMMain", {
		controllerIndex = var_9_1
	})

	var_9_12.id = "CRMMain"

	var_9_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1394, _1080p * 1824, _1080p * -341, _1080p * -66)
	var_9_0:addElement(var_9_12)

	var_9_0.CRMMain = var_9_12

	local var_9_13
	local var_9_14 = MenuBuilder.BuildRegisteredType("DoubleXPNotifications", {
		controllerIndex = var_9_1
	})

	var_9_14.id = "DoubleXPNotifications"

	var_9_14:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1000, _1080p * 1384, _1080p * -223, _1080p * -93)
	var_9_0:addElement(var_9_14)

	var_9_0.DoubleXPNotifications = var_9_14

	local var_9_15
	local var_9_16 = MenuBuilder.BuildRegisteredType("HappyHourNotificationWidget", {
		controllerIndex = var_9_1
	})

	var_9_16.id = "HappyHourNotificationWidget"

	var_9_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1256, _1080p * 1384, _1080p * -354, _1080p * -264)
	var_9_0:addElement(var_9_16)

	var_9_0.HappyHourNotificationWidget = var_9_16

	local var_9_17
	local var_9_18 = MenuBuilder.BuildRegisteredType("BLMBanner", {
		controllerIndex = var_9_1
	})

	var_9_18.id = "BLMBanner"

	var_9_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 200, _1080p * 256)
	var_9_0:addElement(var_9_18)

	var_9_0.BLMBanner = var_9_18

	local function var_9_19()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_19

	local var_9_20
	local var_9_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
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

	var_9_10:RegisterAnimationSequence("HideChallenges", var_9_21)

	local function var_9_22()
		var_9_10:AnimateSequence("HideChallenges")
	end

	var_9_0._sequences.HideChallenges = var_9_22

	local var_9_23
	local var_9_24 = {
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
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1396,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1824,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_9_10:RegisterAnimationSequence("ShowChallenges", var_9_24)

	local function var_9_25()
		var_9_10:AnimateSequence("ShowChallenges")
	end

	var_9_0._sequences.ShowChallenges = var_9_25

	local var_9_26
	local var_9_27 = {
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

	var_9_14:RegisterAnimationSequence("ShowTokenPrompt", var_9_27)

	local function var_9_28()
		var_9_14:AnimateSequence("ShowTokenPrompt")
	end

	var_9_0._sequences.ShowTokenPrompt = var_9_28

	local var_9_29
	local var_9_30 = {
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

	var_9_14:RegisterAnimationSequence("HideTokenPrompt", var_9_30)

	local function var_9_31()
		var_9_14:AnimateSequence("HideTokenPrompt")
	end

	var_9_0._sequences.HideTokenPrompt = var_9_31

	var_0_2(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("CPPlayMenu", CPPlayMenu)
LockTable(_M)
