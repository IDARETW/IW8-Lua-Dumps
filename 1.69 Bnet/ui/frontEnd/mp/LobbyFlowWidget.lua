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

		if arg_3_0.EventPromoBanner then
			arg_3_0.EventPromoBanner:SetAlpha(0)
		end
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
	local var_5_0 = DataSources.frontEnd.lobby.memberMaxCount:GetValue(arg_5_1)
	local var_5_1 = Dvar.CFHDGABACF("MTTRPNMPRP")

	if CONDITIONS.IsMagmaGameMode() or var_5_1 < var_5_0 then
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

	local var_8_0 = MenuBuilder.BuildRegisteredType(arg_8_1, {
		controllerIndex = arg_8_2
	})

	arg_8_0.matchMakingLobby = var_8_0

	var_8_0:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 1920, _1080p * -540, _1080p * 540)
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

		local var_9_3 = arg_9_0.CDLRestrictionTag and arg_9_0.CDLRestrictionTag:UpdateVisibility(arg_9_1)

		if arg_9_0.EventPromoBanner and not var_9_3 then
			arg_9_0.EventPromoBanner:Setup()
		end
	elseif var_9_2 then
		arg_9_0._state = var_0_0.waitingForMatchmaking

		arg_9_0:ReplaceLobbyWidget("MatchmakingLobby", arg_9_1)
		arg_9_0.Nat:SetAlpha(0)
		arg_9_0.JoinableStatus:SetAlpha(0)

		if arg_9_0.EventPromoBanner then
			arg_9_0.EventPromoBanner:SetAlpha(0)
		end
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

	if arg_10_0.CRMMain then
		if arg_10_0:InMatchMadeState() or arg_10_0.CRMMain:ShouldHideCRM() then
			arg_10_0.CRMMain:HideCRM()
		else
			arg_10_0.CRMMain:SetMinimized(false)
		end
	end

	if arg_10_0.CRMWeb then
		if arg_10_0:InMatchMadeState() then
			arg_10_0.CRMWeb:SwitchVisibility(false)
			LUI.WebViewManager.Instance():MakeSureFullScreenClosed()
		else
			arg_10_0.CRMWeb:SwitchVisibility(true)
		end
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

	if PROGRESSION.GetPlayerIsInSeasonalProgression(arg_12_1) and not Onboarding.OfficerProgression.WasCompleted(arg_12_0, arg_12_1) then
		LUI.FlowManager.RequestPopupMenu(arg_12_0, "onboardingpopup", true, arg_12_1, false, ONBOARDING_DATA.GetOnboardingCH2MWWZCareerSeaonLevelingData())
		Onboarding.OfficerProgression.MarkCompleted(arg_12_0, arg_12_1)
	end

	LAYOUT.SetupScalingBackgroundVignette(arg_12_0, {
		customVignette = arg_12_0.WZVignette
	})
	arg_12_0:addAndCallEventHandler("update_double_xp_token", function(arg_14_0, arg_14_1)
		var_0_11(arg_14_0)
	end)

	if not CONDITIONS.IsBRGameType(arg_12_0) then
		local function var_12_3(arg_15_0)
			local var_15_0 = arg_12_0.CDLRestrictionTag and arg_12_0.CDLRestrictionTag:UpdateVisibility(arg_15_0)

			if arg_12_0.EventPromoBanner and not var_15_0 then
				arg_12_0.EventPromoBanner:Setup()
			end
		end

		var_12_3(arg_12_1)

		local var_12_4 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areMLGRulesEnabled")

		arg_12_0:SubscribeToModel(var_12_4:GetModel(arg_12_1), function()
			if not MLG.IsHost() and not Lobby.BBDICGHE() then
				if Lobby.DFHGBJJAGC() then
					MatchRules.DJEIAJCAD()
				else
					MLG.ResetMatchRulesData()
				end

				arg_12_0:dispatchEventToChildren({
					name = "matchrules_updated",
					controllerIndex = arg_12_1
				})
				var_12_3(arg_12_1)
			end
		end)
	elseif arg_12_0.EventPromoBanner then
		arg_12_0.EventPromoBanner:SetAlpha(0)
	end

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_12_0, "WZSetup")
	end
end

function LobbyFlowWidget(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIElement.new()

	var_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_17_0.id = "LobbyFlowWidget"
	var_17_0._animationSets = var_17_0._animationSets or {}
	var_17_0._sequences = var_17_0._sequences or {}

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_17_1
	})

	var_17_4.id = "WZVignette"

	var_17_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_17_0:addElement(var_17_4)

	var_17_0.WZVignette = var_17_4

	local var_17_5

	if not CONDITIONS.IsWebMotdEnabled() then
		var_17_5 = MenuBuilder.BuildRegisteredType("CRMMain", {
			controllerIndex = var_17_1
		})
		var_17_5.id = "CRMMain"

		var_17_5:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -526, _1080p * -96, _1080p * 239, _1080p * 514)
		var_17_0:addElement(var_17_5)

		var_17_0.CRMMain = var_17_5
	end

	local var_17_6

	if CONDITIONS.IsWebMotdEnabled() then
		var_17_6 = MenuBuilder.BuildRegisteredType("CRMWeb", {
			controllerIndex = var_17_1
		})
		var_17_6.id = "CRMWeb"

		var_17_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -526, _1080p * -96, _1080p * 239, _1080p * 489)
		var_17_0:addElement(var_17_6)

		var_17_0.CRMWeb = var_17_6
	end

	local var_17_7
	local var_17_8 = LUI.UIText.new()

	var_17_8.id = "Nat"

	var_17_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_17_8:setText("", 0)
	var_17_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_8:SetAlignment(LUI.Alignment.Right)
	var_17_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_17_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 818, _1080p * 1318, _1080p * -36, _1080p * -14)
	var_17_0:addElement(var_17_8)

	var_17_0.Nat = var_17_8

	local var_17_9
	local var_17_10 = LUI.UIText.new()

	var_17_10.id = "JoinableStatus"

	var_17_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_17_10:setText("", 0)
	var_17_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_10:SetAlignment(LUI.Alignment.Right)
	var_17_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_17_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 818, _1080p * 1318, _1080p * -56, _1080p * -34)
	var_17_0:addElement(var_17_10)

	var_17_0.JoinableStatus = var_17_10

	local var_17_11

	if not CONDITIONS.IsBRGameType() then
		local var_17_12 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
			controllerIndex = var_17_1
		})

		var_17_12.id = "CDLRestrictionTag"

		var_17_12:SetAlpha(0, 0)
		var_17_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 446, _1080p * 173, _1080p * 203)
		var_17_0:addElement(var_17_12)

		var_17_0.CDLRestrictionTag = var_17_12
	end

	local var_17_13

	if CONDITIONS.IsEventPromoActive() then
		local var_17_14 = MenuBuilder.BuildRegisteredType("EventPromoBanner", {
			controllerIndex = var_17_1
		})

		var_17_14.id = "EventPromoBanner"

		var_17_14:SetAlpha(0, 0)
		var_17_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 173, _1080p * 203)
		var_17_0:addElement(var_17_14)

		var_17_0.EventPromoBanner = var_17_14
	end

	local var_17_15

	if CONDITIONS.IsRegularSeasonAndMagma() then
		var_17_15 = MenuBuilder.BuildRegisteredType("WideDoubleXPNotifications", {
			controllerIndex = var_17_1
		})
		var_17_15.id = "WZDoubleXPNotifications"

		var_17_15:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -526, _1080p * -96, _1080p * 28, _1080p * 208)
		var_17_0:addElement(var_17_15)

		var_17_0.WZDoubleXPNotifications = var_17_15
	end

	local var_17_16
	local var_17_17 = MenuBuilder.BuildRegisteredType("HappyHourNotificationWidget", {
		controllerIndex = var_17_1
	})

	var_17_17.id = "HappyHourNotificationWidget"

	var_17_17:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -666, _1080p * -538, _1080p * 129, _1080p * 221)
	var_17_0:addElement(var_17_17)

	var_17_0.HappyHourNotificationWidget = var_17_17

	local var_17_18

	if not CONDITIONS.IsMagmaGameMode() then
		local var_17_19 = MenuBuilder.BuildRegisteredType("DoubleXPNotifications", {
			controllerIndex = var_17_1
		})

		var_17_19.id = "DoubleXPNotifications"

		var_17_19:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 998, _1080p * 1382, _1080p * -215, _1080p * -85)
		var_17_0:addElement(var_17_19)

		var_17_0.DoubleXPNotifications = var_17_19
	end

	local function var_17_20()
		return
	end

	var_17_0._sequences.DefaultSequence = var_17_20

	local var_17_21

	if not CONDITIONS.IsWebMotdEnabled() then
		local var_17_22 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 238
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 513
			}
		}

		var_17_5:RegisterAnimationSequence("WZSetup", var_17_22)
	end

	if CONDITIONS.IsWebMotdEnabled() then
		local var_17_23 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 238
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 488
			}
		}

		var_17_6:RegisterAnimationSequence("WZSetup", var_17_23)
	end

	local var_17_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_17_8:RegisterAnimationSequence("WZSetup", var_17_24)

	local var_17_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_17_10:RegisterAnimationSequence("WZSetup", var_17_25)

	if CONDITIONS.IsRegularSeasonAndMagma() then
		local var_17_26 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 40
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 220
			}
		}

		var_17_15:RegisterAnimationSequence("WZSetup", var_17_26)
	end

	local function var_17_27()
		if not CONDITIONS.IsWebMotdEnabled() then
			var_17_5:AnimateSequence("WZSetup")
		end

		if CONDITIONS.IsWebMotdEnabled() then
			var_17_6:AnimateSequence("WZSetup")
		end

		var_17_8:AnimateSequence("WZSetup")
		var_17_10:AnimateSequence("WZSetup")

		if CONDITIONS.IsRegularSeasonAndMagma() then
			var_17_15:AnimateSequence("WZSetup")
		end
	end

	var_17_0._sequences.WZSetup = var_17_27

	var_0_12(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("LobbyFlowWidget", LobbyFlowWidget)
LockTable(_M)
