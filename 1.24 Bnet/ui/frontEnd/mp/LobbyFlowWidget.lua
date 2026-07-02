module(..., package.seeall)

local var_0_0 = {
	matchMadeLPC = 5,
	searchingForLobby = 1,
	waitingForMatchmaking = 2,
	matchMadeIndividual = 4,
	matchMadeTeam = 3
}

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = Lobby.BCBBBABFFB()

	if var_1_0 == CoD.PartyPrivacySetting.CLOSED then
		arg_1_0.JoinableStatus:setText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_PRIVACY_CLOSED"))
	elseif var_1_0 == CoD.PartyPrivacySetting.JOINABLE_BY_FRIENDS then
		arg_1_0.JoinableStatus:setText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_PRIVACY_JOINABLE_BY_FRIENDS"))
	elseif var_1_0 == CoD.PartyPrivacySetting.INVITE_ONLY then
		arg_1_0.JoinableStatus:setText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_PRIVACY_INVITE_ONLY"))
	else
		arg_1_0.JoinableStatus:setText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_PRIVACY_PUBLIC"))
	end
end

local function var_0_2(arg_2_0)
	return arg_2_0._state == var_0_0.matchMadeLPC or arg_2_0._state == var_0_0.matchMadeIndividual or arg_2_0._state == var_0_0.matchMadeTeam
end

local function var_0_3(arg_3_0, arg_3_1)
	assert(arg_3_0._state)

	local var_3_0

	if not DataSources.frontEnd.lobby.memberMaxCount:GetValue(arg_3_1) then
		local var_3_1 = 0
	end

	if arg_3_0._state == var_0_0.matchMadeLPC then
		var_3_0 = "LobbyLPCMatchmade"
	elseif arg_3_0._state == var_0_0.matchMadeIndividual then
		var_3_0 = "LobbyIndividualMatchmade"
	elseif arg_3_0._state == var_0_0.matchMadeTeam then
		var_3_0 = "LobbySmallTeamMatchmade"
	end

	assert(var_3_0)

	return MenuBuilder.BuildRegisteredType(var_3_0, {
		controllerIndex = arg_3_1
	})
end

local function var_0_4(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0:GetMatchMadeWidgetToBuild(arg_4_1)

	assert(var_4_0)
	arg_4_0:addElement(var_4_0)

	arg_4_0.matchMadeLobby = var_4_0

	Lobby.PreloadViewHandsForLocalPlayer(arg_4_1)
	Engine.DHFCHIIJCA("squad_lobby")
end

local function var_0_5(arg_5_0, arg_5_1)
	if DataSources.frontEnd.lobby.memberMaxCount:GetValue(arg_5_1) > Dvar.CFHDGABACF("MTTRPNMPRP") then
		arg_5_0._state = var_0_0.matchMadeLPC
	elseif Lobby.IsCurrentGameTypeteamBased() then
		arg_5_0._state = var_0_0.matchMadeTeam
	else
		arg_5_0._state = var_0_0.matchMadeIndividual
	end
end

local function var_0_6(arg_6_0)
	local var_6_0 = arg_6_0:GetCurrentMenu()

	if var_6_0 and var_6_0.SetDedi then
		var_6_0:SetDedi(arg_6_0)
	end
end

local function var_0_7(arg_7_0)
	arg_7_0:dispatchEventToRoot({
		name = "searching_for_lobby",
		isSearching = arg_7_0._state == var_0_0.searchingForLobby
	})
end

local function var_0_8(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_0.matchMakingLobby and arg_8_0.matchMakingLobby:getParent() == arg_8_0 then
		arg_8_0:RemoveElement(arg_8_0.matchMakingLobby)
	end

	arg_8_0.matchMakingLobby = MenuBuilder.BuildRegisteredType(arg_8_1, {
		controllerIndex = arg_8_2
	})

	arg_8_0:addElement(arg_8_0.matchMakingLobby)
	arg_8_0.matchMakingLobby:processEvent({
		dispatchChildren = true,
		name = "tab_create"
	})
	arg_8_0:UpdateParentLobbyStatus()
end

local function var_0_9(arg_9_0, arg_9_1)
	local var_9_0 = Lobby.EBDDFIIHID()
	local var_9_1 = not var_9_0 and arg_9_0._state ~= var_0_0.searchingForLobby
	local var_9_2 = var_9_0 and arg_9_0._state == var_0_0.searchingForLobby

	var_0_6(arg_9_0)

	if var_9_1 then
		arg_9_0._state = var_0_0.searchingForLobby

		arg_9_0:ReplaceLobbyWidget("SearchingForLobby", arg_9_1)
		arg_9_0.Nat:SetAlpha(1)
		arg_9_0.JoinableStatus:SetAlpha(1)
	elseif var_9_2 then
		arg_9_0._state = var_0_0.waitingForMatchmaking

		arg_9_0:ReplaceLobbyWidget("MatchmakingLobby", arg_9_1)
		arg_9_0.Nat:SetAlpha(0)
		arg_9_0.JoinableStatus:SetAlpha(0)
	end
end

local function var_0_10(arg_10_0, arg_10_1)
	if not arg_10_0:InMatchMadeState() then
		arg_10_0:UpdateLobbyBasedOnMatchmakerState(arg_10_1)
	end

	local var_10_0, var_10_1 = Lobby.BGIBDIBHH()

	if var_10_0 and var_10_1 and var_10_0 == Lobby.PartyState.STARTING then
		local var_10_2 = math.ceil(var_10_1.timeRemaining / 1000)

		if arg_10_0._state == var_0_0.waitingForMatchmaking and arg_10_0.matchMakingLobby and arg_10_0.matchMakingLobby:getParent() == arg_10_0 then
			arg_10_0:RemoveElement(arg_10_0.matchMakingLobby)
			arg_10_0:UpdateLobbyState(arg_10_1)
			arg_10_0:AddMatchMadeWidget(arg_10_1)
			var_0_6(arg_10_0)
		end
	end

	assert(arg_10_0.CRMMain)

	if arg_10_0:InMatchMadeState() or arg_10_0.CRMMain:ShouldHideCRM() then
		arg_10_0.CRMMain:HideCRM()
	else
		arg_10_0.CRMMain:SetMinimized(false)
	end
end

local function var_0_11(arg_11_0)
	if arg_11_0.DoubleXPNotifications then
		local var_11_0 = arg_11_0.DoubleXPNotifications:GetEnablePrompt()

		ACTIONS.AnimateSequence(arg_11_0, var_11_0 and "ShowTokenPrompt" or "HideTokenPrompt")
	end
end

local function var_0_12(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.UpdateLobbyStatus = var_0_10
	arg_12_0.AddMatchMadeWidget = var_0_4
	arg_12_0.UpdateLobbyState = var_0_5
	arg_12_0.GetMatchMadeWidgetToBuild = var_0_3
	arg_12_0.CreatePlayerGrid = CreatePlayerGrid
	arg_12_0.ReplaceLobbyWidget = var_0_8
	arg_12_0.InMatchMadeState = var_0_2
	arg_12_0.UpdateLobbyBasedOnMatchmakerState = var_0_9
	arg_12_0.UpdateDoubleXPToken = var_0_11
	arg_12_0.UpdateParentLobbyStatus = var_0_7
	arg_12_0._state = var_0_0.searchingForLobby

	arg_12_0:ReplaceLobbyWidget("SearchingForLobby", arg_12_1)

	arg_12_0._numDots = 0

	local var_12_0 = Lobby.DGDAAFJDBI()

	if var_12_0 then
		if var_12_0 == "NETWORK_STRICT" and Dvar.IBEGCHEFE("MMONQLOPSO") == false then
			LUI.FlowManager.RequestPopupMenu(arg_12_0, "strict_nat_warning", true, arg_12_1, false)
			Dvar.DHEGHJJJHI("MMONQLOPSO", true)
		end

		local var_12_1 = Engine.CBBHFCGDIC("LUA_MENU/YOURNATTYPE", var_12_0)

		assert(arg_12_0.Nat)
		arg_12_0.Nat:setText(var_12_1)
	end

	var_0_1(arg_12_0, arg_12_2)
	Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.matchSearch)

	local var_12_2 = LUI.UITimer.new({
		interval = 400,
		event = "update_lobby_status"
	})

	var_12_2.id = "lobbyStatusTimer"

	arg_12_0:addElement(var_12_2)
	arg_12_0:registerEventHandler("update_lobby_status", function(arg_13_0, arg_13_1)
		arg_13_0:UpdateLobbyStatus(arg_12_1)
	end)
	arg_12_0:UpdateLobbyStatus(arg_12_1)

	if PROGRESSION.IsElder(arg_12_1) and not Onboarding.OfficerProgression.WasCompleted(arg_12_0, arg_12_1) then
		LUI.FlowManager.RequestPopupMenu(arg_12_0, "onboardingpopup", true, arg_12_1, false, ONBOARDING_DATA.GetOnboardingElderProgressionData())
		Onboarding.OfficerProgression.MarkCompleted(arg_12_0, arg_12_1)
	end

	local function var_12_3()
		local var_14_0 = CoD.GetAspectRatioScaleAdjust(0.5)

		arg_12_0.Vignette:SetScale(var_14_0)
		arg_12_0.GradientRight:SetScale(var_14_0)
	end

	arg_12_0:addAndCallEventHandler("onVideoChange", var_12_3)
	arg_12_0:addAndCallEventHandler("update_double_xp_token", function(arg_15_0, arg_15_1)
		var_0_11(arg_15_0)
	end)
end

function LobbyFlowWidget(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIElement.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_16_0.id = "LobbyFlowWidget"
	var_16_0._animationSets = var_16_0._animationSets or {}
	var_16_0._sequences = var_16_0._sequences or {}

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)

	local var_16_2 = var_16_0
	local var_16_3
	local var_16_4 = LUI.UIImage.new()

	var_16_4.id = "Vignette"

	var_16_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_16_4:SetAlpha(0.5, 0)
	var_16_4:setImage(RegisterMaterial("gradient_curve"), 0)
	var_16_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 900, _1080p * 160, _1080p * -70)
	var_16_0:addElement(var_16_4)

	var_16_0.Vignette = var_16_4

	local var_16_5
	local var_16_6 = LUI.UIImage.new()

	var_16_6.id = "GradientRight"

	var_16_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_16_6:SetAlpha(0.5, 0)
	var_16_6:setImage(RegisterMaterial("gradient_curve"), 0)
	var_16_6:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * -900, _1080p * 160, _1080p * -70)
	var_16_0:addElement(var_16_6)

	var_16_0.GradientRight = var_16_6

	local var_16_7
	local var_16_8 = MenuBuilder.BuildRegisteredType("CRMMain", {
		controllerIndex = var_16_1
	})

	var_16_8.id = "CRMMain"

	var_16_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1394, _1080p * 1824, _1080p * -341, _1080p * -66)
	var_16_0:addElement(var_16_8)

	var_16_0.CRMMain = var_16_8

	local var_16_9
	local var_16_10 = MenuBuilder.BuildRegisteredType("DoubleXPNotifications", {
		controllerIndex = var_16_1
	})

	var_16_10.id = "DoubleXPNotifications"

	var_16_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1000, _1080p * 1384, _1080p * -223, _1080p * -93)
	var_16_0:addElement(var_16_10)

	var_16_0.DoubleXPNotifications = var_16_10

	local var_16_11
	local var_16_12 = LUI.UIText.new()

	var_16_12.id = "Nat"

	var_16_12:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_16_12:setText("", 0)
	var_16_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_12:SetAlignment(LUI.Alignment.Right)
	var_16_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_16_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 818, _1080p * 1318, _1080p * -36, _1080p * -14)
	var_16_0:addElement(var_16_12)

	var_16_0.Nat = var_16_12

	local var_16_13
	local var_16_14 = LUI.UIText.new()

	var_16_14.id = "JoinableStatus"

	var_16_14:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_16_14:setText("", 0)
	var_16_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_14:SetAlignment(LUI.Alignment.Right)
	var_16_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_16_14:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 818, _1080p * 1318, _1080p * -56, _1080p * -34)
	var_16_0:addElement(var_16_14)

	var_16_0.JoinableStatus = var_16_14

	local var_16_15
	local var_16_16 = MenuBuilder.BuildRegisteredType("HappyHourNotificationWidget", {
		controllerIndex = var_16_1
	})

	var_16_16.id = "HappyHourNotificationWidget"

	var_16_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1256, _1080p * 1384, _1080p * -354, _1080p * -264)
	var_16_0:addElement(var_16_16)

	var_16_0.HappyHourNotificationWidget = var_16_16

	local var_16_17
	local var_16_18 = MenuBuilder.BuildRegisteredType("BLMBanner", {
		controllerIndex = var_16_1
	})

	var_16_18.id = "BLMBanner"

	var_16_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 200, _1080p * 256)
	var_16_0:addElement(var_16_18)

	var_16_0.BLMBanner = var_16_18

	local function var_16_19()
		return
	end

	var_16_0._sequences.DefaultSequence = var_16_19

	local var_16_20
	local var_16_21 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 598
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 718
		}
	}

	var_16_10:RegisterAnimationSequence("CRMMaximized", var_16_21)

	local function var_16_22()
		var_16_10:AnimateSequence("CRMMaximized")
	end

	var_16_0._sequences.CRMMaximized = var_16_22

	local var_16_23
	local var_16_24 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 825
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 945
		}
	}

	var_16_10:RegisterAnimationSequence("CRMMinimized", var_16_24)

	local function var_16_25()
		var_16_10:AnimateSequence("CRMMinimized")
	end

	var_16_0._sequences.CRMMinimized = var_16_25

	local var_16_26
	local var_16_27 = {
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

	var_16_10:RegisterAnimationSequence("ShowTokenPrompt", var_16_27)

	local function var_16_28()
		var_16_10:AnimateSequence("ShowTokenPrompt")
	end

	var_16_0._sequences.ShowTokenPrompt = var_16_28

	local var_16_29
	local var_16_30 = {
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

	var_16_10:RegisterAnimationSequence("HideTokenPrompt", var_16_30)

	local function var_16_31()
		var_16_10:AnimateSequence("HideTokenPrompt")
	end

	var_16_0._sequences.HideTokenPrompt = var_16_31

	var_0_12(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("LobbyFlowWidget", LobbyFlowWidget)
LockTable(_M)
