module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.CategoryName:SetFont(FONTS.GetFont(arg_1_1 and FONTS.MainBold.File or FONTS.MainRegular.File))
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(arg_2_1 and arg_2_1.animSequence, "You must specify an animation.")

	if arg_2_0._lastState ~= arg_2_1.animSequence then
		arg_2_0._lastState = arg_2_1.animSequence

		arg_2_0:ToggleFont(arg_2_1.focused)
		ACTIONS.AnimateSequence(arg_2_0, arg_2_1.animSequence)
	end
end

local function var_0_2(arg_3_0)
	LAYOUT.SizeTextBackingSizeToText(arg_3_0, {
		useEvenPadding = true,
		padding = 15,
		textfield = arg_3_0.AccessPeriodText,
		textfieldBackingImage = arg_3_0.AccessPeriodTextBacking,
		forceAlignRight = arg_3_0._isArabic
	})
end

local function var_0_3(arg_4_0, arg_4_1)
	assert(arg_4_1 and type(arg_4_1) == "table", "You must provide the data for this event as type 'table'.")

	arg_4_0._showAccessPeriodTimer = false

	if not arg_4_1.ignoreCountdownTimer and arg_4_1.accessPeriod then
		local var_4_0 = Engine.CCEJJCCDEG(arg_4_1.accessPeriod)

		if var_4_0 ~= nil and var_4_0 > 0 then
			arg_4_0._showAccessPeriodTimer = true
		end
	end

	if arg_4_0._showAccessPeriodTimer then
		TIME.SetCountDownTimerTextField(arg_4_0.AccessPeriodText, tonumber(arg_4_1.accessPeriod), {
			useCustomDisplay = true,
			broadcastOnComplete = true,
			customFormatString = "SEASONS/EVENT_COUNTDOWN_DAYS_HOURS"
		})
		arg_4_0.AccessPeriodText:addEventHandler(TIME.TIMER_TICK, function(arg_5_0, arg_5_1)
			local var_5_0 = arg_5_1.intervals.days == 0
			local var_5_1 = arg_5_0:getParent()

			if var_5_0 then
				if arg_5_1.intervals.hours == 0 then
					arg_5_0:setText(Engine.CBBHFCGDIC("SEASONS/EVENT_COUNTDOWN_MINUTES_SECONDS", arg_5_1.intervals.minutes, arg_5_1.intervals.seconds))

					if not var_5_1._inMinutesAndSeconds then
						var_5_1._inMinutesAndSeconds = true

						var_5_1:UpdateTimerBackingSize()
					end
				else
					arg_5_0:setText(Engine.CBBHFCGDIC("SEASONS/EVENT_COUNTDOWN_HOURS_MINUTES", arg_5_1.intervals.hours, arg_5_1.intervals.minutes))

					if not var_5_1._inHoursAndMinutes then
						var_5_1._inHoursAndMinutes = true

						var_5_1:UpdateTimerBackingSize()
					end
				end
			else
				arg_5_0:setText(Engine.CBBHFCGDIC("SEASONS/EVENT_COUNTDOWN_DAYS_HOURS", arg_5_1.intervals.days, arg_5_1.intervals.hours))

				if not var_5_1._inDaysAndHours then
					var_5_1._inDaysAndHours = true

					var_5_1:UpdateTimerBackingSize()
				end
			end
		end)
		arg_4_0.AccessPeriodText:addEventHandler(TIME.TIMER_COMPLETE, function(arg_6_0, arg_6_1)
			local var_6_0 = arg_6_0:getParent()

			arg_6_0:setText(Engine.CBBHFCGDIC(arg_6_1.disabledText or "LUA_MENU/WZ_EVENT_PLAYLIST_DISABLED"))
			var_6_0:RefreshAnimation({
				animSequence = "EventEnded"
			})

			var_6_0.disabled = true
		end)
		ACTIONS.AnimateSequence(arg_4_0, "Show")
	else
		arg_4_0.AccessPeriodText:SetAlpha(0)
		arg_4_0.AccessPeriodTextBacking:SetAlpha(0)
	end

	arg_4_0.BackgroundImage:setImage(RegisterMaterial(arg_4_1.background))
	arg_4_0.CategoryName:setText(Engine.CBBHFCGDIC(arg_4_1.categoryName))
	arg_4_0.Description:setText(Engine.CBBHFCGDIC(arg_4_1.description))

	if arg_4_1.koreaDisabled and arg_4_1.koreaDisabled == "1" and (Engine.FABABBDBA() or Engine.DIEEIEFCFF()) then
		arg_4_0.disabled = true

		ACTIONS.AnimateSequence(arg_4_0, "Disabled")
	end
end

local function var_0_4(arg_7_0, arg_7_1, arg_7_2)
	assert(arg_7_2.eventData and type(arg_7_2.eventData) == "table", "You must provide the data for this event as type 'table'.")

	arg_7_0.RefreshAnimation = var_0_1
	arg_7_0.ToggleFont = var_0_0
	arg_7_0.UpdateTimerBackingSize = var_0_2
	arg_7_0.SetEventInfo = var_0_3
	arg_7_0._inDaysAndHours = false
	arg_7_0._inMinutesAndSeconds = false
	arg_7_0._inHoursAndMinutes = false
	arg_7_0._isArabic = IsLanguageArabic()

	ACTIONS.AnimateSequence(arg_7_0, "Hide")
	var_0_3(arg_7_0, arg_7_2.eventData)
	arg_7_0:addEventHandler("button_over", function(arg_8_0, arg_8_1)
		arg_7_0:RefreshAnimation({
			focused = true,
			animSequence = "ButtonOver"
		})

		if arg_7_0._showAccessPeriodTimer then
			arg_7_0:RefreshAnimation({
				focused = true,
				animSequence = "AccessPeriodButtonOver"
			})
		end
	end)
	arg_7_0:addEventHandler("button_up", function(arg_9_0, arg_9_1)
		arg_7_0:RefreshAnimation({
			animSequence = "ButtonUp"
		})

		if arg_7_0._showAccessPeriodTimer then
			arg_7_0:RefreshAnimation({
				focused = true,
				animSequence = "AccessPeriodButtonUp"
			})
		end
	end)
	arg_7_0:SetMask(arg_7_0.Mask)

	if arg_7_2.eventData.themeColorSwatch then
		assert(type(arg_7_2.eventData.themeColorSwatch) == "string", "The swatch must be a string reference to a path in Swatches.lua table.")

		local var_7_0 = GetSwatchIntColor(nil, arg_7_2.eventData.themeColorSwatch)

		assert(var_7_0, "Could not find a valid swatch from the path " .. arg_7_2.eventData.themeColorSwatch .. ". Please review your themeColorSwatch entry in br_playlist_events.csv.")
		assert(arg_7_0.LiveTag.TextBacking, "PlaylistFeaturedEventButton -> PostLoadFunc -> self.LiveTag.TextBacking is nil, but expected to be a valid element")
		LUI.ApplySwatchToWidgets({
			widgetsToApplySwatch = {
				arg_7_0.LiveTag.TextBacking,
				arg_7_0.FocusBorder,
				arg_7_0.CategoryName
			},
			swatchInt = var_7_0
		})
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_7_0, "AR")
	end

	arg_7_0:UpdateTimerBackingSize()
end

function PlaylistFeaturedEventButton(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIButton.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 130 * _1080p)

	var_10_0.id = "PlaylistFeaturedEventButton"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_10_4 = LUI.UIImage.new()

		var_10_4.id = "TextureLayer"

		var_10_4:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
		var_10_4:SetAlpha(0.1, 0)
		var_10_4:SetPixelGridEnabled(true)
		var_10_4:SetPixelGridContrast(0.8, 0)
		var_10_4:SetPixelGridBlockWidth(2, 0)
		var_10_4:SetPixelGridBlockHeight(2, 0)
		var_10_4:SetPixelGridGutterWidth(1, 0)
		var_10_4:SetPixelGridGutterHeight(1, 0)
		var_10_4:setImage(RegisterMaterial("ui_default_white"), 0)
		var_10_0:addElement(var_10_4)

		var_10_0.TextureLayer = var_10_4
	end

	local var_10_5

	if not CONDITIONS.IsWZWipDvarEnabled() then
		local var_10_6 = LUI.UIImage.new()

		var_10_6.id = "Gradient"

		var_10_6:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
		var_10_6:SetAlpha(0, 0)
		var_10_6:SetPixelGridEnabled(true)
		var_10_6:SetPixelGridContrast(0.2, 0)
		var_10_6:SetPixelGridBlockWidth(2, 0)
		var_10_6:SetPixelGridBlockHeight(2, 0)
		var_10_6:SetPixelGridGutterWidth(1, 0)
		var_10_6:SetPixelGridGutterHeight(1, 0)
		var_10_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
		var_10_0:addElement(var_10_6)

		var_10_0.Gradient = var_10_6
	end

	local var_10_7

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_10_8 = LUI.UIImage.new()

		var_10_8.id = "WZWipBackground"

		var_10_8:setImage(RegisterMaterial("ui_mp_br_shared_button_loadout_background_ch2"), 0)
		var_10_8:Setup9SliceImage(_1080p * 10, _1080p * 10, 0.5000005, 0.4999998)
		var_10_0:addElement(var_10_8)

		var_10_0.WZWipBackground = var_10_8
	end

	local var_10_9
	local var_10_10 = LUI.UIImage.new()

	var_10_10.id = "BackgroundImage"

	var_10_10:SetAlpha(0.5, 0)
	var_10_10:setImage(RegisterMaterial("ui_mp_br_button_image_seasonal"), 0)
	var_10_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 2, _1080p * -2)
	var_10_0:addElement(var_10_10)

	var_10_0.BackgroundImage = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIImage.new()

	var_10_12.id = "Mask"

	var_10_12:setImage(RegisterMaterial("ui_mp_wz_bkg_button_2"), 0)
	var_10_0:addElement(var_10_12)

	var_10_0.Mask = var_10_12

	local var_10_13
	local var_10_14 = LUI.UIStyledText.new()

	var_10_14.id = "CategoryName"

	var_10_14:SetRGBFromTable(SWATCHES.CH2.CH2_Highlight, 0)
	var_10_14:SetAlpha(0.8, 0)
	var_10_14:setText(ToUpperCase(""), 0)
	var_10_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_14:SetWordWrap(false)
	var_10_14:SetAlignment(LUI.Alignment.Left)
	var_10_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_14:SetStartupDelay(2000)
	var_10_14:SetLineHoldTime(400)
	var_10_14:SetAnimMoveTime(2000)
	var_10_14:SetAnimMoveSpeed(150)
	var_10_14:SetEndDelay(2000)
	var_10_14:SetCrossfadeTime(250)
	var_10_14:SetFadeInTime(300)
	var_10_14:SetFadeOutTime(300)
	var_10_14:SetMaxVisibleLines(1)
	var_10_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 15, _1080p * 415, _1080p * 13, _1080p * 43)
	var_10_0:addElement(var_10_14)

	var_10_0.CategoryName = var_10_14

	local var_10_15
	local var_10_16 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_10_1
	})

	var_10_16.id = "NewItemSmallIcon"

	var_10_16:SetAlpha(0, 0)
	var_10_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 405, _1080p * 413, _1080p * 36, _1080p * 44)
	var_10_0:addElement(var_10_16)

	var_10_0.NewItemSmallIcon = var_10_16

	local var_10_17
	local var_10_18 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_10_1
	})

	var_10_18.id = "NewItemNotification"

	var_10_18:SetAlpha(0, 0)
	var_10_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 343, _1080p * 421, _1080p * 25, _1080p * 55)
	var_10_0:addElement(var_10_18)

	var_10_0.NewItemNotification = var_10_18

	local var_10_19
	local var_10_20 = LUI.UIStyledText.new()

	var_10_20.id = "Description"

	var_10_20:SetAlpha(0.8, 0)
	var_10_20:setText("", 0)
	var_10_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_20:SetAlignment(LUI.Alignment.Left)
	var_10_20:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_10_20:SetStartupDelay(2000)
	var_10_20:SetLineHoldTime(2000)
	var_10_20:SetAnimMoveTime(1000)
	var_10_20:SetAnimMoveSpeed(150)
	var_10_20:SetEndDelay(2000)
	var_10_20:SetCrossfadeTime(1000)
	var_10_20:SetFadeInTime(300)
	var_10_20:SetFadeOutTime(300)
	var_10_20:SetMaxVisibleLines(2)
	var_10_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 15, _1080p * 415, _1080p * 45, _1080p * 65)
	var_10_0:addElement(var_10_20)

	var_10_0.Description = var_10_20

	local var_10_21
	local var_10_22 = LUI.UIStyledText.new()

	var_10_22.id = "DisabledText"

	var_10_22:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_10_22:SetAlpha(0, 0)
	var_10_22:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_10_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_22:SetWordWrap(false)
	var_10_22:SetAlignment(LUI.Alignment.Left)
	var_10_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_22:SetStartupDelay(2000)
	var_10_22:SetLineHoldTime(400)
	var_10_22:SetAnimMoveTime(2000)
	var_10_22:SetAnimMoveSpeed(150)
	var_10_22:SetEndDelay(2000)
	var_10_22:SetCrossfadeTime(1000)
	var_10_22:SetFadeInTime(300)
	var_10_22:SetFadeOutTime(300)
	var_10_22:SetMaxVisibleLines(1)
	var_10_22:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 376, _1080p * 37, _1080p * 57)
	var_10_0:addElement(var_10_22)

	var_10_0.DisabledText = var_10_22

	local var_10_23
	local var_10_24 = LUI.UIImage.new()

	var_10_24.id = "AccessPeriodTextBacking"

	var_10_24:SetRGBFromTable(SWATCHES.CH2.CH2DarkBlue, 0)
	var_10_24:SetAlpha(0.8, 0)
	var_10_24:setImage(RegisterMaterial("menu_backer_redact_white"), 0)
	var_10_24:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 94, _1080p * 406, _1080p * -35, _1080p * -9)
	var_10_0:addElement(var_10_24)

	var_10_0.AccessPeriodTextBacking = var_10_24

	local var_10_25
	local var_10_26 = LUI.UIStyledText.new()

	var_10_26.id = "AccessPeriodText"

	var_10_26:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_10_26:SetAlpha(0.8, 0)
	var_10_26:setText("", 0)
	var_10_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_26:SetAlignment(LUI.Alignment.Left)
	var_10_26:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 104, _1080p * 395, _1080p * -33, _1080p * -13)
	var_10_0:addElement(var_10_26)

	var_10_0.AccessPeriodText = var_10_26

	local var_10_27
	local var_10_28 = LUI.UIImage.new()

	var_10_28.id = "TopSep"

	var_10_28:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_10_28:SetAlpha(0.5, 0)
	var_10_28:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_10_0:addElement(var_10_28)

	var_10_0.TopSep = var_10_28

	local var_10_29
	local var_10_30 = LUI.UIImage.new()

	var_10_30.id = "BotSep"

	var_10_30:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_10_30:SetAlpha(0.5, 0)
	var_10_30:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_10_0:addElement(var_10_30)

	var_10_0.BotSep = var_10_30

	local var_10_31
	local var_10_32 = MenuBuilder.BuildRegisteredType("GenericBorderFrame", {
		controllerIndex = var_10_1
	})

	var_10_32.id = "FocusBorder"

	var_10_32:SetRGBFromTable(SWATCHES.CH2.CH2_Highlight, 0)
	var_10_32:SetAlpha(0, 0)
	var_10_32.Left:SetRight(_1080p * 4, 0)
	var_10_32.Right:SetLeft(_1080p * -4, 0)
	var_10_32.Top:SetBottom(_1080p * 4, 0)
	var_10_32.Bottom:SetTop(_1080p * -4, 0)
	var_10_32:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_10_0:addElement(var_10_32)

	var_10_0.FocusBorder = var_10_32

	local var_10_33
	local var_10_34 = LUI.UIImage.new()

	var_10_34.id = "DisabledMask"

	var_10_34:SetRGBFromInt(3158064, 0)
	var_10_34:SetAlpha(0, 0)
	var_10_34:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 1, _1080p * 129)
	var_10_0:addElement(var_10_34)

	var_10_0.DisabledMask = var_10_34

	local var_10_35
	local var_10_36 = MenuBuilder.BuildRegisteredType("SeasonalEventLiveTag", {
		controllerIndex = var_10_1
	})

	var_10_36.id = "LiveTag"

	var_10_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 85, _1080p * 95, _1080p * 119)
	var_10_0:addElement(var_10_36)

	var_10_0.LiveTag = var_10_36

	local function var_10_37()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_37

	local var_10_38
	local var_10_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 59
		}
	}

	var_10_14:RegisterAnimationSequence("AR", var_10_39)

	local var_10_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 61
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 85
		}
	}

	var_10_20:RegisterAnimationSequence("AR", var_10_40)

	local var_10_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -376
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -24
		}
	}

	var_10_24:RegisterAnimationSequence("AR", var_10_41)

	local var_10_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -12
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -365
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_10_26:RegisterAnimationSequence("AR", var_10_42)

	local function var_10_43()
		var_10_14:AnimateSequence("AR")
		var_10_20:AnimateSequence("AR")
		var_10_24:AnimateSequence("AR")
		var_10_26:AnimateSequence("AR")
	end

	var_10_0._sequences.AR = var_10_43

	local var_10_44
	local var_10_45 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonOver", var_10_45)

	local var_10_46 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ButtonOver", var_10_46)

	local var_10_47 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_20:RegisterAnimationSequence("ButtonOver", var_10_47)

	local var_10_48 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_28:RegisterAnimationSequence("ButtonOver", var_10_48)

	local var_10_49 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_30:RegisterAnimationSequence("ButtonOver", var_10_49)

	local var_10_50 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_32:RegisterAnimationSequence("ButtonOver", var_10_50)

	local var_10_51 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			child = var_10_0.LiveTag.Text
		}
	}

	var_10_36:RegisterAnimationSequence("ButtonOver", var_10_51)

	local function var_10_52()
		var_10_10:AnimateSequence("ButtonOver")
		var_10_14:AnimateSequence("ButtonOver")
		var_10_20:AnimateSequence("ButtonOver")
		var_10_28:AnimateSequence("ButtonOver")
		var_10_30:AnimateSequence("ButtonOver")
		var_10_32:AnimateSequence("ButtonOver")
		var_10_36:AnimateSequence("ButtonOver")
	end

	var_10_0._sequences.ButtonOver = var_10_52

	local var_10_53
	local var_10_54 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonUp", var_10_54)

	local var_10_55 = {
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ButtonUp", var_10_55)

	local var_10_56 = {
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_20:RegisterAnimationSequence("ButtonUp", var_10_56)

	local var_10_57 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_28:RegisterAnimationSequence("ButtonUp", var_10_57)

	local var_10_58 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_30:RegisterAnimationSequence("ButtonUp", var_10_58)

	local var_10_59 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_32:RegisterAnimationSequence("ButtonUp", var_10_59)

	local var_10_60 = {
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			child = var_10_0.LiveTag.Text
		}
	}

	var_10_36:RegisterAnimationSequence("ButtonUp", var_10_60)

	local function var_10_61()
		var_10_10:AnimateSequence("ButtonUp")
		var_10_14:AnimateSequence("ButtonUp")
		var_10_20:AnimateSequence("ButtonUp")
		var_10_28:AnimateSequence("ButtonUp")
		var_10_30:AnimateSequence("ButtonUp")
		var_10_32:AnimateSequence("ButtonUp")
		var_10_36:AnimateSequence("ButtonUp")
	end

	var_10_0._sequences.ButtonUp = var_10_61

	local var_10_62
	local var_10_63 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_24:RegisterAnimationSequence("EventEnded", var_10_63)

	local var_10_64 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_26:RegisterAnimationSequence("EventEnded", var_10_64)

	local function var_10_65()
		var_10_24:AnimateSequence("EventEnded")
		var_10_26:AnimateSequence("EventEnded")
	end

	var_10_0._sequences.EventEnded = var_10_65

	local var_10_66
	local var_10_67 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_34:RegisterAnimationSequence("Disabled", var_10_67)

	local function var_10_68()
		var_10_34:AnimateSequence("Disabled")
	end

	var_10_0._sequences.Disabled = var_10_68

	local var_10_69
	local var_10_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_24:RegisterAnimationSequence("Hide", var_10_70)

	local var_10_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_26:RegisterAnimationSequence("Hide", var_10_71)

	local function var_10_72()
		var_10_24:AnimateSequence("Hide")
		var_10_26:AnimateSequence("Hide")
	end

	var_10_0._sequences.Hide = var_10_72

	local var_10_73
	local var_10_74 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_24:RegisterAnimationSequence("Show", var_10_74)

	local var_10_75 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_26:RegisterAnimationSequence("Show", var_10_75)

	local function var_10_76()
		var_10_24:AnimateSequence("Show")
		var_10_26:AnimateSequence("Show")
	end

	var_10_0._sequences.Show = var_10_76

	local var_10_77
	local var_10_78 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_24:RegisterAnimationSequence("AccessPeriodButtonOver", var_10_78)

	local var_10_79 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_26:RegisterAnimationSequence("AccessPeriodButtonOver", var_10_79)

	local function var_10_80()
		var_10_24:AnimateSequence("AccessPeriodButtonOver")
		var_10_26:AnimateSequence("AccessPeriodButtonOver")
	end

	var_10_0._sequences.AccessPeriodButtonOver = var_10_80

	local var_10_81
	local var_10_82 = {
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_24:RegisterAnimationSequence("AccessPeriodButtonUp", var_10_82)

	local var_10_83 = {
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_26:RegisterAnimationSequence("AccessPeriodButtonUp", var_10_83)

	local function var_10_84()
		var_10_24:AnimateSequence("AccessPeriodButtonUp")
		var_10_26:AnimateSequence("AccessPeriodButtonUp")
	end

	var_10_0._sequences.AccessPeriodButtonUp = var_10_84

	var_0_4(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("PlaylistFeaturedEventButton", PlaylistFeaturedEventButton)
LockTable(_M)
