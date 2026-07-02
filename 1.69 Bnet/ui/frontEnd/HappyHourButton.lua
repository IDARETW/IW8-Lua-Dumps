module(..., package.seeall)

local var_0_0 = 60
local var_0_1 = var_0_0 * 60
local var_0_2 = 24 * var_0_1

local function var_0_3(arg_1_0, arg_1_1)
	if arg_1_1 ~= nil and arg_1_1 ~= arg_1_0._isLocked then
		arg_1_0:SetButtonDisabled(arg_1_1)

		if arg_1_0._isOver then
			arg_1_0:dispatchEventToChildren({
				name = arg_1_1 and "button_over_disable" or "button_over"
			})
		else
			arg_1_0:dispatchEventToChildren({
				name = arg_1_1 and "button_disable" or "button_up"
			})
		end

		arg_1_0._isLocked = arg_1_1
	end
end

local function var_0_4(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:SetLocked(arg_2_2)

	if arg_2_2 then
		arg_2_0.AccordionButton.DisabledText:setText(arg_2_1)
	else
		arg_2_0.HappyHourSetting:setText(arg_2_1)
	end
end

local function var_0_5(arg_3_0)
	local var_3_0 = Clans.CBJDIGCAED(arg_3_0._controllerIndex, arg_3_0._clanID)

	if var_3_0 and var_3_0.happyHour then
		local var_3_1 = Dvar.CFHDGABACF("NQOLNSNOSN")
		local var_3_2 = Engine.DEIDGHDBHD() - var_3_0.lastUpdateTime

		if var_3_2 <= var_3_1 then
			local var_3_3 = var_3_1 - var_3_2
			local var_3_4 = math.floor(var_3_3 / var_0_1)
			local var_3_5 = var_3_3 - var_3_4 * var_0_1
			local var_3_6 = math.floor(var_3_5 / var_0_0)
			local var_3_7 = var_3_5 - var_3_6 * var_0_0
			local var_3_8 = Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_STARTS_IN", var_3_4, var_3_6, var_3_7)

			arg_3_0:SetupButton(Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_LOCKED", var_3_8), true)
		else
			arg_3_0:SetLocked(false)
		end

		if var_3_0.secondsInHappyHour then
			local var_3_9 = var_3_0.secondsInHappyHour
			local var_3_10 = math.floor(var_3_9 / 60)
			local var_3_11 = var_3_9 - var_3_10 * 60
			local var_3_12 = Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_ENDS_TIMER", var_3_10, var_3_11)

			if arg_3_0._isLocked then
				arg_3_0.AccordionButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_LASTS_FOR", var_3_12))
			else
				arg_3_0:SetupButton(Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_LASTS_FOR", var_3_12))
				arg_3_0.AccordionButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_SETTING_DESC"))
			end

			arg_3_0.AccordionButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/DOUBLE_XP_HAPPY_HOUR"))
		else
			local var_3_13 = arg_3_0._hoursMapping[var_3_0.happyHour + 1]
			local var_3_14 = string.format("%02d", var_3_0.happyMinutes)
			local var_3_15

			if IsLanguageEnglish() then
				var_3_15 = Engine.CBBHFCGDIC(var_3_13[2], var_3_13[1], var_3_14)
			else
				var_3_15 = Engine.CBBHFCGDIC("LUA_MENU/FORMATTED_TIME", var_3_13, var_3_14)
			end

			if arg_3_0._isLocked then
				arg_3_0.AccordionButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_EVERYDAY_AT", var_3_15))
			else
				arg_3_0:SetupButton(Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_EVERYDAY_AT", var_3_15))
				arg_3_0.AccordionButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_SETTING_DESC"))
			end

			arg_3_0.AccordionButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CHANGE_HAPPY_HOUR"))
		end
	else
		arg_3_0:SetupButton(Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_NOT_SET"))
		arg_3_0.AccordionButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CHANGE_HAPPY_HOUR"))
		arg_3_0.AccordionButton.Description:setText(Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_SETTING_DESC"))
	end
end

local var_0_6

local function var_0_7(arg_4_0)
	arg_4_0:Wait(1000, true).onComplete = function()
		return var_0_7(arg_4_0)
	end

	if arg_4_0._clanID and arg_4_0._clanID ~= -1 then
		var_0_5(arg_4_0)
	end
end

local function var_0_8(arg_6_0, arg_6_1)
	arg_6_0._clanID = arg_6_1

	var_0_7(arg_6_0)
end

local function var_0_9(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.SetupButton = var_0_4
	arg_7_0.SetLocked = var_0_3
	arg_7_0.SetClanID = var_0_8
	arg_7_0._controllerIndex = arg_7_1
	arg_7_0._isLocked = false
	arg_7_0._isOver = false
	arg_7_0._hoursMapping = {}

	if IsLanguageEnglish() then
		local var_7_0 = "LUA_MENU/TIME_HOUR_AM"
		local var_7_1 = "LUA_MENU/TIME_HOUR_PM"

		arg_7_0._hoursMapping = {
			{
				"12",
				var_7_0
			},
			{
				"1",
				var_7_0
			},
			{
				"2",
				var_7_0
			},
			{
				"3",
				var_7_0
			},
			{
				"4",
				var_7_0
			},
			{
				"5",
				var_7_0
			},
			{
				"6",
				var_7_0
			},
			{
				"7",
				var_7_0
			},
			{
				"8",
				var_7_0
			},
			{
				"9",
				var_7_0
			},
			{
				"10",
				var_7_0
			},
			{
				"11",
				var_7_0
			},
			{
				"12",
				var_7_1
			},
			{
				"1",
				var_7_1
			},
			{
				"2",
				var_7_1
			},
			{
				"3",
				var_7_1
			},
			{
				"4",
				var_7_1
			},
			{
				"5",
				var_7_1
			},
			{
				"6",
				var_7_1
			},
			{
				"7",
				var_7_1
			},
			{
				"8",
				var_7_1
			},
			{
				"9",
				var_7_1
			},
			{
				"10",
				var_7_1
			},
			{
				"11",
				var_7_1
			}
		}
	else
		for iter_7_0 = 0, 23 do
			table.insert(arg_7_0._hoursMapping, string.format("%02d", iter_7_0))
		end
	end

	local function var_7_2(arg_8_0)
		arg_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p, 150)
		arg_8_0.AccordionButton:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p, 150)
	end

	local function var_7_3(arg_9_0)
		arg_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 50 * _1080p, 150)
		arg_9_0.AccordionButton:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 50 * _1080p, 150)
	end

	arg_7_0:addEventHandler("button_over", function(arg_10_0, arg_10_1)
		if LUI.IsLastInputMouseNavigation(arg_7_1) then
			ACTIONS.AnimateSequence(arg_10_0, "ButtonOverKBM")
			ACTIONS.AnimateSequence(arg_10_0.AccordionButton, "ButtonOverKBM")
		else
			ACTIONS.AnimateSequence(arg_10_0, "ButtonOver")
			ACTIONS.AnimateSequence(arg_10_0.AccordionButton, "ButtonOver")

			if IsLanguageArabic() then
				ACTIONS.AnimateSequence(arg_10_0.AccordionButton, "ButtonOverTitleAR")
			else
				ACTIONS.AnimateSequence(arg_10_0.AccordionButton, "ButtonOverTitle")
			end
		end

		var_7_2(arg_10_0)

		arg_10_0._isOver = true
	end)
	arg_7_0:addEventHandler("button_up", function(arg_11_0, arg_11_1)
		if not LUI.IsLastInputMouseNavigation(arg_7_1) then
			var_7_3(arg_11_0)
			ACTIONS.AnimateSequence(arg_11_0, "ButtonUp")
			ACTIONS.AnimateSequence(arg_11_0.AccordionButton, "ButtonUp")

			if IsLanguageArabic() then
				ACTIONS.AnimateSequence(arg_11_0.AccordionButton, "ButtonUpTitleAR")
			else
				ACTIONS.AnimateSequence(arg_11_0.AccordionButton, "ButtonUpTitle")
			end
		else
			ACTIONS.AnimateSequence(arg_11_0, "ButtonUpKBM")
			ACTIONS.AnimateSequence(arg_11_0.AccordionButton, "ButtonUpKBM")
		end

		arg_11_0._isOver = false
	end)
	arg_7_0:addEventHandler("button_over_disable", function(arg_12_0, arg_12_1)
		if not LUI.IsLastInputMouseNavigation(arg_7_1) then
			ACTIONS.AnimateSequence(arg_12_0, "ButtonOverDisabled")
			ACTIONS.AnimateSequence(arg_12_0.AccordionButton, "ButtonOverDisabled")

			if IsLanguageArabic() then
				ACTIONS.AnimateSequence(arg_12_0.AccordionButton, "ButtonOverTitleAR")
			else
				ACTIONS.AnimateSequence(arg_12_0.AccordionButton, "ButtonOverTitle")
			end
		else
			ACTIONS.AnimateSequence(arg_12_0, "ButtonOverDisabledKBM")
			ACTIONS.AnimateSequence(arg_12_0.AccordionButton, "ButtonOverDisabledKBM")
		end

		var_7_2(arg_12_0)

		arg_12_0._isOver = true
	end)
	arg_7_0:addEventHandler("button_disable", function(arg_13_0, arg_13_1)
		if not LUI.IsLastInputMouseNavigation(arg_7_1) then
			var_7_3(arg_13_0)
			ACTIONS.AnimateSequence(arg_13_0, "ButtonUpDisabled")
			ACTIONS.AnimateSequence(arg_13_0.AccordionButton, "ButtonUpDisabled")

			if IsLanguageArabic() then
				ACTIONS.AnimateSequence(arg_13_0.AccordionButton, "ButtonUpTitleAR")
			else
				ACTIONS.AnimateSequence(arg_13_0.AccordionButton, "ButtonUpTitle")
			end
		else
			ACTIONS.AnimateSequence(arg_13_0, "ButtonUpDisabledKBM")
			ACTIONS.AnimateSequence(arg_13_0.AccordionButton, "ButtonUpDisabledKBM")
		end

		arg_13_0._isOver = false
	end)
	arg_7_0:SetNotifyOnLayoutInit(true)
	arg_7_0:addEventHandler("layout_initialized", function(arg_14_0, arg_14_1)
		if LUI.IsLastInputMouseNavigation(arg_7_1) then
			if arg_14_0._isLocked then
				ACTIONS.AnimateSequence(arg_14_0, "ButtonUpDisabledKBM")
				ACTIONS.AnimateSequence(arg_14_0.AccordionButton, "ButtonUpDisabledKBM")
			else
				ACTIONS.AnimateSequence(arg_14_0, "ButtonUpKBM")
				ACTIONS.AnimateSequence(arg_14_0.AccordionButton, "ButtonUpKBM")
			end

			var_7_2(arg_14_0)
		end
	end)
	arg_7_0:addEventHandler("update_input_type", function(arg_15_0, arg_15_1)
		if LUI.IsLastInputMouseNavigation(arg_7_1) then
			if arg_15_0._isLocked then
				ACTIONS.AnimateSequence(arg_15_0, "ButtonUpDisabledKBM")
				ACTIONS.AnimateSequence(arg_15_0.AccordionButton, "ButtonUpDisabledKBM")
			else
				ACTIONS.AnimateSequence(arg_15_0, "ButtonUpKBM")
				ACTIONS.AnimateSequence(arg_15_0.AccordionButton, "ButtonUpKBM")
			end

			var_7_2(arg_15_0)
		elseif arg_15_0._isLocked then
			if arg_15_0._isOver then
				ACTIONS.AnimateSequence(arg_15_0, "ButtonOverDisabled")
				ACTIONS.AnimateSequence(arg_15_0.AccordionButton, "ButtonOverDisabled")
			else
				ACTIONS.AnimateSequence(arg_15_0, "ButtonUpDisabled")
				ACTIONS.AnimateSequence(arg_15_0.AccordionButton, "ButtonUpDisabled")
				var_7_3(arg_15_0)
			end
		elseif arg_15_0._isOver then
			ACTIONS.AnimateSequence(arg_15_0, "ButtonOver")
			ACTIONS.AnimateSequence(arg_15_0.AccordionButton, "ButtonOver")
		else
			var_7_3(arg_15_0)
			ACTIONS.AnimateSequence(arg_15_0, "ButtonUp")
			ACTIONS.AnimateSequence(arg_15_0.AccordionButton, "ButtonUp")
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_7_0, "AR")
	end
end

function HappyHourButton(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIButton.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p)

	var_16_0.id = "HappyHourButton"
	var_16_0._animationSets = var_16_0._animationSets or {}
	var_16_0._sequences = var_16_0._sequences or {}

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)

	local var_16_2 = var_16_0
	local var_16_3
	local var_16_4 = MenuBuilder.BuildRegisteredType("HappyHourAccordionButton", {
		controllerIndex = var_16_1
	})

	var_16_4.id = "AccordionButton"

	var_16_4.Text:setText("", 0)
	var_16_4.Description:setText("", 0)
	var_16_4.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_16_4.DisabledText:SetAnimMoveTime(2000)
	var_16_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 150)
	var_16_0:addElement(var_16_4)

	var_16_0.AccordionButton = var_16_4

	local var_16_5
	local var_16_6 = LUI.UIImage.new()

	var_16_6.id = "Backer"

	var_16_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_16_6:SetAlpha(0.2, 0)
	var_16_6:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 430, _1080p * -41, 0)
	var_16_0:addElement(var_16_6)

	var_16_0.Backer = var_16_6

	local var_16_7
	local var_16_8 = LUI.UIStyledText.new()

	var_16_8.id = "HappyHourSetting"

	var_16_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_16_8:setText("", 0)
	var_16_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_8:SetWordWrap(false)
	var_16_8:SetAlignment(LUI.Alignment.Left)
	var_16_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_16_8:SetStartupDelay(2000)
	var_16_8:SetLineHoldTime(400)
	var_16_8:SetAnimMoveTime(2000)
	var_16_8:SetAnimMoveSpeed(50)
	var_16_8:SetEndDelay(2000)
	var_16_8:SetCrossfadeTime(1000)
	var_16_8:SetFadeInTime(300)
	var_16_8:SetFadeOutTime(300)
	var_16_8:SetMaxVisibleLines(1)
	var_16_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 19, _1080p * 376, _1080p * -29, _1080p * -9)
	var_16_0:addElement(var_16_8)

	var_16_0.HappyHourSetting = var_16_8

	local var_16_9
	local var_16_10 = LUI.UIImage.new()

	var_16_10.id = "DoubleXPIcon"

	var_16_10:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_16_10:SetAlpha(0, 0)
	var_16_10:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_16_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 336, _1080p * 416, _1080p * 15, _1080p * 95)
	var_16_0:addElement(var_16_10)

	var_16_0.DoubleXPIcon = var_16_10

	local function var_16_11()
		return
	end

	var_16_0._sequences.DefaultSequence = var_16_11

	local var_16_12
	local var_16_13 = {
		{
			value = 0.2,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonOver", var_16_13)

	local var_16_14 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonOver", var_16_14)

	local function var_16_15()
		var_16_6:AnimateSequence("ButtonOver")
		var_16_8:AnimateSequence("ButtonOver")
	end

	var_16_0._sequences.ButtonOver = var_16_15

	local var_16_16
	local var_16_17 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonUp", var_16_17)

	local var_16_18 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUp", var_16_18)

	local function var_16_19()
		var_16_6:AnimateSequence("ButtonUp")
		var_16_8:AnimateSequence("ButtonUp")
	end

	var_16_0._sequences.ButtonUp = var_16_19

	local var_16_20
	local var_16_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonUpDisabled", var_16_21)

	local var_16_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUpDisabled", var_16_22)

	local function var_16_23()
		var_16_6:AnimateSequence("ButtonUpDisabled")
		var_16_8:AnimateSequence("ButtonUpDisabled")
	end

	var_16_0._sequences.ButtonUpDisabled = var_16_23

	local var_16_24
	local var_16_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonOverDisabled", var_16_25)

	local var_16_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonOverDisabled", var_16_26)

	local function var_16_27()
		var_16_6:AnimateSequence("ButtonOverDisabled")
		var_16_8:AnimateSequence("ButtonOverDisabled")
	end

	var_16_0._sequences.ButtonOverDisabled = var_16_27

	local var_16_28
	local var_16_29 = {
		{
			value = 0.2,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonOverKBM", var_16_29)

	local var_16_30 = {
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonOverKBM", var_16_30)

	local function var_16_31()
		var_16_6:AnimateSequence("ButtonOverKBM")
		var_16_8:AnimateSequence("ButtonOverKBM")
	end

	var_16_0._sequences.ButtonOverKBM = var_16_31

	local var_16_32
	local var_16_33 = {
		{
			value = 0.2,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonUpKBM", var_16_33)

	local var_16_34 = {
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUpKBM", var_16_34)

	local function var_16_35()
		var_16_6:AnimateSequence("ButtonUpKBM")
		var_16_8:AnimateSequence("ButtonUpKBM")
	end

	var_16_0._sequences.ButtonUpKBM = var_16_35

	local var_16_36
	local var_16_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonUpDisabledKBM", var_16_37)

	local var_16_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUpDisabledKBM", var_16_38)

	local function var_16_39()
		var_16_6:AnimateSequence("ButtonUpDisabledKBM")
		var_16_8:AnimateSequence("ButtonUpDisabledKBM")
	end

	var_16_0._sequences.ButtonUpDisabledKBM = var_16_39

	local var_16_40
	local var_16_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 59
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 416
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -6
		}
	}

	var_16_8:RegisterAnimationSequence("AR", var_16_41)

	local function var_16_42()
		var_16_8:AnimateSequence("AR")
	end

	var_16_0._sequences.AR = var_16_42

	var_0_9(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("HappyHourButton", HappyHourButton)
LockTable(_M)
