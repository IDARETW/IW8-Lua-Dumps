module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		ACTIONS.AnimateSequence(arg_1_0, arg_1_1)
	end
end

function AddButtonOverFrames(arg_2_0)
	local var_2_0 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	arg_2_0.Title:RegisterAnimationSequence("ButtonOver", var_2_0)

	local var_2_1 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	arg_2_0.Text:RegisterAnimationSequence("ButtonOver", var_2_1)

	local var_2_2 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	arg_2_0.ArrowLeft:RegisterAnimationSequence("ButtonOver", var_2_2)

	local var_2_3 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	arg_2_0.ArrowRight:RegisterAnimationSequence("ButtonOver", var_2_3)

	local function var_2_4()
		arg_2_0.Title:AnimateSequence("ButtonOver")
		arg_2_0.Text:AnimateSequence("ButtonOver")
		arg_2_0.ArrowLeft:AnimateSequence("ButtonOver")
		arg_2_0.ArrowRight:AnimateSequence("ButtonOver")
	end

	arg_2_0._sequences.ButtonOver = var_2_4
end

function AddButtonUpFrames(arg_4_0)
	local var_4_0 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	arg_4_0.Title:RegisterAnimationSequence("ButtonUp", var_4_0)

	local var_4_1 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	arg_4_0.Text:RegisterAnimationSequence("ButtonUp", var_4_1)

	local var_4_2 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	arg_4_0.ArrowLeft:RegisterAnimationSequence("ButtonUp", var_4_2)

	local var_4_3 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	arg_4_0.ArrowRight:RegisterAnimationSequence("ButtonUp", var_4_3)

	local function var_4_4()
		arg_4_0.Title:AnimateSequence("ButtonUp")
		arg_4_0.Text:AnimateSequence("ButtonUp")
		arg_4_0.ArrowLeft:AnimateSequence("ButtonUp")
		arg_4_0.ArrowRight:AnimateSequence("ButtonUp")
	end

	arg_4_0._sequences.ButtonUp = var_4_4
end

function AddButtonDisabledUpFrames(arg_6_0)
	local var_6_0 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	arg_6_0.Title:RegisterAnimationSequence("ButtonUpDisabled", var_6_0)

	local var_6_1 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	arg_6_0.Text:RegisterAnimationSequence("ButtonUpDisabled", var_6_1)

	local var_6_2 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	arg_6_0.ArrowLeft:RegisterAnimationSequence("ButtonUpDisabled", var_6_2)

	local var_6_3 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	arg_6_0.ArrowRight:RegisterAnimationSequence("ButtonUpDisabled", var_6_3)

	local function var_6_4()
		arg_6_0.Title:AnimateSequence("ButtonUpDisabled")
		arg_6_0.Text:AnimateSequence("ButtonUpDisabled")
		arg_6_0.ArrowLeft:AnimateSequence("ButtonUpDisabled")
		arg_6_0.ArrowRight:AnimateSequence("ButtonUpDisabled")
	end

	arg_6_0._sequences.ButtonUpDisabled = var_6_4
end

function AddButtonDisabledOverFrames(arg_8_0)
	local var_8_0 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	arg_8_0.Title:RegisterAnimationSequence("ButtonOverDisabled", var_8_0)

	local var_8_1 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	arg_8_0.Text:RegisterAnimationSequence("ButtonOverDisabled", var_8_1)

	local var_8_2 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	arg_8_0.ArrowLeft:RegisterAnimationSequence("ButtonOverDisabled", var_8_2)

	local var_8_3 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	arg_8_0.ArrowRight:RegisterAnimationSequence("ButtonOverDisabled", var_8_3)

	local function var_8_4()
		arg_8_0.Title:AnimateSequence("ButtonOverDisabled")
		arg_8_0.Text:AnimateSequence("ButtonOverDisabled")
		arg_8_0.ArrowLeft:AnimateSequence("ButtonOverDisabled")
		arg_8_0.ArrowRight:AnimateSequence("ButtonOverDisabled")
	end

	arg_8_0._sequences.ButtonOverDisabled = var_8_4
end

function PostLoadFunc(arg_10_0)
	AddButtonOverFrames(arg_10_0)
	AddButtonUpFrames(arg_10_0)
	AddButtonDisabledUpFrames(arg_10_0)
	AddButtonDisabledOverFrames(arg_10_0)

	local var_10_0, var_10_1, var_10_2, var_10_3 = arg_10_0.Text:getLocalRect()
	local var_10_4 = 1
	local var_10_5 = 0
	local var_10_6 = var_10_0
	local var_10_7 = var_10_2

	if IsLanguageRightToLeft(GetCurrentLanguage()) then
		local var_10_8 = 0, 1
		local var_10_9 = 40 * _1080p
		local var_10_10 = 240 * _1080p

		arg_10_0.ArrowRight:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 220, _1080p * 252, _1080p * -32, _1080p * 32)
		arg_10_0.ArrowLeft:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 30, _1080p * 62, _1080p * -32, _1080p * 32)
	end

	if not Engine.CGABICJHAI() then
		arg_10_0.ArrowLeft:SetScale(-0.25, 0)
		arg_10_0.ArrowRight:SetScale(-0.25, 0)
	end

	local function var_10_11(arg_11_0, arg_11_1)
		if arg_11_0._lastState ~= arg_11_1 then
			arg_11_0._lastState = arg_11_1

			ACTIONS.AnimateSequence(arg_11_0, arg_11_1)
		end
	end

	arg_10_0:SetHandleMouseButton(true)
	arg_10_0:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		var_10_11(arg_12_0, "ButtonOver")
	end)
	arg_10_0:addEventHandler("button_up", function(arg_13_0, arg_13_1)
		var_10_11(arg_13_0, "ButtonUp")
	end)
	arg_10_0:addEventHandler("active", function(arg_14_0, arg_14_1)
		var_10_11(arg_14_0, "Active")
	end)
	arg_10_0:addEventHandler("button_over_active", function(arg_15_0, arg_15_1)
		var_10_11(arg_15_0, "ButtonOverActive")
	end)
	arg_10_0:addEventHandler("button_active", function(arg_16_0, arg_16_1)
		var_10_11(arg_16_0, "ButtonUpActive")
	end)
	arg_10_0:addEventHandler("disable_active", function(arg_17_0, arg_17_1)
		var_10_11(arg_17_0, "DisabledActive")
	end)
	arg_10_0:addEventHandler("button_over_disable_active", function(arg_18_0, arg_18_1)
		var_10_11(arg_18_0, "ButtonOverDisabledActive")
	end)
	arg_10_0:addEventHandler("button_disable_active", function(arg_19_0, arg_19_1)
		var_10_11(arg_19_0, "ButtonUpDisabledActive")
	end)
	arg_10_0:addEventHandler("disable", function(arg_20_0, arg_20_1)
		var_10_11(arg_20_0, "Disabled")
	end)
	arg_10_0:addEventHandler("button_over_disable", function(arg_21_0, arg_21_1)
		var_10_11(arg_21_0, "ButtonOverDisabled")
	end)
	arg_10_0:addEventHandler("button_disable", function(arg_22_0, arg_22_1)
		var_10_11(arg_22_0, "ButtonUpDisabled")
	end)
	arg_10_0:addEventHandler("gamepad_button", function(arg_23_0, arg_23_1)
		if not arg_23_1.down then
			if arg_23_1.button == "right" then
				ACTIONS.AnimateSequence(arg_23_0.ArrowRight, "Up")
			elseif arg_23_1.button == "left" then
				ACTIONS.AnimateSequence(arg_23_0.ArrowLeft, "Up")
			end
		elseif arg_23_1.button == "right" then
			ACTIONS.AnimateSequence(arg_23_0.ArrowRight, "Down")
		elseif arg_23_1.button == "left" then
			ACTIONS.AnimateSequence(arg_23_0.ArrowLeft, "Down")
		end
	end)
	arg_10_0.ArrowLeft:addEventHandler("leftmousedown", function(arg_24_0, arg_24_1)
		if arg_24_0:isInFocus() then
			var_10_11(arg_24_0, "Down")

			return true
		end
	end)
	arg_10_0.ArrowLeft:addEventHandler("leftmouseup", function(arg_25_0, arg_25_1)
		if arg_25_0:isInFocus() then
			var_10_11(arg_25_0, "Up")

			return true
		end
	end)
	arg_10_0.ArrowRight:addEventHandler("leftmousedown", function(arg_26_0, arg_26_1)
		if arg_26_0:isInFocus() then
			var_10_11(arg_26_0, "Down")

			return true
		end
	end)
	arg_10_0.ArrowRight:addEventHandler("leftmouseup", function(arg_27_0, arg_27_1)
		if arg_27_0:isInFocus() then
			var_10_11(arg_27_0, "Up")

			return true
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_10_0, "AR")
	end
end

function GenericArrowButton(arg_28_0, arg_28_1)
	local var_28_0 = LUI.UIButton.new()

	var_28_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 630 * _1080p, 0, 40 * _1080p)

	var_28_0.id = "GenericArrowButton"
	var_28_0._animationSets = var_28_0._animationSets or {}
	var_28_0._sequences = var_28_0._sequences or {}

	local var_28_1 = arg_28_1 and arg_28_1.controllerIndex

	if not var_28_1 and not Engine.DDJFBBJAIG() then
		var_28_1 = var_28_0:getRootController()
	end

	assert(var_28_1)

	local var_28_2 = var_28_0
	local var_28_3
	local var_28_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_28_1
	})

	var_28_4.id = "Background"

	var_28_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 30, 0, 0, 0)
	var_28_0:addElement(var_28_4)

	var_28_0.Background = var_28_4

	local var_28_5
	local var_28_6 = LUI.UIStyledText.new()

	var_28_6.id = "Title"

	var_28_6:SetRGBFromInt(8421504, 0)
	var_28_6:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_28_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_28_6:SetAlignment(LUI.Alignment.Left)
	var_28_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_28_6:SetStartupDelay(1750)
	var_28_6:SetLineHoldTime(1500)
	var_28_6:SetAnimMoveTime(2000)
	var_28_6:SetAnimMoveSpeed(50)
	var_28_6:SetEndDelay(1500)
	var_28_6:SetCrossfadeTime(400)
	var_28_6:SetFadeInTime(300)
	var_28_6:SetFadeOutTime(300)
	var_28_6:SetMaxVisibleLines(1)
	var_28_6:SetOutlineRGBFromInt(0, 0)
	var_28_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 50, _1080p * -226, _1080p * -12, _1080p * 12)
	var_28_0:addElement(var_28_6)

	var_28_0.Title = var_28_6

	local var_28_7
	local var_28_8 = LUI.UIStyledText.new()

	var_28_8.id = "Text"

	var_28_8:SetRGBFromInt(8421504, 0)
	var_28_8:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_28_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_28_8:SetAlignment(LUI.Alignment.Center)
	var_28_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_28_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_28_8:SetStartupDelay(1250)
	var_28_8:SetLineHoldTime(1000)
	var_28_8:SetAnimMoveTime(1000)
	var_28_8:SetAnimMoveSpeed(50)
	var_28_8:SetEndDelay(1000)
	var_28_8:SetCrossfadeTime(400)
	var_28_8:SetFadeInTime(300)
	var_28_8:SetFadeOutTime(300)
	var_28_8:SetMaxVisibleLines(1)
	var_28_8:SetOutlineRGBFromInt(0, 0)
	var_28_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -193, _1080p * -43, _1080p * -8, _1080p * 10)
	var_28_0:addElement(var_28_8)

	var_28_0.Text = var_28_8

	local var_28_9
	local var_28_10 = LUI.UIImage.new()

	var_28_10.id = "Lock"

	var_28_10:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_28_10:SetAlpha(0, 0)
	var_28_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_28_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 26, _1080p * -13, _1080p * 13)
	var_28_0:addElement(var_28_10)

	var_28_0.Lock = var_28_10

	local var_28_11
	local var_28_12 = LUI.UIImage.new()

	var_28_12.id = "ChangeIndicator"

	var_28_12:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_28_12:setImage(RegisterMaterial("ui_changed_indicator"), 0)
	var_28_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -32, 0, 0, _1080p * 32)
	var_28_0:addElement(var_28_12)

	var_28_0.ChangeIndicator = var_28_12

	local var_28_13
	local var_28_14 = MenuBuilder.BuildRegisteredType("GenericIconInnerButton", {
		controllerIndex = var_28_1
	})

	var_28_14.id = "ArrowRight"

	var_28_14.Icon:SetZRotation(180, 0)
	var_28_14.Icon:setImage(RegisterMaterial("icon_option_arrow"), 0)
	var_28_14:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -38, _1080p * -10, 0, 0)
	var_28_0:addElement(var_28_14)

	var_28_0.ArrowRight = var_28_14

	local var_28_15
	local var_28_16 = MenuBuilder.BuildRegisteredType("GenericIconInnerButton", {
		controllerIndex = var_28_1
	})

	var_28_16.id = "ArrowLeft"

	var_28_16.Icon:setImage(RegisterMaterial("icon_option_arrow"), 0)
	var_28_16:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -226, _1080p * -198, 0, 0)
	var_28_0:addElement(var_28_16)

	var_28_0.ArrowLeft = var_28_16

	local var_28_17
	local var_28_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_6:RegisterAnimationSequence("DefaultSequence", var_28_18)

	local var_28_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_28_8:RegisterAnimationSequence("DefaultSequence", var_28_19)

	local var_28_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_12:RegisterAnimationSequence("DefaultSequence", var_28_20)

	local function var_28_21()
		var_28_6:AnimateSequence("DefaultSequence")
		var_28_8:AnimateSequence("DefaultSequence")
		var_28_12:AnimateSequence("DefaultSequence")
	end

	var_28_0._sequences.DefaultSequence = var_28_21

	local var_28_22
	local var_28_23 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 6710886,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_28_6:RegisterAnimationSequence("Locked", var_28_23)

	local var_28_24 = {
		{
			value = 6710886,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_8:RegisterAnimationSequence("Locked", var_28_24)

	local var_28_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_10:RegisterAnimationSequence("Locked", var_28_25)

	local function var_28_26()
		var_28_6:AnimateSequence("Locked")
		var_28_8:AnimateSequence("Locked")
		var_28_10:AnimateSequence("Locked")
	end

	var_28_0._sequences.Locked = var_28_26

	local var_28_27
	local var_28_28 = {
		{
			value = 13810021,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_6:RegisterAnimationSequence("NewNotification", var_28_28)

	local var_28_29 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 13810021,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_28_8:RegisterAnimationSequence("NewNotification", var_28_29)

	local var_28_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_10:RegisterAnimationSequence("NewNotification", var_28_30)

	local function var_28_31()
		var_28_6:AnimateSequence("NewNotification")
		var_28_8:AnimateSequence("NewNotification")
		var_28_10:AnimateSequence("NewNotification")
	end

	var_28_0._sequences.NewNotification = var_28_31

	local var_28_32
	local var_28_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_28_6:RegisterAnimationSequence("ButtonOver", var_28_33)

	local var_28_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_28_8:RegisterAnimationSequence("ButtonOver", var_28_34)

	local var_28_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_28_12:RegisterAnimationSequence("ButtonOver", var_28_35)

	local function var_28_36()
		var_28_6:AnimateSequence("ButtonOver")
		var_28_8:AnimateSequence("ButtonOver")
		var_28_12:AnimateSequence("ButtonOver")
	end

	var_28_0._sequences.ButtonOver = var_28_36

	local var_28_37
	local var_28_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_28_6:RegisterAnimationSequence("ButtonUp", var_28_38)

	local var_28_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_28_8:RegisterAnimationSequence("ButtonUp", var_28_39)

	local var_28_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_28_12:RegisterAnimationSequence("ButtonUp", var_28_40)

	local function var_28_41()
		var_28_6:AnimateSequence("ButtonUp")
		var_28_8:AnimateSequence("ButtonUp")
		var_28_12:AnimateSequence("ButtonUp")
	end

	var_28_0._sequences.ButtonUp = var_28_41

	local var_28_42
	local var_28_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_28_6:RegisterAnimationSequence("Unlocked", var_28_43)

	local var_28_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_28_8:RegisterAnimationSequence("Unlocked", var_28_44)

	local var_28_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_10:RegisterAnimationSequence("Unlocked", var_28_45)

	local function var_28_46()
		var_28_6:AnimateSequence("Unlocked")
		var_28_8:AnimateSequence("Unlocked")
		var_28_10:AnimateSequence("Unlocked")
	end

	var_28_0._sequences.Unlocked = var_28_46

	local var_28_47
	local var_28_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_28_12:RegisterAnimationSequence("Changed", var_28_48)

	local function var_28_49()
		var_28_12:AnimateSequence("Changed")
	end

	var_28_0._sequences.Changed = var_28_49

	local var_28_50
	local var_28_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_28_12:RegisterAnimationSequence("NotChanged", var_28_51)

	local function var_28_52()
		var_28_12:AnimateSequence("NotChanged")
	end

	var_28_0._sequences.NotChanged = var_28_52

	local var_28_53
	local var_28_54 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_28_6:RegisterAnimationSequence("ButtonOverDisabled", var_28_54)

	local var_28_55 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_28_8:RegisterAnimationSequence("ButtonOverDisabled", var_28_55)

	local function var_28_56()
		var_28_6:AnimateSequence("ButtonOverDisabled")
		var_28_8:AnimateSequence("ButtonOverDisabled")
	end

	var_28_0._sequences.ButtonOverDisabled = var_28_56

	local var_28_57
	local var_28_58 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_28_6:RegisterAnimationSequence("ButtonUpDisabled", var_28_58)

	local var_28_59 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_28_8:RegisterAnimationSequence("ButtonUpDisabled", var_28_59)

	local function var_28_60()
		var_28_6:AnimateSequence("ButtonUpDisabled")
		var_28_8:AnimateSequence("ButtonUpDisabled")
	end

	var_28_0._sequences.ButtonUpDisabled = var_28_60

	local var_28_61
	local var_28_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 288
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -31
		}
	}

	var_28_6:RegisterAnimationSequence("AR", var_28_62)

	local var_28_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 72
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 212
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_28_8:RegisterAnimationSequence("AR", var_28_63)

	local function var_28_64()
		var_28_6:AnimateSequence("AR")
		var_28_8:AnimateSequence("AR")
	end

	var_28_0._sequences.AR = var_28_64

	local var_28_65
	local var_28_66 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_28_6:RegisterAnimationSequence("Disabled", var_28_66)

	local var_28_67 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_28_8:RegisterAnimationSequence("Disabled", var_28_67)

	local function var_28_68()
		var_28_6:AnimateSequence("Disabled")
		var_28_8:AnimateSequence("Disabled")
	end

	var_28_0._sequences.Disabled = var_28_68

	var_28_0:addEventHandler("disable", function(arg_41_0, arg_41_1)
		if not arg_41_1.controller then
			local var_41_0 = var_28_1
		end

		ACTIONS.AnimateSequence(var_28_0, "Locked")
	end)
	var_28_0:addEventHandler("enable", function(arg_42_0, arg_42_1)
		if not arg_42_1.controller then
			local var_42_0 = var_28_1
		end

		ACTIONS.AnimateSequence(var_28_0, "Unlocked")
	end)
	PostLoadFunc(var_28_0, var_28_1, arg_28_1)
	ACTIONS.AnimateSequence(var_28_0, "DefaultSequence")

	return var_28_0
end

MenuBuilder.registerType("GenericArrowButton", GenericArrowButton)
LockTable(_M)
