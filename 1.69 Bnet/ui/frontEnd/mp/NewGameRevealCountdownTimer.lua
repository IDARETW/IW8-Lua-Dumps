module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = tonumber(arg_1_1._eventAccessPeriod)

	TIME.SetCountDownTimerTextField(arg_1_0.Timer, var_1_0, {
		useCustomDisplay = true,
		broadcastOnComplete = true,
		customFormatString = "LUA_MENU/HOURS_MINUTES_SECONDS"
	})
	arg_1_0.Timer:addEventHandler(TIME.TIMER_TICK, function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_0:getParent()
		local var_2_1 = arg_2_1.intervals.hours == 0
		local var_2_2 = arg_2_1.intervals.days == 0

		if var_2_1 then
			arg_2_0:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MINUTES_SECONDS", arg_2_1.intervals.minutes, arg_2_1.intervals.seconds))

			if not var_2_0._inMinutesAndSeconds then
				var_2_0._inMinutesAndSeconds = true
			end
		elseif var_2_2 then
			arg_2_0:setText(Engine.CBBHFCGDIC("LUA_MENU/HOURS_MINUTES_SECONDS", arg_2_1.intervals.hours, arg_2_1.intervals.minutes, arg_2_1.intervals.seconds))

			if not var_2_0._inHoursAndMinutesAndSeconds then
				var_2_0._inHoursAndMinutesAndSeconds = true
			end
		else
			arg_2_0:setText(Engine.CBBHFCGDIC("LUA_MENU_WZ355/DAYS", arg_2_1.intervals.days))

			if not var_2_0._inDays then
				var_2_0._inDays = true
			end
		end
	end)
	arg_1_0.Timer:addEventHandler(TIME.TIMER_COMPLETE, function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_0:getParent()

		ACTIONS.AnimateSequence(var_3_0, "EventLive")
	end)

	if not arg_1_0._timerComplete then
		ACTIONS.AnimateSequence(arg_1_0, "EventCountdown")
	else
		ACTIONS.AnimateSequence(arg_1_0, "EventLive")
	end
end

local function var_0_1(arg_4_0, arg_4_1)
	assert(arg_4_1 and arg_4_1.animSequence, "You must specify an animation.")

	if arg_4_0._lastState ~= arg_4_1.animSequence then
		arg_4_0._lastState = arg_4_1.animSequence

		ACTIONS.AnimateSequence(arg_4_0, arg_4_1.animSequence)
	end
end

local function var_0_2(arg_5_0)
	local var_5_0 = Dvar.CFHDGABACF("NKPOKTRNL")

	if var_5_0 and var_5_0 > 0 then
		local var_5_1 = ""

		if CONDITIONS.IsPC() then
			var_5_1 = "LUA_MENU_WZ350/NG_REVEAL_BUTTON_TEXT_PC_CHANGE_" .. tostring(var_5_0)
		elseif CONDITIONS.IsSony() then
			var_5_1 = "LUA_MENU_WZ350/NG_REVEAL_BUTTON_TEXT_SONY_CHANGE_" .. tostring(var_5_0)
		elseif CONDITIONS.IsXbox() then
			var_5_1 = "LUA_MENU_WZ350/NG_REVEAL_BUTTON_TEXT_XBOX_CHANGE_" .. tostring(var_5_0)
		end

		arg_5_0.RevealGameLabel:setText(Engine.CBBHFCGDIC(var_5_1))
	end
end

local function var_0_3(arg_6_0, arg_6_1)
	local var_6_0 = Dvar.DHEEJCCJBH("MMOPQOLLMQ")

	if var_6_0 and arg_6_1.useTimer then
		if arg_6_1.gameRevealType == MAIN_MENU.NGGameRevealType.Cortez then
			if MAIN_MENU.IsCortezReleaseCountdown() then
				ACTIONS.AnimateSequence(arg_6_0, "EventCountdownWithText")
				arg_6_0.Timer:setText(Engine.CBBHFCGDIC("LUA_MENU_WZ355/THIS_WEEK"))
			else
				ACTIONS.AnimateSequence(arg_6_0, "EventLive")
			end
		end

		if arg_6_1.gameRevealType == MAIN_MENU.NGGameRevealType.WZ2 then
			if Engine.CCEJJCCDEG(var_6_0) > 0 then
				arg_6_1._eventAccessPeriod = var_6_0

				var_0_0(arg_6_0, arg_6_1)
			else
				arg_6_0._timerComplete = true

				ACTIONS.AnimateSequence(arg_6_0, "EventLive")
			end
		end
	end
end

local function var_0_4(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIBindButton.new()

	var_7_0.id = "selfBindButton"

	arg_7_0:addElement(var_7_0)

	arg_7_0._bindButton = var_7_0

	local function var_7_1(arg_8_0, arg_8_1)
		LUI.FlowManager.RequestPopupMenu(arg_7_0, "CortezPreOrderPopup", true, arg_8_1.controller, false, {
			cortezEntryPointMenu = STORE.CortezEntryPointMenu.MainMenuBlades
		})
	end

	local function var_7_2(arg_9_0, arg_9_1)
		if arg_7_1.gameRevealType == MAIN_MENU.NGGameRevealType.Cortez then
			Dvar.DFIJDJFIFD("NLTLMQTLK", CrossLaunchUtils.HQCrosslaunchTitles.CORTEZ)
		elseif arg_7_1.gameRevealType == MAIN_MENU.NGGameRevealType.WZ2 then
			Dvar.DFIJDJFIFD("NLTLMQTLK", CrossLaunchUtils.HQCrosslaunchTitles.WZ2)
		end

		local var_9_0 = CONDITIONS.ArePartiesEnabledInMainMenu() and Lobby.GFFECBCCF() and Lobby.BGIADHIHAG() and Lobby.IsNotAloneInPrivateParty()

		CrossLaunchUtils.CrossLaunchWithDeepLink(arg_9_0, arg_9_1.controller, {
			_deepLinkGame = LUI.DEEP_LINK_GAME.HQ,
			_deepLinkGameMode = LUI.DEEP_LINK_GAME_MODE.MP,
			_shouldUseBreakupPartyPopup = var_9_0
		})
	end

	local function var_7_3(arg_10_0, arg_10_1)
		InGameStore.SelectProduct(arg_10_1.controller, STORE.CortezStandardID, InGameStorePurchaseType.BROWSE)
	end

	local var_7_4 = MAIN_MENU.GetNGBladeState()

	if arg_7_1.gameRevealType == MAIN_MENU.NGGameRevealType.Cortez then
		local var_7_5, var_7_6, var_7_7, var_7_8 = MAIN_MENU.GetCortezProductOwned(arg_7_1.controllerIndex, true)
		local var_7_9 = var_7_5.owned or var_7_6.owned

		if (STORE.IsCortezOwned(arg_7_1.controllerIndex) or var_7_9) and var_7_4 >= MAIN_MENU.NGBladeStates.CortezReleaseCountdown then
			arg_7_0._bindButton:registerEventHandler("button_action", var_7_2)
		else
			arg_7_0._bindButton:registerEventHandler("button_action", var_7_1)
		end
	elseif arg_7_1.gameRevealType == MAIN_MENU.NGGameRevealType.WZ2 then
		if var_7_4 >= MAIN_MENU.NGBladeStates.StyxNowAvailable then
			arg_7_0._bindButton:registerEventHandler("button_action", var_7_2)
		end
	elseif arg_7_1.gameRevealType == MAIN_MENU.NGGameRevealType.CortezFreeTrial then
		arg_7_0._bindButton:registerEventHandler("button_action", var_7_3)
	end
end

function SetupColor(arg_11_0, arg_11_1)
	if arg_11_1.gameRevealType == MAIN_MENU.NGGameRevealType.Cortez or arg_11_1.gameRevealType == MAIN_MENU.NGGameRevealType.CortezFreeTrial or arg_11_1.gameRevealType == MAIN_MENU.NGGameRevealType.WZ2 then
		arg_11_0.FocusBorder:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezGreen, 0)
		arg_11_0.TopSep:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezGreen, 0)
		arg_11_0.BotSep:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezGreen, 0)
		arg_11_0.Timer:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezGreen, 0)
		arg_11_0.FreeTrialTitleLabel:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezGreen, 0)
		arg_11_0.LiveTextBacking:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezGreen, 0)
	end
end

function SetupNGImage(arg_12_0, arg_12_1)
	if arg_12_1.gameRevealType == MAIN_MENU.NGGameRevealType.WZ2 then
		arg_12_0.WZWipBackground:setImage(RegisterMaterial("logo_cod_wz2"), 0)
		ACTIONS.AnimateSequence(arg_12_0, "EnlargeWZ2Logo")
	end
end

function SetupFreeTrialState(arg_13_0, arg_13_1)
	if arg_13_1.gameRevealType == MAIN_MENU.NGGameRevealType.CortezFreeTrial then
		arg_13_0.FreeTrialTitleLabel:setText(Engine.CBBHFCGDIC("LUA_MENU_WZ355/CORTEZ_FREE_TRIAL"), 0)
		arg_13_0.BackgroundImage:setImage(RegisterMaterial("cortez_free_trial_button_background"), 0)
		ACTIONS.AnimateSequence(arg_13_0, "NGFreeTrial")
	end
end

local function var_0_5(arg_14_0, arg_14_1, arg_14_2)
	arg_14_2._inMinutesAndSeconds = false
	arg_14_2._inHoursAndMinutesAndSeconds = false
	arg_14_2._inDays = false
	arg_14_2._timerComplete = false
	arg_14_0.RefreshAnimation = var_0_1

	arg_14_0:addEventHandler("button_over", function(arg_15_0, arg_15_1)
		arg_14_0:RefreshAnimation({
			focused = true,
			animSequence = "ButtonOver"
		})
	end)
	arg_14_0:addEventHandler("button_up", function(arg_16_0, arg_16_1)
		arg_14_0:RefreshAnimation({
			focused = true,
			animSequence = "ButtonUp"
		})
	end)
	var_0_3(arg_14_0, arg_14_2)
	var_0_2(arg_14_0)
	var_0_4(arg_14_0, arg_14_2)
	SetupColor(arg_14_0, arg_14_2)
	SetupNGImage(arg_14_0, arg_14_2)
	SetupFreeTrialState(arg_14_0, arg_14_2)
end

function NewGameRevealCountdownTimer(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIButton.new()

	var_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 130 * _1080p)

	var_17_0.id = "NewGameRevealCountdownTimer"
	var_17_0._animationSets = var_17_0._animationSets or {}
	var_17_0._sequences = var_17_0._sequences or {}

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0
	local var_17_3

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_17_4 = LUI.UIImage.new()

		var_17_4.id = "TextureLayer"

		var_17_4:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
		var_17_4:SetAlpha(0.1, 0)
		var_17_4:SetPixelGridEnabled(true)
		var_17_4:SetPixelGridContrast(0.8, 0)
		var_17_4:SetPixelGridBlockWidth(2, 0)
		var_17_4:SetPixelGridBlockHeight(2, 0)
		var_17_4:SetPixelGridGutterWidth(1, 0)
		var_17_4:SetPixelGridGutterHeight(1, 0)
		var_17_4:setImage(RegisterMaterial("ui_default_white"), 0)
		var_17_0:addElement(var_17_4)

		var_17_0.TextureLayer = var_17_4
	end

	local var_17_5

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_17_6 = LUI.UIImage.new()

		var_17_6.id = "Gradient"

		var_17_6:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
		var_17_6:SetAlpha(0, 0)
		var_17_6:SetPixelGridEnabled(true)
		var_17_6:SetPixelGridContrast(0.2, 0)
		var_17_6:SetPixelGridBlockWidth(2, 0)
		var_17_6:SetPixelGridBlockHeight(2, 0)
		var_17_6:SetPixelGridGutterWidth(1, 0)
		var_17_6:SetPixelGridGutterHeight(1, 0)
		var_17_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
		var_17_0:addElement(var_17_6)

		var_17_0.Gradient = var_17_6
	end

	local var_17_7
	local var_17_8 = LUI.UIImage.new()

	var_17_8.id = "BackgroundImage"

	var_17_8:setImage(RegisterMaterial("new_game_reveal_button_background"), 0)
	var_17_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 2, _1080p * -2)
	var_17_0:addElement(var_17_8)

	var_17_0.BackgroundImage = var_17_8

	local var_17_9
	local var_17_10 = LUI.UIImage.new()

	var_17_10.id = "WZWipBackground"

	var_17_10:SetRGBFromTable(SWATCHES.BattlePass.White, 0)
	var_17_10:SetScale(0.25, 0)
	var_17_10:setImage(RegisterMaterial("logo_cod_cortez"), 0)
	var_17_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 30, _1080p * -238, _1080p * 26, _1080p * -24)
	var_17_0:addElement(var_17_10)

	var_17_0.WZWipBackground = var_17_10

	local var_17_11
	local var_17_12 = LUI.UIImage.new()

	var_17_12.id = "AccessPeriodTextBacking"

	var_17_12:SetRGBFromTable(SWATCHES.CH2.CH2DarkBlue, 0)
	var_17_12:SetAlpha(0, 0)
	var_17_12:setImage(RegisterMaterial("menu_backer_redact_white"), 0)
	var_17_12:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -1, _1080p * -429, _1080p * -88, _1080p * -38)
	var_17_0:addElement(var_17_12)

	var_17_0.AccessPeriodTextBacking = var_17_12

	local var_17_13
	local var_17_14 = LUI.UIImage.new()

	var_17_14.id = "TopSep"

	var_17_14:SetRGBFromTable(SWATCHES.powers.inactive_sp_shield, 0)
	var_17_14:SetAlpha(0.8, 0)
	var_17_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
	var_17_0:addElement(var_17_14)

	var_17_0.TopSep = var_17_14

	local var_17_15
	local var_17_16 = LUI.UIImage.new()

	var_17_16.id = "BotSep"

	var_17_16:SetRGBFromTable(SWATCHES.powers.inactive_sp_shield, 0)
	var_17_16:SetAlpha(0.8, 0)
	var_17_16:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, 0)
	var_17_0:addElement(var_17_16)

	var_17_0.BotSep = var_17_16

	local var_17_17
	local var_17_18 = MenuBuilder.BuildRegisteredType("GenericBorderFrame", {
		controllerIndex = var_17_1
	})

	var_17_18.id = "FocusBorder"

	var_17_18:SetRGBFromTable(SWATCHES.CH2.CH2_Highlight, 0)
	var_17_18:SetAlpha(0, 0)
	var_17_18.Left:SetRight(_1080p * 4, 0)
	var_17_18.Right:SetLeft(_1080p * -4, 0)
	var_17_18.Top:SetBottom(_1080p * 4, 0)
	var_17_18.Bottom:SetTop(_1080p * -4, 0)
	var_17_18:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_17_0:addElement(var_17_18)

	var_17_0.FocusBorder = var_17_18

	local var_17_19
	local var_17_20 = LUI.UIStyledText.new()

	var_17_20.id = "Timer"

	var_17_20:SetRGBFromTable(SWATCHES.BattlePass.White, 0)
	var_17_20:setText("", 0)
	var_17_20:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_17_20:SetAlignment(LUI.Alignment.Center)
	var_17_20:SetShadowRGBFromInt(0, 0)
	var_17_20:SetOutlineMinDistance(0.02, 0)
	var_17_20:SetOutlineMaxDistance(0.02, 0)
	var_17_20:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -117, _1080p * 117, _1080p * -38, _1080p * -8)
	var_17_0:addElement(var_17_20)

	var_17_0.Timer = var_17_20

	local var_17_21
	local var_17_22 = LUI.UIImage.new()

	var_17_22.id = "DisabledMask"

	var_17_22:SetRGBFromInt(3158064, 0)
	var_17_22:SetAlpha(0, 0)
	var_17_22:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 1, _1080p * 129)
	var_17_0:addElement(var_17_22)

	var_17_0.DisabledMask = var_17_22

	local var_17_23
	local var_17_24 = LUI.UIText.new()

	var_17_24.id = "RevealGameLabel"

	var_17_24:setText("", 0)
	var_17_24:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_17_24:SetAlignment(LUI.Alignment.Left)
	var_17_24:SetVerticalAlignment(LUI.Alignment.Center)
	var_17_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 215, _1080p * 403, _1080p * 55, _1080p * 75)
	var_17_0:addElement(var_17_24)

	var_17_0.RevealGameLabel = var_17_24

	local var_17_25
	local var_17_26 = LUI.UIImage.new()

	var_17_26.id = "LiveTextBacking"

	var_17_26:SetAlpha(0, 0)
	var_17_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 14, _1080p * 171, _1080p * 94, _1080p * 115)
	var_17_0:addElement(var_17_26)

	var_17_0.LiveTextBacking = var_17_26

	local var_17_27
	local var_17_28 = LUI.UIText.new()

	var_17_28.id = "LiveLabel"

	var_17_28:SetRGBFromInt(0, 0)
	var_17_28:SetAlpha(0, 0)
	var_17_28:setText(Engine.CBBHFCGDIC("LUA_MENU_WZ355/LIVE"), 0)
	var_17_28:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_17_28:SetAlignment(LUI.Alignment.Left)
	var_17_28:SetVerticalAlignment(LUI.Alignment.Center)
	var_17_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 162, _1080p * 94, _1080p * 114)
	var_17_0:addElement(var_17_28)

	var_17_0.LiveLabel = var_17_28

	local var_17_29
	local var_17_30 = LUI.UIText.new()

	var_17_30.id = "FreeTrialTitleLabel"

	var_17_30:SetAlpha(0.51, 0)
	var_17_30:setText("", 0)
	var_17_30:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_17_30:SetAlignment(LUI.Alignment.Left)
	var_17_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 14, _1080p * 211, _1080p * 7, _1080p * 31)
	var_17_0:addElement(var_17_30)

	var_17_0.FreeTrialTitleLabel = var_17_30

	local function var_17_31()
		return
	end

	var_17_0._sequences.DefaultSequence = var_17_31

	local var_17_32
	local var_17_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_17_20:RegisterAnimationSequence("AR", var_17_33)

	local function var_17_34()
		var_17_20:AnimateSequence("AR")
	end

	var_17_0._sequences.AR = var_17_34

	local var_17_35
	local var_17_36 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_12:RegisterAnimationSequence("EventEnded", var_17_36)

	local var_17_37 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_20:RegisterAnimationSequence("EventEnded", var_17_37)

	local function var_17_38()
		var_17_12:AnimateSequence("EventEnded")
		var_17_20:AnimateSequence("EventEnded")
	end

	var_17_0._sequences.EventEnded = var_17_38

	local var_17_39
	local var_17_40 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_22:RegisterAnimationSequence("Disabled", var_17_40)

	local function var_17_41()
		var_17_22:AnimateSequence("Disabled")
	end

	var_17_0._sequences.Disabled = var_17_41

	local var_17_42
	local var_17_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_12:RegisterAnimationSequence("Hide", var_17_43)

	local var_17_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_20:RegisterAnimationSequence("Hide", var_17_44)

	local function var_17_45()
		var_17_12:AnimateSequence("Hide")
		var_17_20:AnimateSequence("Hide")
	end

	var_17_0._sequences.Hide = var_17_45

	local var_17_46
	local var_17_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_12:RegisterAnimationSequence("Show", var_17_47)

	local var_17_48 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_20:RegisterAnimationSequence("Show", var_17_48)

	local function var_17_49()
		var_17_12:AnimateSequence("Show")
		var_17_20:AnimateSequence("Show")
	end

	var_17_0._sequences.Show = var_17_49

	local var_17_50
	local var_17_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 174
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -174
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -38
		},
		{
			value = false,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Word_Wrap
		}
	}

	var_17_20:RegisterAnimationSequence("Asian", var_17_51)

	local function var_17_52()
		var_17_20:AnimateSequence("Asian")
	end

	var_17_0._sequences.Asian = var_17_52

	local var_17_53
	local var_17_54 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 211
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		}
	}

	var_17_20:RegisterAnimationSequence("EventCountdownWithText", var_17_54)

	local var_17_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 98
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		}
	}

	var_17_24:RegisterAnimationSequence("EventCountdownWithText", var_17_55)

	local function var_17_56()
		var_17_20:AnimateSequence("EventCountdownWithText")
		var_17_24:AnimateSequence("EventCountdownWithText")
	end

	var_17_0._sequences.EventCountdownWithText = var_17_56

	local var_17_57
	local var_17_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 134
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -134
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -38
		}
	}

	var_17_10:RegisterAnimationSequence("EventLive", var_17_58)

	local var_17_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_WZ355/NOW_AVAILABLE")
		}
	}

	var_17_20:RegisterAnimationSequence("EventLive", var_17_59)

	local var_17_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = "",
			duration = 0,
			property = TWEEN_PROPERTY.Text
		}
	}

	var_17_24:RegisterAnimationSequence("EventLive", var_17_60)

	local function var_17_61()
		var_17_10:AnimateSequence("EventLive")
		var_17_20:AnimateSequence("EventLive")
		var_17_24:AnimateSequence("EventLive")
	end

	var_17_0._sequences.EventLive = var_17_61

	local var_17_62
	local var_17_63 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_18:RegisterAnimationSequence("ButtonOver", var_17_63)

	local function var_17_64()
		var_17_18:AnimateSequence("ButtonOver")
	end

	var_17_0._sequences.ButtonOver = var_17_64

	local var_17_65
	local var_17_66 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_18:RegisterAnimationSequence("ButtonUp", var_17_66)

	local function var_17_67()
		var_17_18:AnimateSequence("ButtonUp")
	end

	var_17_0._sequences.ButtonUp = var_17_67

	local var_17_68
	local var_17_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 134
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -134
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -38
		}
	}

	var_17_10:RegisterAnimationSequence("EventCountdown", var_17_69)

	local var_17_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_24:RegisterAnimationSequence("EventCountdown", var_17_70)

	local function var_17_71()
		var_17_10:AnimateSequence("EventCountdown")
		var_17_24:AnimateSequence("EventCountdown")
	end

	var_17_0._sequences.EventCountdown = var_17_71

	local var_17_72
	local var_17_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_10:RegisterAnimationSequence("NGFreeTrial", var_17_73)

	local var_17_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_20:RegisterAnimationSequence("NGFreeTrial", var_17_74)

	local var_17_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_24:RegisterAnimationSequence("NGFreeTrial", var_17_75)

	local var_17_76 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_26:RegisterAnimationSequence("NGFreeTrial", var_17_76)

	local var_17_77 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_28:RegisterAnimationSequence("NGFreeTrial", var_17_77)

	local var_17_78 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_30:RegisterAnimationSequence("NGFreeTrial", var_17_78)

	local function var_17_79()
		var_17_10:AnimateSequence("NGFreeTrial")
		var_17_20:AnimateSequence("NGFreeTrial")
		var_17_24:AnimateSequence("NGFreeTrial")
		var_17_26:AnimateSequence("NGFreeTrial")
		var_17_28:AnimateSequence("NGFreeTrial")
		var_17_30:AnimateSequence("NGFreeTrial")
	end

	var_17_0._sequences.NGFreeTrial = var_17_79

	local var_17_80
	local var_17_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -23
		}
	}

	var_17_10:RegisterAnimationSequence("EnlargeWZ2Logo", var_17_81)

	local function var_17_82()
		var_17_10:AnimateSequence("EnlargeWZ2Logo")
	end

	var_17_0._sequences.EnlargeWZ2Logo = var_17_82

	var_0_5(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("NewGameRevealCountdownTimer", NewGameRevealCountdownTimer)
LockTable(_M)
