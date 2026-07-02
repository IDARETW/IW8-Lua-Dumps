module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		if arg_1_0._numberSlider then
			arg_1_1 = arg_1_1 and arg_1_1 .. "ShowNumber"
		end

		if IsLanguageRightToLeft(GetCurrentLanguage()) and ArabicSequenceExist(arg_1_0._sequences, arg_1_1) then
			ACTIONS.AnimateSequence(arg_1_0, tostring(arg_1_1 .. "Arabic"))
		else
			ACTIONS.AnimateSequence(arg_1_0, arg_1_1)
		end
	end
end

function GetRightToLeftConstants()
	local var_2_0 = 1
	local var_2_1 = 0
	local var_2_2 = 1
	local var_2_3 = 0

	if IsLanguageRightToLeft(GetCurrentLanguage()) then
		var_2_0, var_2_1 = 0, 1
		var_2_2, var_2_3 = 0, -1
	end

	return var_2_0, var_2_1, var_2_2, var_2_3
end

function AddShowTickMarkerFrames(arg_3_0)
	local var_3_0 = {
		{
			function()
				return arg_3_0.GenericFillBar.TickMarker:SetAlpha(0.85, 0)
			end
		}
	}

	arg_3_0.GenericFillBar:RegisterAnimationSequence("ShowTickMarker", var_3_0)

	local function var_3_1()
		arg_3_0.GenericFillBar:AnimateSequence("ShowTickMarker")
	end

	arg_3_0._sequences.ShowTickMarker = var_3_1
end

function PostLoadFunc(arg_6_0, arg_6_1, arg_6_2)
	AddShowTickMarkerFrames(arg_6_0)

	arg_6_0._numberSlider = false

	function arg_6_0.ShowNumberFunction(arg_7_0)
		arg_6_0._numberSlider = arg_7_0

		ACTIONS.AnimateSequence(arg_6_0, tostring("ButtonUpShowNumber"))
	end

	function arg_6_0.ShowTickFunction(arg_8_0)
		if arg_8_0 then
			arg_6_0.GenericFillBar.TickMarker:SetAlpha(0.85, 0)
		end
	end

	if IsLanguageRightToLeft(GetCurrentLanguage()) then
		if arg_6_0._numberSlider then
			ACTIONS.AnimateSequence(arg_6_0, tostring("ButtonUpShowNumberArabic"))
		else
			ACTIONS.AnimateSequence(arg_6_0, tostring("ButtonUpArabic"))
		end
	end

	arg_6_0:SetHandleMouseButton(false)

	if Engine.CGABICJHAI() then
		LUI.AddMouseSliderLogic(arg_6_0)
	end

	local var_6_0 = LUI.Alignment.Left

	arg_6_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		var_0_0(arg_9_0, "ButtonOver")
		arg_6_0.Background:SetupButton(arg_6_0.Title, arg_6_0.Title:getText(), var_6_0)
	end)
	arg_6_0:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		var_0_0(arg_10_0, "ButtonUp")
	end)
	arg_6_0:addEventHandler("button_disable", function(arg_11_0, arg_11_1)
		var_0_0(arg_11_0, "ButtonUpDisabled")
	end)
	arg_6_0:addEventHandler("button_over_disable", function(arg_12_0, arg_12_1)
		var_0_0(arg_12_0, "ButtonOverDisabled")
		arg_6_0.Background:SetupButton(arg_6_0.Title, arg_6_0.Title:getText(), var_6_0)
	end)
end

function GenericFillBarArrowButton(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIButton.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 38 * _1080p)

	var_13_0.id = "GenericFillBarArrowButton"
	var_13_0._animationSets = {}
	var_13_0._sequences = {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_13_1
	})

	var_13_4.id = "Background"

	var_13_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_13_0:addElement(var_13_4)

	var_13_0.Background = var_13_4

	local var_13_5
	local var_13_6 = LUI.UIStyledText.new()

	var_13_6.id = "Title"

	var_13_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_13_6:setText(ToUpperCase(""), 0)
	var_13_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_6:SetAlignment(LUI.Alignment.Left)
	var_13_6:SetStartupDelay(1250)
	var_13_6:SetLineHoldTime(400)
	var_13_6:SetAnimMoveTime(300)
	var_13_6:SetAnimMoveSpeed(50)
	var_13_6:SetEndDelay(1000)
	var_13_6:SetCrossfadeTime(500)
	var_13_6:SetFadeInTime(300)
	var_13_6:SetFadeOutTime(300)
	var_13_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_13_6:SetMaxVisibleLines(1)
	var_13_6:SetOutlineRGBFromInt(0, 0)
	var_13_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -315, _1080p * -12, _1080p * 12)
	var_13_0:addElement(var_13_6)

	var_13_0.Title = var_13_6

	local var_13_7
	local var_13_8 = MenuBuilder.BuildRegisteredType("MenuFillBar", {
		controllerIndex = var_13_1
	})

	var_13_8.id = "GenericFillBar"

	var_13_8:SetScale(-0.16, 0)
	var_13_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -274, _1080p * -46, _1080p * -8, _1080p * 8)
	var_13_0:addElement(var_13_8)

	var_13_0.GenericFillBar = var_13_8

	local var_13_9
	local var_13_10 = MenuBuilder.BuildRegisteredType("MenuLeftArrow", {
		controllerIndex = var_13_1
	})

	var_13_10.id = "ArrowLeft"

	var_13_10:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_13_10:SetAlpha(0, 0)
	var_13_10:SetScale(-0.25, 0)
	var_13_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -280, _1080p * -256, _1080p * -24, _1080p * 24)
	var_13_0:addElement(var_13_10)

	var_13_0.ArrowLeft = var_13_10

	local var_13_11
	local var_13_12 = MenuBuilder.BuildRegisteredType("MenuRightArrow", {
		controllerIndex = var_13_1
	})

	var_13_12.id = "ArrowRight"

	var_13_12:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_13_12:SetAlpha(0, 0)
	var_13_12:SetScale(-0.25, 0)
	var_13_12:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -64, _1080p * -40, _1080p * -24, _1080p * 24)
	var_13_0:addElement(var_13_12)

	var_13_0.ArrowRight = var_13_12

	local var_13_13
	local var_13_14 = LUI.UIStyledText.new()

	var_13_14.id = "Text"

	var_13_14:SetAlpha(0, 0)
	var_13_14:setText("0", 0)
	var_13_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_14:SetAlignment(LUI.Alignment.Center)
	var_13_14:SetOutlineRGBFromInt(0, 0)
	var_13_14:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -112, _1080p * -64, _1080p * -9, _1080p * 9)
	var_13_0:addElement(var_13_14)

	var_13_0.Text = var_13_14

	local var_13_15
	local var_13_16 = LUI.UIImage.new()

	var_13_16.id = "Lock"

	var_13_16:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_13_16:SetAlpha(0, 0)
	var_13_16:setImage(RegisterMaterial("icon_lock"), 0)
	var_13_16:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * 3, _1080p * 29, _1080p * -13, _1080p * 13)
	var_13_0:addElement(var_13_16)

	var_13_0.Lock = var_13_16

	local function var_13_17()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_17

	local var_13_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_16:RegisterAnimationSequence("Locked", var_13_18)

	local function var_13_19()
		var_13_16:AnimateSequence("Locked")
	end

	var_13_0._sequences.Locked = var_13_19

	local function var_13_20()
		return
	end

	var_13_0._sequences.NewNotification = var_13_20

	local var_13_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -756
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -63
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
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
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_6:RegisterAnimationSequence("Arabic", var_13_21)

	local function var_13_22()
		var_13_6:AnimateSequence("Arabic")
	end

	var_13_0._sequences.Arabic = var_13_22

	local var_13_23 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonOver", var_13_23)

	local var_13_24 = {
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

	var_13_10:RegisterAnimationSequence("ButtonOver", var_13_24)

	local var_13_25 = {
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

	var_13_12:RegisterAnimationSequence("ButtonOver", var_13_25)

	local function var_13_26()
		var_13_6:AnimateSequence("ButtonOver")
		var_13_10:AnimateSequence("ButtonOver")
		var_13_12:AnimateSequence("ButtonOver")
	end

	var_13_0._sequences.ButtonOver = var_13_26

	local var_13_27 = {
		{
			value = 8421504,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUp", var_13_27)

	local var_13_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonUp", var_13_28)

	local var_13_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonUp", var_13_29)

	local function var_13_30()
		var_13_6:AnimateSequence("ButtonUp")
		var_13_10:AnimateSequence("ButtonUp")
		var_13_12:AnimateSequence("ButtonUp")
	end

	var_13_0._sequences.ButtonUp = var_13_30

	local var_13_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonOverDisabled", var_13_31)

	local var_13_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonOverDisabled", var_13_32)

	local var_13_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonOverDisabled", var_13_33)

	local var_13_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonOverDisabled", var_13_34)

	local function var_13_35()
		var_13_6:AnimateSequence("ButtonOverDisabled")
		var_13_8:AnimateSequence("ButtonOverDisabled")
		var_13_10:AnimateSequence("ButtonOverDisabled")
		var_13_12:AnimateSequence("ButtonOverDisabled")
	end

	var_13_0._sequences.ButtonOverDisabled = var_13_35

	local var_13_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUpDisabled", var_13_36)

	local var_13_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonUpDisabled", var_13_37)

	local var_13_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonUpDisabled", var_13_38)

	local var_13_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonUpDisabled", var_13_39)

	local function var_13_40()
		var_13_6:AnimateSequence("ButtonUpDisabled")
		var_13_8:AnimateSequence("ButtonUpDisabled")
		var_13_10:AnimateSequence("ButtonUpDisabled")
		var_13_12:AnimateSequence("ButtonUpDisabled")
	end

	var_13_0._sequences.ButtonUpDisabled = var_13_40

	local var_13_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 295
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -40
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonOverDisabledArabic", var_13_41)

	local var_13_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -559
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -331
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonOverDisabledArabic", var_13_42)

	local var_13_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -565
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -541
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonOverDisabledArabic", var_13_43)

	local var_13_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -325
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonOverDisabledArabic", var_13_44)

	local function var_13_45()
		var_13_6:AnimateSequence("ButtonOverDisabledArabic")
		var_13_8:AnimateSequence("ButtonOverDisabledArabic")
		var_13_10:AnimateSequence("ButtonOverDisabledArabic")
		var_13_12:AnimateSequence("ButtonOverDisabledArabic")
	end

	var_13_0._sequences.ButtonOverDisabledArabic = var_13_45

	local var_13_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 280
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -55
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUpDisabledArabic", var_13_46)

	local var_13_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -574
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -346
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonUpDisabledArabic", var_13_47)

	local var_13_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -580
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -556
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonUpDisabledArabic", var_13_48)

	local var_13_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -364
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -340
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonUpDisabledArabic", var_13_49)

	local function var_13_50()
		var_13_6:AnimateSequence("ButtonUpDisabledArabic")
		var_13_8:AnimateSequence("ButtonUpDisabledArabic")
		var_13_10:AnimateSequence("ButtonUpDisabledArabic")
		var_13_12:AnimateSequence("ButtonUpDisabledArabic")
	end

	var_13_0._sequences.ButtonUpDisabledArabic = var_13_50

	local var_13_51 = {
		{
			value = 9563998,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 295
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -40
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonOverArabic", var_13_51)

	local var_13_52 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -559
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -331
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonOverArabic", var_13_52)

	local var_13_53 = {
		{
			value = 9563998,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -565
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -541
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonOverArabic", var_13_53)

	local var_13_54 = {
		{
			value = 9563998,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -325
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonOverArabic", var_13_54)

	local function var_13_55()
		var_13_6:AnimateSequence("ButtonOverArabic")
		var_13_8:AnimateSequence("ButtonOverArabic")
		var_13_10:AnimateSequence("ButtonOverArabic")
		var_13_12:AnimateSequence("ButtonOverArabic")
	end

	var_13_0._sequences.ButtonOverArabic = var_13_55

	local var_13_56 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 280
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -55
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUpArabic", var_13_56)

	local var_13_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -574
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -346
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonUpArabic", var_13_57)

	local var_13_58 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -580
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -556
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonUpArabic", var_13_58)

	local var_13_59 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -364
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -340
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonUpArabic", var_13_59)

	local function var_13_60()
		var_13_6:AnimateSequence("ButtonUpArabic")
		var_13_8:AnimateSequence("ButtonUpArabic")
		var_13_10:AnimateSequence("ButtonUpArabic")
		var_13_12:AnimateSequence("ButtonUpArabic")
	end

	var_13_0._sequences.ButtonUpArabic = var_13_60

	local var_13_61 = {
		{
			value = 9563998,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 35
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -300
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonOverShowNumber", var_13_61)

	local var_13_62 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -307
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -79
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonOverShowNumber", var_13_62)

	local var_13_63 = {
		{
			value = 9563998,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -313
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -289
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonOverShowNumber", var_13_63)

	local var_13_64 = {
		{
			value = 9563998,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -49
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -25
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonOverShowNumber", var_13_64)

	local var_13_65 = {
		{
			value = 9563998,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -97
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -49
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_14:RegisterAnimationSequence("ButtonOverShowNumber", var_13_65)

	local function var_13_66()
		var_13_6:AnimateSequence("ButtonOverShowNumber")
		var_13_8:AnimateSequence("ButtonOverShowNumber")
		var_13_10:AnimateSequence("ButtonOverShowNumber")
		var_13_12:AnimateSequence("ButtonOverShowNumber")
		var_13_14:AnimateSequence("ButtonOverShowNumber")
	end

	var_13_0._sequences.ButtonOverShowNumber = var_13_66

	local var_13_67 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -315
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUpShowNumber", var_13_67)

	local var_13_68 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -322
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -94
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonUpShowNumber", var_13_68)

	local var_13_69 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -325
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -301
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonUpShowNumber", var_13_69)

	local var_13_70 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -64
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -40
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonUpShowNumber", var_13_70)

	local var_13_71 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -112
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -64
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_14:RegisterAnimationSequence("ButtonUpShowNumber", var_13_71)

	local function var_13_72()
		var_13_6:AnimateSequence("ButtonUpShowNumber")
		var_13_8:AnimateSequence("ButtonUpShowNumber")
		var_13_10:AnimateSequence("ButtonUpShowNumber")
		var_13_12:AnimateSequence("ButtonUpShowNumber")
		var_13_14:AnimateSequence("ButtonUpShowNumber")
	end

	var_13_0._sequences.ButtonUpShowNumber = var_13_72

	local var_13_73 = {
		{
			value = 9563998,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 340
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 5
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonOverShowNumberArabic", var_13_73)

	local var_13_74 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -559
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -331
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonOverShowNumberArabic", var_13_74)

	local var_13_75 = {
		{
			value = 9563998,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -565
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -541
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonOverShowNumberArabic", var_13_75)

	local var_13_76 = {
		{
			value = 9563998,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -304
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -280
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonOverShowNumberArabic", var_13_76)

	local var_13_77 = {
		{
			value = 9563998,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -301
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_14:RegisterAnimationSequence("ButtonOverShowNumberArabic", var_13_77)

	local function var_13_78()
		var_13_6:AnimateSequence("ButtonOverShowNumberArabic")
		var_13_8:AnimateSequence("ButtonOverShowNumberArabic")
		var_13_10:AnimateSequence("ButtonOverShowNumberArabic")
		var_13_12:AnimateSequence("ButtonOverShowNumberArabic")
		var_13_14:AnimateSequence("ButtonOverShowNumberArabic")
	end

	var_13_0._sequences.ButtonOverShowNumberArabic = var_13_78

	local var_13_79 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 325
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUpShowNumberArabic", var_13_79)

	local var_13_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -574
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -346
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonUpShowNumberArabic", var_13_80)

	local var_13_81 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -580
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -556
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonUpShowNumberArabic", var_13_81)

	local var_13_82 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -319
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -295
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -24
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_12:RegisterAnimationSequence("ButtonUpShowNumberArabic", var_13_82)

	local var_13_83 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -364
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -316
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_13_14:RegisterAnimationSequence("ButtonUpShowNumberArabic", var_13_83)

	local function var_13_84()
		var_13_6:AnimateSequence("ButtonUpShowNumberArabic")
		var_13_8:AnimateSequence("ButtonUpShowNumberArabic")
		var_13_10:AnimateSequence("ButtonUpShowNumberArabic")
		var_13_12:AnimateSequence("ButtonUpShowNumberArabic")
		var_13_14:AnimateSequence("ButtonUpShowNumberArabic")
	end

	var_13_0._sequences.ButtonUpShowNumberArabic = var_13_84

	if CONDITIONS.IsArabic(var_13_0) then
		ACTIONS.AnimateSequence(var_13_0, "Arabic")
	end

	var_13_0:addEventHandler("button_over", function(arg_30_0, arg_30_1)
		if not arg_30_1.controller then
			local var_30_0 = var_13_1
		end

		ACTIONS.AnimateSequenceByElement(var_13_0, {
			elementPath = "GenericFillBar",
			sequenceName = "ButtonOver",
			elementName = "GenericFillBar"
		})
	end)
	var_13_0:addEventHandler("button_up", function(arg_31_0, arg_31_1)
		if not arg_31_1.controller then
			local var_31_0 = var_13_1
		end

		ACTIONS.AnimateSequenceByElement(var_13_0, {
			elementPath = "GenericFillBar",
			sequenceName = "ButtonUp",
			elementName = "GenericFillBar"
		})
	end)
	var_13_0:addEventHandler("button_over_disable", function(arg_32_0, arg_32_1)
		if not arg_32_1.controller then
			local var_32_0 = var_13_1
		end

		ACTIONS.AnimateSequenceByElement(var_13_0, {
			elementPath = "GenericFillBar",
			sequenceName = "ButtonOver",
			elementName = "GenericFillBar"
		})
	end)
	var_13_0:addEventHandler("button_disable", function(arg_33_0, arg_33_1)
		if not arg_33_1.controller then
			local var_33_0 = var_13_1
		end

		ACTIONS.AnimateSequenceByElement(var_13_0, {
			elementPath = "GenericFillBar",
			sequenceName = "ButtonUp",
			elementName = "GenericFillBar"
		})
	end)
	PostLoadFunc(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("GenericFillBarArrowButton", GenericFillBarArrowButton)
LockTable(_M)
