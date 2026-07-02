module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = OPERATOR.GetSelectedOperatorIndex(arg_1_1)
	local var_1_1 = OPERATOR.GetEquippedOperatorName(arg_1_1, var_1_0)

	if var_1_0 == OPERATOR.SuperFaction.WEST then
		arg_1_0.OperatorNameTag.Faction:setText(Engine.CBBHFCGDIC("LUA_MENU/THE_WEST"))
	else
		arg_1_0.OperatorNameTag.Faction:setText(Engine.CBBHFCGDIC("LUA_MENU/THE_EAST"))
	end

	arg_1_0.OperatorNameTag.Name:setText(var_1_1)

	local var_1_2, var_1_3 = OPERATOR.GetEquippedOperatorSkin(arg_1_1, var_1_0)
	local var_1_4 = {
		operatorPose = "chr_menu_male_idle_01_AR",
		element = arg_1_0
	}

	OPERATOR.UpdateClientCharacter(FrontEndScene.ClientCharacters.ArenaRight2, var_1_2, var_1_3, var_1_4)
end

local function var_0_1(arg_2_0)
	ACTIONS.AnimateSequence(arg_2_0, "Countdown")
	arg_2_0.TournamentCountdownTime:setEndTime(Tournament.ECBAACCCDH())
end

local function var_0_2(arg_3_0)
	ACTIONS.AnimateSequence(arg_3_0, "Matchmaking")
end

local function var_0_3(arg_4_0, arg_4_1)
	local function var_4_0(arg_5_0, arg_5_1)
		if TOURNAMENT.CanCancelRegistration(arg_5_1.controller) then
			LUI.FlowManager.RequestPopupMenu(nil, "CancelTournamentSignUp", true, arg_5_1.controller, false, {
				menu = arg_4_0
			})
		end
	end

	arg_4_0.WithdrawButton:registerEventHandler("button_action", var_4_0)
	arg_4_0.WithdrawButton:SetButtonDisabled(not TOURNAMENT.CanCancelRegistration(arg_4_1))

	local function var_4_1()
		local var_6_0 = Lobby.GFFECBCCF()
		local var_6_1 = Lobby.BGIADHIHAG()
		local var_6_2 = var_6_0 and not var_6_1

		var_6_2 = var_6_2 or not TOURNAMENT.CanCancelRegistration(arg_4_1)

		arg_4_0.WithdrawButton:SetButtonDisabled(var_6_2)
	end

	local var_4_2 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_4_3 = DataSources.frontEnd.lobby.memberCount

	arg_4_0:SubscribeToModel(var_4_2:GetModel(arg_4_1), var_4_1)
	arg_4_0:SubscribeToModel(var_4_3:GetModel(arg_4_1), var_4_1)
end

local function var_0_4(arg_7_0, arg_7_1, arg_7_2)
	assert(arg_7_0.WaitingText)

	local var_7_0 = Tournament.BJDIDJCEAA()

	arg_7_0.WaitingText:setText(ToUpperCase(Engine.CBBHFCGDIC("TOURNAMENT/GUNFIGHT_TOURNAMENT", var_7_0, var_7_0)), 0)
	LUI.ToastManager.GetInstance():CloseToastOfType(LUI.ToastManager.NotificationType.Tournament)
	Streaming.BDDBGGIC(true)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	arg_7_0:addElement(CoD.GetWorldBlur())

	if Tournament.BAEACBHFGF() then
		var_0_2(arg_7_0)
	else
		var_0_1(arg_7_0)
	end

	var_0_3(arg_7_0, arg_7_1)
end

function TournamentLoading(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_8_0.id = "TournamentLoading"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "GunFightIcon"

	var_8_4:SetScale(0.25, 0)
	var_8_4:setImage(RegisterMaterial("icon_mp_mode_arena"), 0)
	var_8_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -128, _1080p * 128, _1080p * 330, _1080p * 586)
	var_8_0:addElement(var_8_4)

	var_8_0.GunFightIcon = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("Spinner", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "Spinner"

	var_8_6:setImage(RegisterMaterial("spinner_loading"), 0)
	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -170, _1080p * 170, _1080p * 320, _1080p * 330)
	var_8_0:addElement(var_8_6)

	var_8_0.Spinner = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIStyledText.new()

	var_8_8.id = "TournamentStartTime"

	var_8_8:SetRGBFromTable(SWATCHES.Lobby.Header2, 0)
	var_8_8:setText(Engine.CBBHFCGDIC("TOURNAMENT/MATCHMAKING_STARTS_IN"), 0)
	var_8_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_8:SetWordWrap(false)
	var_8_8:SetAlignment(LUI.Alignment.Center)
	var_8_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 100, _1080p * -100, _1080p * 245, _1080p * 275)
	var_8_0:addElement(var_8_8)

	var_8_0.TournamentStartTime = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIText.new()

	var_8_10.id = "MatchmakingText"

	var_8_10:SetRGBFromTable(SWATCHES.Lobby.Header2, 0)
	var_8_10:setText(Engine.CBBHFCGDIC("LUA_MENU/WAITING_FOR_MATCHMAKING"), 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_10:SetAlignment(LUI.Alignment.Center)
	var_8_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 100, _1080p * -100, _1080p * 280, _1080p * 310)
	var_8_0:addElement(var_8_10)

	var_8_0.MatchmakingText = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIText.new()

	var_8_12.id = "WaitingText"

	var_8_12:SetRGBFromTable(SWATCHES.Lobby.Header, 0)
	var_8_12:setText(ToUpperCase(Engine.CBBHFCGDIC("TOURNAMENT/GUNFIGHT_TOURNAMENT")), 0)
	var_8_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_12:SetAlignment(LUI.Alignment.Center)
	var_8_12:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 100, _1080p * -100, _1080p * 175, _1080p * 245)
	var_8_0:addElement(var_8_12)

	var_8_0.WaitingText = var_8_12

	local var_8_13
	local var_8_14 = MenuBuilder.BuildRegisteredType("UICountdown", {
		controllerIndex = var_8_1
	})

	var_8_14.id = "TournamentCountdownTime"

	var_8_14:SetRGBFromTable(SWATCHES.fieldOrders.highlight, 0)
	var_8_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_14:SetAlignment(LUI.Alignment.Center)
	var_8_14:setEndTime(0)
	var_8_14:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -100, _1080p * 100, _1080p * -260, _1080p * -230)
	var_8_0:addElement(var_8_14)

	var_8_0.TournamentCountdownTime = var_8_14

	local var_8_15
	local var_8_16 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_8_1
	})

	var_8_16.id = "WithdrawButton"

	var_8_16.Text:SetLeft(_1080p * 20, 0)
	var_8_16.Text:setText(Engine.CBBHFCGDIC("TOURNAMENT/CANCEL_REGISTRATION"), 0)
	var_8_16.Text:SetAlignment(LUI.Alignment.Center)
	var_8_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 750, _1080p * 1170, _1080p * 941, _1080p * 979)
	var_8_0:addElement(var_8_16)

	var_8_0.WithdrawButton = var_8_16

	local var_8_17
	local var_8_18 = LUI.UIStyledText.new()

	var_8_18.id = "BetaWatermark"

	var_8_18:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_8_18:SetAlpha(0.4, 0)
	var_8_18:setText(ToUpperCase(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/BETA")), 0)
	var_8_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_18:SetAlignment(LUI.Alignment.Right)
	var_8_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 929, _1080p * 999)
	var_8_0:addElement(var_8_18)

	var_8_0.BetaWatermark = var_8_18

	local function var_8_19()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_19

	local var_8_20 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Matchmaking", var_8_20)

	local var_8_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Matchmaking", var_8_21)

	local var_8_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("Matchmaking", var_8_22)

	local var_8_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("Matchmaking", var_8_23)

	local function var_8_24()
		var_8_6:AnimateSequence("Matchmaking")
		var_8_8:AnimateSequence("Matchmaking")
		var_8_10:AnimateSequence("Matchmaking")
		var_8_14:AnimateSequence("Matchmaking")
	end

	var_8_0._sequences.Matchmaking = var_8_24

	local var_8_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Countdown", var_8_25)

	local var_8_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Countdown", var_8_26)

	local var_8_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("Countdown", var_8_27)

	local var_8_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("Countdown", var_8_28)

	local function var_8_29()
		var_8_6:AnimateSequence("Countdown")
		var_8_8:AnimateSequence("Countdown")
		var_8_10:AnimateSequence("Countdown")
		var_8_14:AnimateSequence("Countdown")
	end

	var_8_0._sequences.Countdown = var_8_29

	var_0_4(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("TournamentLoading", TournamentLoading)
LockTable(_M)
