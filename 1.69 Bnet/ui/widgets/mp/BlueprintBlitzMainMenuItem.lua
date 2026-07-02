module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = tonumber(arg_1_1._eventAccessPeriod)

	TIME.SetCountDownTimerTextField(arg_1_0.Timer, var_1_0, {
		useCustomDisplay = true,
		broadcastOnComplete = true,
		customFormatString = "LUA_MENU_MP/DAYS_HOURS_MINUTES"
	})
	arg_1_0.Timer:addEventHandler(TIME.TIMER_TICK, function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_1.intervals.days == 0
		local var_2_1 = arg_2_0:getParent()
		local var_2_2 = arg_2_1.intervals.minutes + 1

		if var_2_0 then
			if arg_2_1.intervals.hours == 0 then
				arg_2_0:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MINUTES", var_2_2))

				if not var_2_1._inMinutesAndSeconds then
					var_2_1._inMinutesAndSeconds = true
				end
			else
				arg_2_0:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/HOURS_MINUTES", arg_2_1.intervals.hours, var_2_2))

				if not var_2_1._inHoursAndMinutes then
					var_2_1._inHoursAndMinutes = true
				end
			end
		else
			arg_2_0:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/DAYS_HOURS_MINUTES", arg_2_1.intervals.days, arg_2_1.intervals.hours, var_2_2))

			if not var_2_1._inDaysAndHours then
				var_2_1._inDaysAndHours = true
			end
		end
	end)
	arg_1_0.Timer:addEventHandler(TIME.TIMER_COMPLETE, function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_0:getParent()

		ACTIONS.AnimateSequence(var_3_0, "Hide")

		var_3_0.disabled = true
	end)
	ACTIONS.AnimateSequence(arg_1_0, "Show")
end

local function var_0_1(arg_4_0, arg_4_1)
	local var_4_0 = Dvar.DHEEJCCJBH("scr_br_bblitz_event_period_utc")

	if var_4_0 then
		arg_4_1._eventAccessPeriod = var_4_0

		var_0_0(arg_4_0, arg_4_1)
	end
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._inDaysAndHours = false
	arg_5_0._inMinutesAndSeconds = false
	arg_5_0._inHoursAndMinutes = false

	var_0_1(arg_5_0, arg_5_2)
end

function BlueprintBlitzMainMenuItem(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 157 * _1080p)

	var_6_0.id = "BlueprintBlitzMainMenuItem"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0

	var_6_0:setUseStencil(true)

	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "background"

	var_6_4:SetAlpha(0.5, 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 157)
	var_6_0:addElement(var_6_4)

	var_6_0.background = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "CategoryIcon"

	var_6_6:SetScale(-0.45, 0)
	var_6_6:setImage(RegisterMaterial("ui_mp_br_ping_icon_mission_extraction"), 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 69, _1080p * -4, _1080p * 62)
	var_6_0:addElement(var_6_6)

	var_6_0.CategoryIcon = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIStyledText.new()

	var_6_8.id = "Description"

	var_6_8:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_6_8:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/BLUEPRINT_BLITZ_DESC"), 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_8:SetAlignment(LUI.Alignment.Left)
	var_6_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_6_8:SetStartupDelay(1000)
	var_6_8:SetLineHoldTime(400)
	var_6_8:SetAnimMoveTime(150)
	var_6_8:SetAnimMoveSpeed(50)
	var_6_8:SetEndDelay(1000)
	var_6_8:SetCrossfadeTime(400)
	var_6_8:SetFadeInTime(300)
	var_6_8:SetFadeOutTime(300)
	var_6_8:SetMaxVisibleLines(6)
	var_6_8:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 66, _1080p * 417, _1080p * 43, _1080p * 63)
	var_6_0:addElement(var_6_8)

	var_6_0.Description = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIImage.new()

	var_6_10.id = "lineDivider"

	var_6_10:SetRGBFromTable(SWATCHES.CH2.TabMenuNoFocus, 0)
	var_6_10:SetAlpha(0.65, 0)
	var_6_10:setImage(RegisterMaterial("line_dot_ch2"), 0)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 424, _1080p * 32, _1080p * 34)
	var_6_0:addElement(var_6_10)

	var_6_0.lineDivider = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIStyledText.new()

	var_6_12.id = "subTitle"

	var_6_12:SetRGBFromTable(SWATCHES.MainMenu.IGRBonusText, 0)
	var_6_12:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/BLUEPRINT_BLITZ_SUBTITLE"), 0)
	var_6_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_12:SetAlignment(LUI.Alignment.Left)
	var_6_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_12:SetStartupDelay(1000)
	var_6_12:SetLineHoldTime(400)
	var_6_12:SetAnimMoveTime(150)
	var_6_12:SetAnimMoveSpeed(50)
	var_6_12:SetEndDelay(1000)
	var_6_12:SetCrossfadeTime(400)
	var_6_12:SetFadeInTime(300)
	var_6_12:SetFadeOutTime(300)
	var_6_12:SetMaxVisibleLines(1)
	var_6_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 66, _1080p * 329, _1080p * 9, _1080p * 33)
	var_6_0:addElement(var_6_12)

	var_6_0.subTitle = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIStyledText.new()

	var_6_14.id = "Title"

	var_6_14:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_6_14:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/BLUEPRINT_BLITZ_TITLE"), 0)
	var_6_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_14:SetAlignment(LUI.Alignment.Left)
	var_6_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 64, _1080p * 324, _1080p * 4, _1080p * 28)
	var_6_0:addElement(var_6_14)

	var_6_0.Title = var_6_14

	local var_6_15
	local var_6_16 = LUI.UIStyledText.new()

	var_6_16.id = "Timer"

	var_6_16:SetRGBFromTable(SWATCHES.genericMenu.wzTitle, 0)
	var_6_16:setText("", 0)
	var_6_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_16:SetWordWrap(false)
	var_6_16:SetAlignment(LUI.Alignment.Right)
	var_6_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -154, _1080p * -6, _1080p * 9, _1080p * 29)
	var_6_0:addElement(var_6_16)

	var_6_0.Timer = var_6_16

	local function var_6_17()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_17

	local var_6_18
	local var_6_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 63
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 91
		}
	}

	var_6_8:RegisterAnimationSequence("AR", var_6_19)

	local function var_6_20()
		var_6_8:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_20

	local function var_6_21()
		return
	end

	var_6_0._sequences.Complete = var_6_21

	local function var_6_22()
		return
	end

	var_6_0._sequences.Incomplete = var_6_22

	local var_6_23
	local var_6_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("Hide", var_6_24)

	local var_6_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Hide", var_6_25)

	local var_6_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Hide", var_6_26)

	local var_6_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("Hide", var_6_27)

	local var_6_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("Hide", var_6_28)

	local var_6_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("Hide", var_6_29)

	local var_6_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("Hide", var_6_30)

	local function var_6_31()
		var_6_4:AnimateSequence("Hide")
		var_6_6:AnimateSequence("Hide")
		var_6_8:AnimateSequence("Hide")
		var_6_10:AnimateSequence("Hide")
		var_6_12:AnimateSequence("Hide")
		var_6_14:AnimateSequence("Hide")
		var_6_16:AnimateSequence("Hide")
	end

	var_6_0._sequences.Hide = var_6_31

	local var_6_32
	local var_6_33 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("Show", var_6_33)

	local var_6_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 59
		}
	}

	var_6_6:RegisterAnimationSequence("Show", var_6_34)

	local var_6_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 51
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 71
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 403
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		}
	}

	var_6_8:RegisterAnimationSequence("Show", var_6_35)

	local var_6_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 41
		}
	}

	var_6_10:RegisterAnimationSequence("Show", var_6_36)

	local var_6_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 283
		}
	}

	var_6_12:RegisterAnimationSequence("Show", var_6_37)

	local var_6_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 35
		}
	}

	var_6_14:RegisterAnimationSequence("Show", var_6_38)

	local var_6_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -150
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -9
		}
	}

	var_6_16:RegisterAnimationSequence("Show", var_6_39)

	local function var_6_40()
		var_6_4:AnimateSequence("Show")
		var_6_6:AnimateSequence("Show")
		var_6_8:AnimateSequence("Show")
		var_6_10:AnimateSequence("Show")
		var_6_12:AnimateSequence("Show")
		var_6_14:AnimateSequence("Show")
		var_6_16:AnimateSequence("Show")
	end

	var_6_0._sequences.Show = var_6_40

	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("BlueprintBlitzMainMenuItem", BlueprintBlitzMainMenuItem)
LockTable(_M)
