module(..., package.seeall)

local var_0_0 = 2000

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_1 then
		arg_1_0._waitTime = arg_1_1
	end

	arg_1_0:SetButtonDisabled(true)
	arg_1_0.GenericProgressBar:SetAlpha(1, 0)
	arg_1_0.GenericProgressBar:SetProgress(0, 0)
	arg_1_0.GenericProgressBar:SetProgress(1, arg_1_0._waitTime)

	local var_1_0

	local function var_1_1()
		arg_1_0.GenericProgressBar:SetAlpha(0, 100)
		arg_1_0:SetButtonDisabled(false)

		if arg_1_2 then
			arg_1_0:dispatchEventToCurrentMenu({
				name = "timer_complete",
				controller = controllerIndex
			})
		end
	end

	if arg_1_0._waitTime and arg_1_0._waitTime > 0 then
		arg_1_0:Wait(arg_1_0._waitTime, true).onComplete = var_1_1
	else
		var_1_1()
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	assert(arg_3_0.Text)
	arg_3_0.Text:setText(arg_3_1)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_0._lastState ~= arg_4_1 then
		arg_4_0._lastState = arg_4_1

		if arg_4_2 then
			assert(arg_4_0._sequences and arg_4_0._sequences[arg_4_1 .. "Snap"])
			ACTIONS.AnimateSequence(arg_4_0, arg_4_1 .. "Snap")
		else
			ACTIONS.AnimateSequence(arg_4_0, arg_4_1)
		end
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.StartTimer = var_0_1
	arg_5_0.SetText = var_0_2
	arg_5_0._waitTime = var_0_0

	arg_5_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		var_0_3(arg_6_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOver"))
	end)
	arg_5_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		var_0_3(arg_7_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUp"), arg_7_1.snap)
	end)
	arg_5_0:addEventHandler("button_disable", function(arg_8_0, arg_8_1)
		var_0_3(arg_8_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUpDisabled"), arg_8_1.snap)
	end)
	arg_5_0:addEventHandler("button_over_disable", function(arg_9_0, arg_9_1)
		var_0_3(arg_9_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOverDisabled"))
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_5_0, "WZWipSetup")
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_5_0, "AR")
	end
end

function TimedButton(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIButton.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 38 * _1080p)

	var_10_0.id = "TimedButton"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0

	var_10_0:SetButtonDisabled(true)

	local var_10_3
	local var_10_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_10_1
	})

	var_10_4.id = "Background"

	var_10_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.Background = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "GenericProgressBar"

	var_10_6.DialogueBackground:SetAlpha(0, 0)
	var_10_6.Fill:SetRGBFromTable(SWATCHES.tabManager.tabTextDisabled, 0)
	var_10_6.Fill:SetAlpha(0.4, 0)
	var_10_6.Frame:SetAlpha(0, 0)
	var_10_6.Cap:SetAlpha(0, 0)
	var_10_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 1, _1080p * -1)
	var_10_0:addElement(var_10_6)

	var_10_0.GenericProgressBar = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIStyledText.new()

	var_10_8.id = "Text"

	var_10_8:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_10_8:setText("", 0)
	var_10_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_8:SetAlignment(LUI.Alignment.Left)
	var_10_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_8:SetStartupDelay(2000)
	var_10_8:SetLineHoldTime(400)
	var_10_8:SetAnimMoveTime(300)
	var_10_8:SetAnimMoveSpeed(50)
	var_10_8:SetEndDelay(1500)
	var_10_8:SetCrossfadeTime(750)
	var_10_8:SetFadeInTime(300)
	var_10_8:SetFadeOutTime(300)
	var_10_8:SetMaxVisibleLines(1)
	var_10_8:SetOutlineRGBFromInt(0, 0)
	var_10_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -11, _1080p * 13)
	var_10_0:addElement(var_10_8)

	var_10_0.Text = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIImage.new()

	var_10_10.id = "Lock"

	var_10_10:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_10_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_10_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -33, _1080p * -7, _1080p * -13, _1080p * 13)
	var_10_0:addElement(var_10_10)

	var_10_0.Lock = var_10_10

	local var_10_11

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_10_11 = LUI.UIImage.new()
		var_10_11.id = "TopSep"

		var_10_11:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
		var_10_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
		var_10_0:addElement(var_10_11)

		var_10_0.TopSep = var_10_11
	end

	local var_10_12

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_10_12 = LUI.UIImage.new()
		var_10_12.id = "BotSep"

		var_10_12:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
		var_10_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, _1080p * -3)
		var_10_0:addElement(var_10_12)

		var_10_0.BotSep = var_10_12
	end

	local function var_10_13()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_13

	local var_10_14
	local var_10_15 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonUp", var_10_15)

	local var_10_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonUp", var_10_16)

	local function var_10_17()
		var_10_8:AnimateSequence("ButtonUp")
		var_10_10:AnimateSequence("ButtonUp")
	end

	var_10_0._sequences.ButtonUp = var_10_17

	local var_10_18
	local var_10_19 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonOver", var_10_19)

	local var_10_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonOver", var_10_20)

	local function var_10_21()
		var_10_8:AnimateSequence("ButtonOver")
		var_10_10:AnimateSequence("ButtonOver")
	end

	var_10_0._sequences.ButtonOver = var_10_21

	local var_10_22
	local var_10_23 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonOverDisabled", var_10_23)

	local var_10_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonOverDisabled", var_10_24)

	local function var_10_25()
		var_10_8:AnimateSequence("ButtonOverDisabled")
		var_10_10:AnimateSequence("ButtonOverDisabled")
	end

	var_10_0._sequences.ButtonOverDisabled = var_10_25

	local var_10_26
	local var_10_27 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonUpDisabled", var_10_27)

	local var_10_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonUpDisabled", var_10_28)

	local function var_10_29()
		var_10_8:AnimateSequence("ButtonUpDisabled")
		var_10_10:AnimateSequence("ButtonUpDisabled")
	end

	var_10_0._sequences.ButtonUpDisabled = var_10_29

	local var_10_30
	local var_10_31 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("WZWipButtonOver", var_10_31)

	local var_10_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("WZWipButtonOver", var_10_32)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_33 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 1,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_11:RegisterAnimationSequence("WZWipButtonOver", var_10_33)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_34 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 1,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_12:RegisterAnimationSequence("WZWipButtonOver", var_10_34)
	end

	local function var_10_35()
		var_10_8:AnimateSequence("WZWipButtonOver")
		var_10_10:AnimateSequence("WZWipButtonOver")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_11:AnimateSequence("WZWipButtonOver")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_12:AnimateSequence("WZWipButtonOver")
		end
	end

	var_10_0._sequences.WZWipButtonOver = var_10_35

	local var_10_36
	local var_10_37 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("WZWipButtonUp", var_10_37)

	local var_10_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("WZWipButtonUp", var_10_38)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_39 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			},
			{
				value = 0.5,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_11:RegisterAnimationSequence("WZWipButtonUp", var_10_39)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_40 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			},
			{
				value = 0.5,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_12:RegisterAnimationSequence("WZWipButtonUp", var_10_40)
	end

	local function var_10_41()
		var_10_8:AnimateSequence("WZWipButtonUp")
		var_10_10:AnimateSequence("WZWipButtonUp")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_11:AnimateSequence("WZWipButtonUp")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_12:AnimateSequence("WZWipButtonUp")
		end
	end

	var_10_0._sequences.WZWipButtonUp = var_10_41

	local var_10_42
	local var_10_43 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("WZWipButtonOverDisabled", var_10_43)

	local var_10_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("WZWipButtonOverDisabled", var_10_44)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_45 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_10_11:RegisterAnimationSequence("WZWipButtonOverDisabled", var_10_45)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_46 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_10_12:RegisterAnimationSequence("WZWipButtonOverDisabled", var_10_46)
	end

	local function var_10_47()
		var_10_8:AnimateSequence("WZWipButtonOverDisabled")
		var_10_10:AnimateSequence("WZWipButtonOverDisabled")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_11:AnimateSequence("WZWipButtonOverDisabled")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_12:AnimateSequence("WZWipButtonOverDisabled")
		end
	end

	var_10_0._sequences.WZWipButtonOverDisabled = var_10_47

	local var_10_48
	local var_10_49 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("WZWipButtonUpDisabled", var_10_49)

	local var_10_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_10_50)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_51 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_10_11:RegisterAnimationSequence("WZWipButtonUpDisabled", var_10_51)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_52 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_10_12:RegisterAnimationSequence("WZWipButtonUpDisabled", var_10_52)
	end

	local function var_10_53()
		var_10_8:AnimateSequence("WZWipButtonUpDisabled")
		var_10_10:AnimateSequence("WZWipButtonUpDisabled")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_11:AnimateSequence("WZWipButtonUpDisabled")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_12:AnimateSequence("WZWipButtonUpDisabled")
		end
	end

	var_10_0._sequences.WZWipButtonUpDisabled = var_10_53

	local var_10_54
	local var_10_55 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("WZWipButtonUpSnap", var_10_55)

	local var_10_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("WZWipButtonUpSnap", var_10_56)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_57 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_10_11:RegisterAnimationSequence("WZWipButtonUpSnap", var_10_57)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_58 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_10_12:RegisterAnimationSequence("WZWipButtonUpSnap", var_10_58)
	end

	local function var_10_59()
		var_10_8:AnimateSequence("WZWipButtonUpSnap")
		var_10_10:AnimateSequence("WZWipButtonUpSnap")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_11:AnimateSequence("WZWipButtonUpSnap")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_12:AnimateSequence("WZWipButtonUpSnap")
		end
	end

	var_10_0._sequences.WZWipButtonUpSnap = var_10_59

	local var_10_60
	local var_10_61 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_10_8:RegisterAnimationSequence("WZWipSetup", var_10_61)

	local var_10_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_10_10:RegisterAnimationSequence("WZWipSetup", var_10_62)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_63 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_10_11:RegisterAnimationSequence("WZWipSetup", var_10_63)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_10_64 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_10_12:RegisterAnimationSequence("WZWipSetup", var_10_64)
	end

	local function var_10_65()
		var_10_8:AnimateSequence("WZWipSetup")
		var_10_10:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_11:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_10_12:AnimateSequence("WZWipSetup")
		end
	end

	var_10_0._sequences.WZWipSetup = var_10_65

	local var_10_66
	local var_10_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		}
	}

	var_10_8:RegisterAnimationSequence("AR", var_10_67)

	local function var_10_68()
		var_10_8:AnimateSequence("AR")
	end

	var_10_0._sequences.AR = var_10_68

	var_0_4(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("TimedButton", TimedButton)
LockTable(_M)
