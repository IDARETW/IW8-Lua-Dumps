module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1 and arg_1_1.animSequence, "You must specify an animation.")

	if arg_1_0._lastState ~= arg_1_1.animSequence then
		arg_1_0._lastState = arg_1_1.animSequence

		ACTIONS.AnimateSequence(arg_1_0, arg_1_1.animSequence)
	end
end

local function var_0_1(arg_2_0)
	LAYOUT.SizeTextBackingSizeToText(arg_2_0, {
		useEvenPadding = true,
		padding = 0,
		textfield = arg_2_0.AccessPeriodText,
		textfieldBackingImage = arg_2_0.AccessPeriodTextBacking,
		forceAlignRight = arg_2_0._isArabic
	})
end

local function var_0_2(arg_3_0, arg_3_1)
	assert(arg_3_1 and type(arg_3_1) == "table", "You must provide the data for this event as type 'table'.")
	TIME.SetCountDownTimerTextField(arg_3_0.AccessPeriodText, tonumber(arg_3_1.accessPeriod), {
		useCustomDisplay = true,
		broadcastOnComplete = true,
		customFormatString = "LUA_MENU/DAYS_HOURS_MINUTES_SECONDS"
	})
	arg_3_0.AccessPeriodText:addEventHandler(TIME.TIMER_TICK, function(arg_4_0, arg_4_1)
		local var_4_0 = arg_4_1.intervals.days == 0
		local var_4_1 = arg_4_0:getParent()

		if var_4_0 then
			if arg_4_1.intervals.hours == 0 then
				arg_4_0:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MINUTES_SECONDS", arg_4_1.intervals.minutes, arg_4_1.intervals.seconds))

				if not var_4_1._inMinutesAndSeconds then
					var_4_1._inMinutesAndSeconds = true
				end
			else
				arg_4_0:setText(Engine.CBBHFCGDIC("LUA_MENU/HOURS_MINUTES_SECONDS", arg_4_1.intervals.hours, arg_4_1.intervals.minutes, arg_4_1.intervals.seconds))

				if not var_4_1._inHoursAndMinutes then
					var_4_1._inHoursAndMinutes = true
				end
			end
		else
			arg_4_0:setText(Engine.CBBHFCGDIC("LUA_MENU/DAYS_HOURS_MINUTES_SECONDS", arg_4_1.intervals.days, arg_4_1.intervals.hours, arg_4_1.intervals.minutes, arg_4_1.intervals.seconds))

			if not var_4_1._inDaysAndHours then
				var_4_1._inDaysAndHours = true

				var_4_1:UpdateTimerBackingSize()
			end
		end

		var_4_1:UpdateTimerBackingSize()
	end)
	arg_3_0.AccessPeriodText:addEventHandler(TIME.TIMER_COMPLETE, function(arg_5_0, arg_5_1)
		local var_5_0 = arg_5_0:getParent()

		arg_5_0:setText(Engine.CBBHFCGDIC(arg_5_1.disabledText or "LUA_MENU/WZ_EVENT_PLAYLIST_DISABLED"))
		var_5_0:RefreshAnimation({
			animSequence = "EventEnded"
		})

		var_5_0.disabled = true
	end)
	ACTIONS.AnimateSequence(arg_3_0, "Show")

	if arg_3_1.koreaDisabled and arg_3_1.koreaDisabled == "1" and (Engine.FABABBDBA() or Engine.DIEEIEFCFF()) then
		arg_3_0.disabled = true

		ACTIONS.AnimateSequence(arg_3_0, "Disabled")
	end
end

local function var_0_3(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_2.eventData and type(arg_6_2.eventData) == "table", "You must provide the data for this event as type 'table'.")

	arg_6_0.RefreshAnimation = var_0_0
	arg_6_0.UpdateTimerBackingSize = var_0_1
	arg_6_0.SetEventInfo = var_0_2
	arg_6_0._inDaysAndHours = false
	arg_6_0._inMinutesAndSeconds = false
	arg_6_0._inHoursAndMinutes = false
	arg_6_0._isArabic = IsLanguageArabic()

	ACTIONS.AnimateSequence(arg_6_0, "Hide")
	var_0_2(arg_6_0, arg_6_2.eventData)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_6_0, "AR")
	end

	if CONDITIONS.IsLanguageAsian() then
		ACTIONS.AnimateSequence(arg_6_0, "Asian")
	end

	arg_6_0:UpdateTimerBackingSize()
end

function PlaylistFeaturedCoundownTimer(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIButton.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 130 * _1080p)

	var_7_0.id = "PlaylistFeaturedCoundownTimer"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_7_4 = LUI.UIImage.new()

		var_7_4.id = "TextureLayer"

		var_7_4:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
		var_7_4:SetAlpha(0.1, 0)
		var_7_4:SetPixelGridEnabled(true)
		var_7_4:SetPixelGridContrast(0.8, 0)
		var_7_4:SetPixelGridBlockWidth(2, 0)
		var_7_4:SetPixelGridBlockHeight(2, 0)
		var_7_4:SetPixelGridGutterWidth(1, 0)
		var_7_4:SetPixelGridGutterHeight(1, 0)
		var_7_4:setImage(RegisterMaterial("ui_default_white"), 0)
		var_7_0:addElement(var_7_4)

		var_7_0.TextureLayer = var_7_4
	end

	local var_7_5

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_7_6 = LUI.UIImage.new()

		var_7_6.id = "Gradient"

		var_7_6:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
		var_7_6:SetAlpha(0, 0)
		var_7_6:SetPixelGridEnabled(true)
		var_7_6:SetPixelGridContrast(0.2, 0)
		var_7_6:SetPixelGridBlockWidth(2, 0)
		var_7_6:SetPixelGridBlockHeight(2, 0)
		var_7_6:SetPixelGridGutterWidth(1, 0)
		var_7_6:SetPixelGridGutterHeight(1, 0)
		var_7_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
		var_7_0:addElement(var_7_6)

		var_7_0.Gradient = var_7_6
	end

	local var_7_7

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_7_8 = LUI.UIImage.new()

		var_7_8.id = "WZWipBackground"

		var_7_8:SetAlpha(0.8, 0)
		var_7_8:setImage(RegisterMaterial("ui_mp_br_shared_button_loadout_background_ch2"), 0)
		var_7_8:Setup9SliceImage(_1080p * 10, _1080p * 10, 0.5000005, 0.4999998)
		var_7_0:addElement(var_7_8)

		var_7_0.WZWipBackground = var_7_8
	end

	local var_7_9
	local var_7_10 = LUI.UIImage.new()

	var_7_10.id = "BackgroundImage"

	var_7_10:SetAlpha(0, 0)
	var_7_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 2, _1080p * -2)
	var_7_0:addElement(var_7_10)

	var_7_0.BackgroundImage = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIImage.new()

	var_7_12.id = "AccessPeriodTextBacking"

	var_7_12:SetRGBFromTable(SWATCHES.CH2.CH2DarkBlue, 0)
	var_7_12:SetAlpha(0, 0)
	var_7_12:setImage(RegisterMaterial("menu_backer_redact_white"), 0)
	var_7_12:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -1, _1080p * -429, _1080p * -88, _1080p * -38)
	var_7_0:addElement(var_7_12)

	var_7_0.AccessPeriodTextBacking = var_7_12

	local var_7_13
	local var_7_14 = LUI.UIImage.new()

	var_7_14.id = "TopSep"

	var_7_14:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_7_14:SetAlpha(0.5, 0)
	var_7_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_7_0:addElement(var_7_14)

	var_7_0.TopSep = var_7_14

	local var_7_15
	local var_7_16 = LUI.UIImage.new()

	var_7_16.id = "BotSep"

	var_7_16:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_7_16:SetAlpha(0.5, 0)
	var_7_16:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_7_0:addElement(var_7_16)

	var_7_0.BotSep = var_7_16

	local var_7_17
	local var_7_18 = MenuBuilder.BuildRegisteredType("GenericBorderFrame", {
		controllerIndex = var_7_1
	})

	var_7_18.id = "FocusBorder"

	var_7_18:SetRGBFromTable(SWATCHES.CH2.CH2_Highlight, 0)
	var_7_18:SetAlpha(0, 0)
	var_7_18.Left:SetRight(_1080p * 4, 0)
	var_7_18.Right:SetLeft(_1080p * -4, 0)
	var_7_18.Top:SetBottom(_1080p * 4, 0)
	var_7_18.Bottom:SetTop(_1080p * -4, 0)
	var_7_18:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_7_0:addElement(var_7_18)

	var_7_0.FocusBorder = var_7_18

	local var_7_19
	local var_7_20 = LUI.UIStyledText.new()

	var_7_20.id = "AccessPeriodText"

	var_7_20:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_7_20:SetAlpha(0.8, 0)
	var_7_20:setText("", 0)
	var_7_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_20:SetAlignment(LUI.Alignment.Center)
	var_7_20:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -215, _1080p * 215, _1080p * -95, _1080p * -35)
	var_7_0:addElement(var_7_20)

	var_7_0.AccessPeriodText = var_7_20

	local var_7_21
	local var_7_22 = LUI.UIImage.new()

	var_7_22.id = "DisabledMask"

	var_7_22:SetRGBFromInt(3158064, 0)
	var_7_22:SetAlpha(0, 0)
	var_7_22:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 1, _1080p * 129)
	var_7_0:addElement(var_7_22)

	var_7_0.DisabledMask = var_7_22

	local function var_7_23()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_23

	local var_7_24
	local var_7_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_7_20:RegisterAnimationSequence("AR", var_7_25)

	local function var_7_26()
		var_7_20:AnimateSequence("AR")
	end

	var_7_0._sequences.AR = var_7_26

	local var_7_27
	local var_7_28 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("EventEnded", var_7_28)

	local var_7_29 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_20:RegisterAnimationSequence("EventEnded", var_7_29)

	local function var_7_30()
		var_7_12:AnimateSequence("EventEnded")
		var_7_20:AnimateSequence("EventEnded")
	end

	var_7_0._sequences.EventEnded = var_7_30

	local var_7_31
	local var_7_32 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_22:RegisterAnimationSequence("Disabled", var_7_32)

	local function var_7_33()
		var_7_22:AnimateSequence("Disabled")
	end

	var_7_0._sequences.Disabled = var_7_33

	local var_7_34
	local var_7_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("Hide", var_7_35)

	local var_7_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_20:RegisterAnimationSequence("Hide", var_7_36)

	local function var_7_37()
		var_7_12:AnimateSequence("Hide")
		var_7_20:AnimateSequence("Hide")
	end

	var_7_0._sequences.Hide = var_7_37

	local var_7_38
	local var_7_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("Show", var_7_39)

	local var_7_40 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_20:RegisterAnimationSequence("Show", var_7_40)

	local function var_7_41()
		var_7_12:AnimateSequence("Show")
		var_7_20:AnimateSequence("Show")
	end

	var_7_0._sequences.Show = var_7_41

	local var_7_42
	local var_7_43 = {
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

	var_7_20:RegisterAnimationSequence("Asian", var_7_43)

	local function var_7_44()
		var_7_20:AnimateSequence("Asian")
	end

	var_7_0._sequences.Asian = var_7_44

	var_0_3(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("PlaylistFeaturedCoundownTimer", PlaylistFeaturedCoundownTimer)
LockTable(_M)
