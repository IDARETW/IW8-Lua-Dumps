module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = tonumber(arg_1_1._eventAccessPeriod)
	local var_1_1 = MAIN_MENU.IsCortezReleaseCountdown() or MAIN_MENU.IsStyxReleaseCountdown()
	local var_1_2 = {}

	if var_1_1 then
		var_1_2.customFormatString = "LUA_MENU_WZ345/DAYS_COUNTDOWN"
	else
		var_1_2.customFormatString = "LUA_MENU/HOURS_MINUTES_SECONDS"
	end

	var_1_2.useCustomDisplay = true
	var_1_2.broadcastOnComplete = true

	TIME.SetCountDownTimerTextField(arg_1_0.Timer, var_1_0, var_1_2)
	arg_1_0.Timer:addEventHandler(TIME.TIMER_TICK, function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_0:getParent()
		local var_2_1 = not var_1_1 or arg_2_1.intervals.days == 0
		local var_2_2 = arg_2_1.intervals.hours == 0
		local var_2_3 = ""

		if var_2_1 then
			if var_2_2 then
				var_2_3 = Engine.CBBHFCGDIC("LUA_MENU_MP/MINUTES_SECONDS", arg_2_1.intervals.minutes, arg_2_1.intervals.seconds)

				if not var_2_0._inMinutesAndSeconds then
					var_2_0._inMinutesAndSeconds = true
				end
			else
				var_2_3 = Engine.CBBHFCGDIC("LUA_MENU/HOURS_MINUTES_SECONDS", arg_2_1.intervals.hours, arg_2_1.intervals.minutes, arg_2_1.intervals.seconds)

				if not var_2_0._inHoursAndMinutesAndSeconds then
					var_2_0._inHoursAndMinutesAndSeconds = true
				end
			end
		else
			var_2_3 = Engine.CBBHFCGDIC("LUA_MENU_WZ345/DAYS_COUNTDOWN", arg_2_1.intervals.days)

			if not var_2_0._inDays then
				var_2_0._inDays = true
			end
		end

		arg_2_0:setText(var_2_3)
		var_2_0.TimerGlow:setText(var_2_3)
	end)
	arg_1_0.Timer:addEventHandler(TIME.TIMER_COMPLETE, function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_0 and arg_3_0:getParent()

		if var_3_0 then
			var_3_0._timerComplete = true

			ACTIONS.AnimateSequence(var_3_0, "EventLive")
		end
	end)

	if not arg_1_0._timerComplete then
		ACTIONS.AnimateSequence(arg_1_0, "EventCountdown")
	else
		ACTIONS.AnimateSequence(arg_1_0, "EventLive")
	end
end

local function var_0_1(arg_4_0, arg_4_1)
	local var_4_0 = Dvar.DHEEJCCJBH("MMOPQOLLMQ")

	if var_4_0 then
		if MAIN_MENU.IsCortezReleaseCountdown() then
			arg_4_0.Timer:setText(Engine.CBBHFCGDIC("LUA_MENU_WZ355/CORTEZ_BANNER_THIS_WEEK"))
		elseif MAIN_MENU.IsStyxReleaseCountdown() then
			if Engine.CCEJJCCDEG(var_4_0) > 0 then
				arg_4_1._eventAccessPeriod = var_4_0

				var_0_0(arg_4_0, arg_4_1)
			else
				arg_4_0._timerComplete = true

				ACTIONS.AnimateSequence(arg_4_0, "EventLive")
			end
		end
	else
		DebugPrint("[NewGameRevealBanner] 'scr_br_event_new_game_reveal' is set, yet no 'ui_br_event_new_game_reveal_period_utc' is provided, unable to create timer")
	end
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._controllerIndex = arg_5_1
	arg_5_2._inMinutesAndSeconds = false
	arg_5_2._inHoursAndMinutesAndSeconds = false
	arg_5_2._timerComplete = false

	var_0_1(arg_5_0, arg_5_2)
	arg_5_0.BackingGlow:SetMask(arg_5_0.Mask)
end

function NewGameRevealBanner(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 150 * _1080p)

	var_6_0.id = "NewGameRevealBanner"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "BackingGlow"

	var_6_4:SetRGBFromTable(SWATCHES.CH2.CH2Backer, 0)
	var_6_4:SetAlpha(0.75, 0)
	var_6_4:setImage(RegisterMaterial("ui_generic_glow"), 0)
	var_6_4:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 15, _1080p * 15, _1080p * -186, _1080p * 336)
	var_6_0:addElement(var_6_4)

	var_6_0.BackingGlow = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "Mask"

	var_6_6:setImage(RegisterMaterial("ui_shared_outer_bar_mask"), 0)
	var_6_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -158, _1080p * 72)
	var_6_0:addElement(var_6_6)

	var_6_0.Mask = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "BackgroundImage"

	var_6_8:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezGreen, 0)
	var_6_8:SetAlpha(0.9, 0)
	var_6_8:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_6_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 69)
	var_6_0:addElement(var_6_8)

	var_6_0.BackgroundImage = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIImage.new()

	var_6_10.id = "BackgroundUnderline"

	var_6_10:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezGreen, 0)
	var_6_10:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_6_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 67, _1080p * 69)
	var_6_0:addElement(var_6_10)

	var_6_0.BackgroundUnderline = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIImage.new()

	var_6_12.id = "darkener"

	var_6_12:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_6_12:SetAlpha(0, 0)
	var_6_12:setImage(RegisterMaterial("ui_generic_glow"), 0)
	var_6_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 471, _1080p * -504, _1080p * -82, _1080p * 177)
	var_6_0:addElement(var_6_12)

	var_6_0.darkener = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIStyledText.new()

	var_6_14.id = "SubTitle"

	var_6_14:SetRGBFromTable(SWATCHES.Reticles.Black, 0)
	var_6_14:setText(ToUpperCase(""), 0)
	var_6_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_14:SetWordWrap(false)
	var_6_14:SetAlignment(LUI.Alignment.Center)
	var_6_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_14:SetStartupDelay(2000)
	var_6_14:SetLineHoldTime(400)
	var_6_14:SetAnimMoveTime(150)
	var_6_14:SetAnimMoveSpeed(50)
	var_6_14:SetEndDelay(1500)
	var_6_14:SetCrossfadeTime(400)
	var_6_14:SetFadeInTime(300)
	var_6_14:SetFadeOutTime(300)
	var_6_14:SetMaxVisibleLines(1)
	var_6_14:SetShadowRGBFromTable(SWATCHES.Reticles.Black, 0)
	var_6_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 200, _1080p * -200, _1080p * 34, _1080p * 64)
	var_6_0:addElement(var_6_14)

	var_6_0.SubTitle = var_6_14

	local var_6_15
	local var_6_16 = LUI.UIStyledText.new()

	var_6_16.id = "Title"

	var_6_16:SetRGBFromTable(SWATCHES.Reticles.Black, 0)
	var_6_16:setText(ToUpperCase(""), 0)
	var_6_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_16:SetWordWrap(false)
	var_6_16:SetAlignment(LUI.Alignment.Center)
	var_6_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_16:SetStartupDelay(2000)
	var_6_16:SetLineHoldTime(400)
	var_6_16:SetAnimMoveTime(150)
	var_6_16:SetAnimMoveSpeed(50)
	var_6_16:SetEndDelay(1500)
	var_6_16:SetCrossfadeTime(400)
	var_6_16:SetFadeInTime(300)
	var_6_16:SetFadeOutTime(300)
	var_6_16:SetMaxVisibleLines(1)
	var_6_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 200, _1080p * -200, _1080p * 4, _1080p * 34)
	var_6_0:addElement(var_6_16)

	var_6_0.Title = var_6_16

	local var_6_17
	local var_6_18 = LUI.UIStyledText.new()

	var_6_18.id = "TimerGlow"

	var_6_18:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezGreen, 0)
	var_6_18:setText("", 0)
	var_6_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_18:SetWordWrap(false)
	var_6_18:SetAlignment(LUI.Alignment.Center)
	var_6_18:SetVerticalAlignment(LUI.Alignment.Center)
	var_6_18:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 2, _1080p * 2, _1080p * 35, _1080p * 65)
	var_6_0:addElement(var_6_18)

	var_6_0.TimerGlow = var_6_18

	local var_6_19
	local var_6_20 = LUI.UIStyledText.new()

	var_6_20.id = "Timer"

	var_6_20:SetRGBFromTable(SWATCHES.Reticles.Black, 0)
	var_6_20:setText("", 0)
	var_6_20:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_20:SetWordWrap(false)
	var_6_20:SetAlignment(LUI.Alignment.Center)
	var_6_20:SetVerticalAlignment(LUI.Alignment.Center)
	var_6_20:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 34, _1080p * 64)
	var_6_0:addElement(var_6_20)

	var_6_0.Timer = var_6_20

	local function var_6_21()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_21

	local var_6_22
	local var_6_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("Hide", var_6_23)

	local var_6_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Hide", var_6_24)

	local var_6_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("Hide", var_6_25)

	local var_6_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("Hide", var_6_26)

	local var_6_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("Hide", var_6_27)

	local var_6_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("Hide", var_6_28)

	local var_6_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_18:RegisterAnimationSequence("Hide", var_6_29)

	local var_6_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_20:RegisterAnimationSequence("Hide", var_6_30)

	local function var_6_31()
		var_6_4:AnimateSequence("Hide")
		var_6_8:AnimateSequence("Hide")
		var_6_10:AnimateSequence("Hide")
		var_6_12:AnimateSequence("Hide")
		var_6_14:AnimateSequence("Hide")
		var_6_16:AnimateSequence("Hide")
		var_6_18:AnimateSequence("Hide")
		var_6_20:AnimateSequence("Hide")
	end

	var_6_0._sequences.Hide = var_6_31

	local var_6_32
	local var_6_33 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("Show", var_6_33)

	local var_6_34 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Show", var_6_34)

	local var_6_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("Show", var_6_35)

	local var_6_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("Show", var_6_36)

	local var_6_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("Show", var_6_37)

	local var_6_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("Show", var_6_38)

	local var_6_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_18:RegisterAnimationSequence("Show", var_6_39)

	local var_6_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_20:RegisterAnimationSequence("Show", var_6_40)

	local function var_6_41()
		var_6_4:AnimateSequence("Show")
		var_6_8:AnimateSequence("Show")
		var_6_10:AnimateSequence("Show")
		var_6_12:AnimateSequence("Show")
		var_6_14:AnimateSequence("Show")
		var_6_16:AnimateSequence("Show")
		var_6_18:AnimateSequence("Show")
		var_6_20:AnimateSequence("Show")
	end

	var_6_0._sequences.Show = var_6_41

	local var_6_42
	local var_6_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ355/NOW_AVAILABLE"))
		}
	}

	var_6_14:RegisterAnimationSequence("EventLive", var_6_43)

	local var_6_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_18:RegisterAnimationSequence("EventLive", var_6_44)

	local var_6_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_20:RegisterAnimationSequence("EventLive", var_6_45)

	local function var_6_46()
		var_6_14:AnimateSequence("EventLive")
		var_6_18:AnimateSequence("EventLive")
		var_6_20:AnimateSequence("EventLive")
	end

	var_6_0._sequences.EventLive = var_6_46

	local var_6_47
	local var_6_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("EventCountdown", var_6_48)

	local var_6_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_18:RegisterAnimationSequence("EventCountdown", var_6_49)

	local var_6_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_20:RegisterAnimationSequence("EventCountdown", var_6_50)

	local function var_6_51()
		var_6_14:AnimateSequence("EventCountdown")
		var_6_18:AnimateSequence("EventCountdown")
		var_6_20:AnimateSequence("EventCountdown")
	end

	var_6_0._sequences.EventCountdown = var_6_51

	local var_6_52
	local var_6_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3CortezGreen
		}
	}

	var_6_8:RegisterAnimationSequence("CortezTheme", var_6_53)

	local var_6_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3CortezGreen
		}
	}

	var_6_10:RegisterAnimationSequence("CortezTheme", var_6_54)

	local var_6_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3CortezGreen
		}
	}

	var_6_18:RegisterAnimationSequence("CortezTheme", var_6_55)

	local function var_6_56()
		var_6_8:AnimateSequence("CortezTheme")
		var_6_10:AnimateSequence("CortezTheme")
		var_6_18:AnimateSequence("CortezTheme")
	end

	var_6_0._sequences.CortezTheme = var_6_56

	local var_6_57
	local var_6_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3CortezGreen
		}
	}

	var_6_8:RegisterAnimationSequence("StyxTheme", var_6_58)

	local var_6_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3CortezGreen
		}
	}

	var_6_10:RegisterAnimationSequence("StyxTheme", var_6_59)

	local var_6_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3CortezGreen
		}
	}

	var_6_18:RegisterAnimationSequence("StyxTheme", var_6_60)

	local function var_6_61()
		var_6_8:AnimateSequence("StyxTheme")
		var_6_10:AnimateSequence("StyxTheme")
		var_6_18:AnimateSequence("StyxTheme")
	end

	var_6_0._sequences.StyxTheme = var_6_61

	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("NewGameRevealBanner", NewGameRevealBanner)
LockTable(_M)
