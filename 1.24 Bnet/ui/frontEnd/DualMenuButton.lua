module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.PlayMenuButton:Contract()

	local function var_1_0(arg_2_0)
		arg_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p, 150)
	end

	local function var_1_1(arg_3_0)
		arg_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 50 * _1080p, 150)
	end

	arg_1_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		if not LUI.IsLastInputMouseNavigation(arg_1_1) then
			var_1_0(arg_4_0)

			if IsLanguageArabic() then
				ACTIONS.AnimateSequence(arg_1_0, "ButtonOverAR")
			else
				ACTIONS.AnimateSequence(arg_4_0, "ButtonOver")
			end
		end
	end)
	arg_1_0:addEventHandler("button_up", function(arg_5_0, arg_5_1)
		var_1_1(arg_5_0)

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_1_0, "ButtonUpAR")
		else
			ACTIONS.AnimateSequence(arg_5_0, "ButtonUp")
		end
	end)
	arg_1_0:addEventHandler("button_over_disable", function(arg_6_0, arg_6_1)
		if not LUI.IsLastInputMouseNavigation(arg_1_1) then
			var_1_0(arg_6_0)

			if IsLanguageArabic() then
				ACTIONS.AnimateSequence(arg_1_0, "ButtonOverAR")
			else
				ACTIONS.AnimateSequence(arg_6_0, "ButtonOver")
			end
		end
	end)
	arg_1_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		var_1_1(arg_7_0)

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_1_0, "ButtonUpAR")
		else
			ACTIONS.AnimateSequence(arg_7_0, "ButtonUp")
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function DualMenuButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p)

	var_8_0.id = "DualMenuButton"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "PlayMenuButton"

	var_8_4.Text:setText("", 0)
	var_8_4.Description:setText("", 0)
	var_8_4.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_8_4.DisabledText:SetAnimMoveTime(2000)
	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.PlayMenuButton = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIStyledText.new()

	var_8_6.id = "DynamicText"

	var_8_6:SetRGBFromInt(8421504, 0)
	var_8_6:setText("", 0)
	var_8_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_6:SetAlignment(LUI.Alignment.Right)
	var_8_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_8_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_6:SetStartupDelay(1000)
	var_8_6:SetLineHoldTime(500)
	var_8_6:SetAnimMoveTime(500)
	var_8_6:SetAnimMoveSpeed(50)
	var_8_6:SetEndDelay(1000)
	var_8_6:SetCrossfadeTime(500)
	var_8_6:SetFadeInTime(300)
	var_8_6:SetFadeOutTime(300)
	var_8_6:SetMaxVisibleLines(1)
	var_8_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -179, _1080p * -18, _1080p * -9, _1080p * 9)
	var_8_0:addElement(var_8_6)

	var_8_0.DynamicText = var_8_6

	local function var_8_7()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_7

	local var_8_8
	local var_8_9 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -53
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -35
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOver", var_8_9)

	local function var_8_10()
		var_8_6:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_10

	local var_8_11
	local var_8_12 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUp", var_8_12)

	local function var_8_13()
		var_8_6:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_13

	local var_8_14
	local var_8_15 = {}

	var_8_4:RegisterAnimationSequence("Disabled", var_8_15)

	local var_8_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Disabled", var_8_16)

	local function var_8_17()
		var_8_4:AnimateSequence("Disabled")
		var_8_6:AnimateSequence("Disabled")
	end

	var_8_0._sequences.Disabled = var_8_17

	local var_8_18
	local var_8_19 = {}

	var_8_4:RegisterAnimationSequence("Enabled", var_8_19)

	local var_8_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Enabled", var_8_20)

	local function var_8_21()
		var_8_4:AnimateSequence("Enabled")
		var_8_6:AnimateSequence("Enabled")
	end

	var_8_0._sequences.Enabled = var_8_21

	local var_8_22
	local var_8_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -215
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -412
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_8_6:RegisterAnimationSequence("AR", var_8_23)

	local function var_8_24()
		var_8_6:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_24

	local var_8_25
	local var_8_26 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUpAR", var_8_26)

	local function var_8_27()
		var_8_6:AnimateSequence("ButtonUpAR")
	end

	var_8_0._sequences.ButtonUpAR = var_8_27

	local var_8_28
	local var_8_29 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -28
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -58
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOverAR", var_8_29)

	local function var_8_30()
		var_8_6:AnimateSequence("ButtonOverAR")
	end

	var_8_0._sequences.ButtonOverAR = var_8_30

	var_8_0:addEventHandler("disable", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "Disabled")
	end)
	var_8_0:addEventHandler("enable", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "Enabled")
	end)
	var_0_0(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("DualMenuButton", DualMenuButton)
LockTable(_M)
