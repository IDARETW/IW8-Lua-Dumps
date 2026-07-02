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

		Lobby.UpdateClientCharactersDelayed(arg_3_0, arg_3_1, var_5_0, function(arg_6_0)
			arg_3_0._clientCharacterMap = arg_6_0

			Lobby.UpdateCharacterDetailsWidgets(arg_3_0._clientCharacterMap, arg_3_0.characterDetailsWidgets, arg_3_1)
		end)
	end

	local var_3_2 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")

	arg_3_0:SubscribeToModel(var_3_2:GetModel(arg_3_1), function(arg_7_0)
		local var_7_0 = var_3_2:GetValue(arg_7_0)

		if var_7_0 ~= nil then
			arg_3_0._maxLobbyCharactersInPlayMenu = math.min(var_7_0, 6)

			Lobby.UpdateSquadLobbyScene(var_7_0)
		end
	end)
	arg_3_0:registerEventHandler("update_client_characters", function(arg_8_0, arg_8_1)
		var_3_1()
	end)
	var_3_1()
	arg_3_0:addAndCallEventHandler("update_double_xp_token", function(arg_9_0, arg_9_1)
		var_0_1(arg_9_0)
	end)
	OPERATOR.ShowGhostTeaser(arg_3_1, arg_3_0)

	if arg_3_0.EventPromoBanner then
		arg_3_0.EventPromoBanner:Setup()
	end
end

function CPPlayMenu(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_10_0.id = "CPPlayMenu"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "Vignette"

	var_10_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_10_4:SetAlpha(0.5, 0)
	var_10_4:setImage(RegisterMaterial("gradient_curve"), 0)
	var_10_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 900, _1080p * 160, _1080p * -70)
	var_10_0:addElement(var_10_4)

	var_10_0.Vignette = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIImage.new()

	var_10_6.id = "GradientRight"

	var_10_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_10_6:SetAlpha(0.5, 0)
	var_10_6:setImage(RegisterMaterial("gradient_curve"), 0)
	var_10_6:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * -900, _1080p * 160, _1080p * -70)
	var_10_0:addElement(var_10_6)

	var_10_0.GradientRight = var_10_6

	local var_10_7
	local var_10_8 = MenuBuilder.BuildRegisteredType("CPMainMenuButtons", {
		controllerIndex = var_10_1
	})

	var_10_8.id = "CPMainMenuButtons"

	var_10_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 216, _1080p * 972)
	var_10_0:addElement(var_10_8)

	var_10_0.CPMainMenuButtons = var_10_8

	local var_10_9
	local var_10_10 = MenuBuilder.BuildRegisteredType("ChallengesSummary", {
		controllerIndex = var_10_1
	})

	var_10_10.id = "Challenges"

	var_10_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1394, _1080p * 1824, _1080p * 216, _1080p * 696)
	var_10_0:addElement(var_10_10)

	var_10_0.Challenges = var_10_10

	local var_10_11

	if not CONDITIONS.IsWebMotdEnabled() then
		local var_10_12 = MenuBuilder.BuildRegisteredType("CRMMain", {
			controllerIndex = var_10_1
		})

		var_10_12.id = "CRMMain"

		var_10_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1394, _1080p * 1824, _1080p * -341, _1080p * -66)
		var_10_0:addElement(var_10_12)

		var_10_0.CRMMain = var_10_12
	end

	local var_10_13

	if CONDITIONS.IsWebMotdEnabled() then
		local var_10_14 = MenuBuilder.BuildRegisteredType("CRMWeb", {
			controllerIndex = var_10_1
		})

		var_10_14.id = "CRMWeb"

		var_10_14:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1394, _1080p * 1802, _1080p * -342, _1080p * -92)
		var_10_0:addElement(var_10_14)

		var_10_0.CRMWeb = var_10_14
	end

	local var_10_15
	local var_10_16 = MenuBuilder.BuildRegisteredType("DoubleXPNotifications", {
		controllerIndex = var_10_1
	})

	var_10_16.id = "DoubleXPNotifications"

	var_10_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1000, _1080p * 1384, _1080p * -223, _1080p * -93)
	var_10_0:addElement(var_10_16)

	var_10_0.DoubleXPNotifications = var_10_16

	local var_10_17
	local var_10_18 = MenuBuilder.BuildRegisteredType("HappyHourNotificationWidget", {
		controllerIndex = var_10_1
	})

	var_10_18.id = "HappyHourNotificationWidget"

	var_10_18:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1256, _1080p * 1384, _1080p * -365, _1080p * -275)
	var_10_0:addElement(var_10_18)

	var_10_0.HappyHourNotificationWidget = var_10_18

	local var_10_19
	local var_10_20 = MenuBuilder.BuildRegisteredType("BLMBanner", {
		controllerIndex = var_10_1
	})

	var_10_20.id = "BLMBanner"

	var_10_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 200, _1080p * 256)
	var_10_0:addElement(var_10_20)

	var_10_0.BLMBanner = var_10_20

	local var_10_21

	if CONDITIONS.IsEventPromoActive() then
		local var_10_22 = MenuBuilder.BuildRegisteredType("EventPromoBanner", {
			controllerIndex = var_10_1
		})

		var_10_22.id = "EventPromoBanner"

		var_10_22:SetAlpha(0, 0)
		var_10_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 173, _1080p * 203)
		var_10_0:addElement(var_10_22)

		var_10_0.EventPromoBanner = var_10_22
	end

	local function var_10_23()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_23

	local var_10_24
	local var_10_25 = {
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

	var_10_10:RegisterAnimationSequence("HideChallenges", var_10_25)

	local function var_10_26()
		var_10_10:AnimateSequence("HideChallenges")
	end

	var_10_0._sequences.HideChallenges = var_10_26

	local var_10_27
	local var_10_28 = {
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

	var_10_10:RegisterAnimationSequence("ShowChallenges", var_10_28)

	local function var_10_29()
		var_10_10:AnimateSequence("ShowChallenges")
	end

	var_10_0._sequences.ShowChallenges = var_10_29

	local var_10_30
	local var_10_31 = {
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

	var_10_16:RegisterAnimationSequence("ShowTokenPrompt", var_10_31)

	local function var_10_32()
		var_10_16:AnimateSequence("ShowTokenPrompt")
	end

	var_10_0._sequences.ShowTokenPrompt = var_10_32

	local var_10_33
	local var_10_34 = {
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

	var_10_16:RegisterAnimationSequence("HideTokenPrompt", var_10_34)

	local function var_10_35()
		var_10_16:AnimateSequence("HideTokenPrompt")
	end

	var_10_0._sequences.HideTokenPrompt = var_10_35

	var_0_2(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("CPPlayMenu", CPPlayMenu)
LockTable(_M)
