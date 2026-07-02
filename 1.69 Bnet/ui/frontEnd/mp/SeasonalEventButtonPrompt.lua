module(..., package.seeall)

local var_0_0 = SWATCHES.BattlePass.Purchased

local function var_0_1(arg_1_0, arg_1_1)
	assert(arg_1_1, "SeasonalEventButtonPrompt: expected non-nil props for SetupButton()")
	ACTIONS.AnimateSequence(arg_1_0, arg_1_1.layoutAnim or "")

	if arg_1_1.disabled == true then
		arg_1_0.disabled = true

		ACTIONS.AnimateSequence(arg_1_0, "Disabled")
		arg_1_0.DisableDescribe:setText(arg_1_1.disableText)
		arg_1_0.DisableDescribe:SetAlpha(1)
	end

	if arg_1_1.gameSourceID then
		arg_1_0.SnipeIcon:UpdateSnipeIcon({
			selected = true,
			gameSourceID = arg_1_1.gameSourceID
		})
	end

	if arg_1_1.MouseActionHandlerCallback then
		arg_1_0:SetHandleMouse(true)
		arg_1_0:registerEventHandler("mouseenter", function(arg_2_0, arg_2_1)
			if arg_1_0.disabled == true then
				return
			end

			Engine.BJDBIAGIDA(CoD.SFX.MouseOver)
			ACTIONS.AnimateSequence(arg_2_0, "MouseOver")
		end)
		arg_1_0:registerEventHandler("mouseleave", function(arg_3_0, arg_3_1)
			if arg_1_0.disabled == true then
				return
			end

			ACTIONS.AnimateSequence(arg_3_0, "MouseUp")
		end)
		arg_1_0:registerEventHandler("leftmousedown", function(arg_4_0, arg_4_1)
			return
		end)
		arg_1_0:registerEventHandler("leftmouseup", function(arg_5_0, arg_5_1)
			if arg_1_0.disabled == true then
				return
			end

			arg_1_1.MouseActionHandlerCallback(arg_5_0, arg_5_1)
		end)
	elseif arg_1_1.hidePromptWhenCompleted then
		ACTIONS.AnimateSequence(arg_1_0, "HidePrompt")
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")

		if arg_1_1.layoutAnim then
			ACTIONS.AnimateSequence(arg_1_0, "ARTitle")
		end
	end
end

local function var_0_2(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0._controllerIndex = arg_6_1
	arg_6_0.SetupButton = var_0_1
end

function SeasonalEventButtonPrompt(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 190 * _1080p)

	var_7_0.id = "SeasonalEventButtonPrompt"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Background"

	var_7_4:SetAlpha(0.8, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Background = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "TextBacker"

	var_7_6:SetRGBFromInt(0, 0)
	var_7_6:SetAlpha(0.6, 0)
	var_7_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -75, 0)
	var_7_0:addElement(var_7_6)

	var_7_0.TextBacker = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIImage.new()

	var_7_8.id = "CheckboxBacking"

	var_7_8:SetRGBFromTable(SWATCHES.CH2.CH2DarkBlue, 0)
	var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 27, _1080p * 160, _1080p * 181)
	var_7_0:addElement(var_7_8)

	var_7_0.CheckboxBacking = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIImage.new()

	var_7_10.id = "TopHighlight"

	var_7_10:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_7_10:SetAlpha(0.5, 0)
	var_7_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
	var_7_0:addElement(var_7_10)

	var_7_0.TopHighlight = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIImage.new()

	var_7_12.id = "BotHighlight"

	var_7_12:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_7_12:SetAlpha(0.5, 0)
	var_7_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, 0)
	var_7_0:addElement(var_7_12)

	var_7_0.BotHighlight = var_7_12

	local var_7_13
	local var_7_14 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
		controllerIndex = var_7_1
	})

	var_7_14.id = "SnipeIcon"

	var_7_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -100, 0, _1080p * 120, _1080p * 145)
	var_7_0:addElement(var_7_14)

	var_7_0.SnipeIcon = var_7_14

	local var_7_15
	local var_7_16 = LUI.UIStyledText.new()

	var_7_16.id = "Title"

	var_7_16:setText("", 0)
	var_7_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_16:SetAlignment(LUI.Alignment.Left)
	var_7_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 282, _1080p * 128, _1080p * 152)
	var_7_0:addElement(var_7_16)

	var_7_0.Title = var_7_16

	local var_7_17
	local var_7_18 = LUI.UIImage.new()

	var_7_18.id = "Checkbox"

	var_7_18:SetRGBFromTable(SWATCHES.EventPromos.OutbreakRed, 0)
	var_7_18:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_7_18:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 6, _1080p * 27, _1080p * -30, _1080p * -9)
	var_7_0:addElement(var_7_18)

	var_7_0.Checkbox = var_7_18

	local var_7_19
	local var_7_20 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_7_21 = LUI.UIBorder.new(var_7_20)

	var_7_21.id = "CheckboxFrame"

	var_7_21:SetRGBFromTable(SWATCHES.EventPromos.OutbreakRed, 0)
	var_7_21:SetBorderThicknessLeft(_1080p * 2, 0)
	var_7_21:SetBorderThicknessRight(_1080p * 2, 0)
	var_7_21:SetBorderThicknessTop(_1080p * 2, 0)
	var_7_21:SetBorderThicknessBottom(_1080p * 2, 0)
	var_7_21:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 6, _1080p * 27, _1080p * -30, _1080p * -9)
	var_7_0:addElement(var_7_21)

	var_7_0.CheckboxFrame = var_7_21

	local var_7_22
	local var_7_23 = LUI.UIStyledText.new()

	var_7_23.id = "Desc"

	var_7_23:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_7_23:setText("", 0)
	var_7_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_23:SetLeading(-4 * _1080p, 0)
	var_7_23:SetAlignment(LUI.Alignment.Left)
	var_7_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 16, _1080p * 409, _1080p * 143, _1080p * 163)
	var_7_0:addElement(var_7_23)

	var_7_0.Desc = var_7_23

	local var_7_24
	local var_7_25 = LUI.UIStyledText.new()

	var_7_25.id = "Subheader"

	var_7_25:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_7_25:setText("", 0)
	var_7_25:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_25:SetWordWrap(false)
	var_7_25:SetAlignment(LUI.Alignment.Left)
	var_7_25:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_25:SetStartupDelay(1000)
	var_7_25:SetLineHoldTime(400)
	var_7_25:SetAnimMoveTime(150)
	var_7_25:SetAnimMoveSpeed(50)
	var_7_25:SetEndDelay(1000)
	var_7_25:SetCrossfadeTime(400)
	var_7_25:SetFadeInTime(300)
	var_7_25:SetFadeOutTime(300)
	var_7_25:SetMaxVisibleLines(1)
	var_7_25:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 16, _1080p * -32, _1080p * 119, _1080p * 143)
	var_7_0:addElement(var_7_25)

	var_7_0.Subheader = var_7_25

	local var_7_26
	local var_7_27 = LUI.UIText.new()

	var_7_27.id = "StaticSubheader"

	var_7_27:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_7_27:SetAlpha(0, 0)
	var_7_27:setText("", 0)
	var_7_27:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_7_27:SetAlignment(LUI.Alignment.Left)
	var_7_27:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 134, _1080p * 150)
	var_7_0:addElement(var_7_27)

	var_7_0.StaticSubheader = var_7_27

	local var_7_28
	local var_7_29 = LUI.UIImage.new()

	var_7_29.id = "NewItemNotification"

	var_7_29:SetAlpha(0, 0)
	var_7_29:SetPixelGridEnabled(true)
	var_7_29:SetPixelGridContrast(0.2, 0)
	var_7_29:SetPixelGridBlockWidth(1, 0)
	var_7_29:SetPixelGridBlockHeight(1, 0)
	var_7_29:SetPixelGridGutterWidth(1, 0)
	var_7_29:SetPixelGridGutterHeight(1, 0)
	var_7_29:setImage(RegisterMaterial("icon_new_store_pulse"), 0)
	var_7_29:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -33, _1080p * -5, _1080p * 4, _1080p * 32)
	var_7_0:addElement(var_7_29)

	var_7_0.NewItemNotification = var_7_29

	local var_7_30
	local var_7_31 = LUI.UIImage.new()

	var_7_31.id = "DisabledMask"

	var_7_31:SetRGBFromInt(3158064, 0)
	var_7_31:SetAlpha(0, 0)
	var_7_31:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, 0, _1080p * 190)
	var_7_0:addElement(var_7_31)

	var_7_0.DisabledMask = var_7_31

	local var_7_32
	local var_7_33 = MenuBuilder.BuildRegisteredType("SeasonalEventLiveTag", {
		controllerIndex = var_7_1
	})

	var_7_33.id = "LiveTag"

	var_7_33:SetAlpha(0, 0)
	var_7_33:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -60, _1080p * 5, _1080p * -7, _1080p * 20)
	var_7_0:addElement(var_7_33)

	var_7_0.LiveTag = var_7_33

	local var_7_34
	local var_7_35 = LUI.UIText.new()

	var_7_35.id = "DisableDescribe"

	var_7_35:SetAlpha(0, 0)
	var_7_35:setText("", 0)
	var_7_35:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_35:SetAlignment(LUI.Alignment.Center)
	var_7_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -18, _1080p * 482, _1080p * 166, _1080p * 190)
	var_7_0:addElement(var_7_35)

	var_7_0.DisableDescribe = var_7_35

	local function var_7_36()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_36

	local var_7_37
	local var_7_38 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("CrossLaunchLayout", var_7_38)

	local var_7_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -75
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("CrossLaunchLayout", var_7_39)

	local var_7_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("CrossLaunchLayout", var_7_40)

	local var_7_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.TabMenuNoFocus
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("CrossLaunchLayout", var_7_41)

	local var_7_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.TabMenuNoFocus
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("CrossLaunchLayout", var_7_42)

	local var_7_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -124
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 26
		}
	}

	var_7_14:RegisterAnimationSequence("CrossLaunchLayout", var_7_43)

	local var_7_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/CROSS_LAUNCH_PROMPT_OUTBREAK")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 292
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("CrossLaunchLayout", var_7_44)

	local var_7_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_18:RegisterAnimationSequence("CrossLaunchLayout", var_7_45)

	local var_7_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_21:RegisterAnimationSequence("CrossLaunchLayout", var_7_46)

	local var_7_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT_OUTBREAK_DESC_1")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 417
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 143
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_23:RegisterAnimationSequence("CrossLaunchLayout", var_7_47)

	local var_7_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 120
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 144
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT_OUTBREAK_HEADER_1")
		}
	}

	var_7_25:RegisterAnimationSequence("CrossLaunchLayout", var_7_48)

	local function var_7_49()
		var_7_4:AnimateSequence("CrossLaunchLayout")
		var_7_6:AnimateSequence("CrossLaunchLayout")
		var_7_8:AnimateSequence("CrossLaunchLayout")
		var_7_10:AnimateSequence("CrossLaunchLayout")
		var_7_12:AnimateSequence("CrossLaunchLayout")
		var_7_14:AnimateSequence("CrossLaunchLayout")
		var_7_16:AnimateSequence("CrossLaunchLayout")
		var_7_18:AnimateSequence("CrossLaunchLayout")
		var_7_21:AnimateSequence("CrossLaunchLayout")
		var_7_23:AnimateSequence("CrossLaunchLayout")
		var_7_25:AnimateSequence("CrossLaunchLayout")
	end

	var_7_0._sequences.CrossLaunchLayout = var_7_49

	local var_7_50
	local var_7_51 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("StoreBundleLayout", var_7_51)

	local var_7_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -101
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("StoreBundleLayout", var_7_52)

	local var_7_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("StoreBundleLayout", var_7_53)

	local var_7_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.TabMenuNoFocus
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("StoreBundleLayout", var_7_54)

	local var_7_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.TabMenuNoFocus
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("StoreBundleLayout", var_7_55)

	local var_7_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("StoreBundleLayout", var_7_56)

	local var_7_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 165
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 184
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 286
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/STORE_BUNDLE_PROMPT_TITLE")
		}
	}

	var_7_16:RegisterAnimationSequence("StoreBundleLayout", var_7_57)

	local var_7_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_18:RegisterAnimationSequence("StoreBundleLayout", var_7_58)

	local var_7_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_21:RegisterAnimationSequence("StoreBundleLayout", var_7_59)

	local var_7_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 403
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 117
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 137
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.TabMenuNoFocus
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT_DESC_1")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_23:RegisterAnimationSequence("StoreBundleLayout", var_7_60)

	local var_7_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 92
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 116
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/STORE_BUNDLE_PROMPT_SUBHEADER")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericButtonLine
		}
	}

	var_7_25:RegisterAnimationSequence("StoreBundleLayout", var_7_61)

	local var_7_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 145
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 190
		}
	}

	var_7_35:RegisterAnimationSequence("StoreBundleLayout", var_7_62)

	local function var_7_63()
		var_7_4:AnimateSequence("StoreBundleLayout")
		var_7_6:AnimateSequence("StoreBundleLayout")
		var_7_8:AnimateSequence("StoreBundleLayout")
		var_7_10:AnimateSequence("StoreBundleLayout")
		var_7_12:AnimateSequence("StoreBundleLayout")
		var_7_14:AnimateSequence("StoreBundleLayout")
		var_7_16:AnimateSequence("StoreBundleLayout")
		var_7_18:AnimateSequence("StoreBundleLayout")
		var_7_21:AnimateSequence("StoreBundleLayout")
		var_7_23:AnimateSequence("StoreBundleLayout")
		var_7_25:AnimateSequence("StoreBundleLayout")
		var_7_35:AnimateSequence("StoreBundleLayout")
	end

	var_7_0._sequences.StoreBundleLayout = var_7_63

	local var_7_64
	local var_7_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("MouseOver", var_7_65)

	local var_7_66 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("MouseOver", var_7_66)

	local var_7_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_7_10:RegisterAnimationSequence("MouseOver", var_7_67)

	local var_7_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_7_12:RegisterAnimationSequence("MouseOver", var_7_68)

	local var_7_69 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("MouseOver", var_7_69)

	local var_7_70 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_25:RegisterAnimationSequence("MouseOver", var_7_70)

	local function var_7_71()
		var_7_4:AnimateSequence("MouseOver")
		var_7_6:AnimateSequence("MouseOver")
		var_7_10:AnimateSequence("MouseOver")
		var_7_12:AnimateSequence("MouseOver")
		var_7_16:AnimateSequence("MouseOver")
		var_7_25:AnimateSequence("MouseOver")
	end

	var_7_0._sequences.MouseOver = var_7_71

	local var_7_72
	local var_7_73 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("MouseUp", var_7_73)

	local var_7_74 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("MouseUp", var_7_74)

	local var_7_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBorder
		}
	}

	var_7_10:RegisterAnimationSequence("MouseUp", var_7_75)

	local var_7_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBorder
		}
	}

	var_7_12:RegisterAnimationSequence("MouseUp", var_7_76)

	local var_7_77 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("MouseUp", var_7_77)

	local var_7_78 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_25:RegisterAnimationSequence("MouseUp", var_7_78)

	local function var_7_79()
		var_7_4:AnimateSequence("MouseUp")
		var_7_6:AnimateSequence("MouseUp")
		var_7_10:AnimateSequence("MouseUp")
		var_7_12:AnimateSequence("MouseUp")
		var_7_16:AnimateSequence("MouseUp")
		var_7_25:AnimateSequence("MouseUp")
	end

	var_7_0._sequences.MouseUp = var_7_79

	local var_7_80
	local var_7_81 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_29:RegisterAnimationSequence("ModNewShow", var_7_81)

	local function var_7_82()
		var_7_29:AnimateSequence("ModNewShow")
	end

	var_7_0._sequences.ModNewShow = var_7_82

	local var_7_83
	local var_7_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_29:RegisterAnimationSequence("ModNewHide", var_7_84)

	local function var_7_85()
		var_7_29:AnimateSequence("ModNewHide")
	end

	var_7_0._sequences.ModNewHide = var_7_85

	local var_7_86
	local var_7_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ModPeriodicEventShow", var_7_87)

	local var_7_88 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_33:RegisterAnimationSequence("ModPeriodicEventShow", var_7_88)

	local function var_7_89()
		var_7_14:AnimateSequence("ModPeriodicEventShow")
		var_7_33:AnimateSequence("ModPeriodicEventShow")
	end

	var_7_0._sequences.ModPeriodicEventShow = var_7_89

	local var_7_90
	local var_7_91 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ModPeriodicEventHide", var_7_91)

	local var_7_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_33:RegisterAnimationSequence("ModPeriodicEventHide", var_7_92)

	local function var_7_93()
		var_7_14:AnimateSequence("ModPeriodicEventHide")
		var_7_33:AnimateSequence("ModPeriodicEventHide")
	end

	var_7_0._sequences.ModPeriodicEventHide = var_7_93

	local var_7_94
	local var_7_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/CROSS_LAUNCH_PROMPT_OUTBREAK")
		}
	}

	var_7_16:RegisterAnimationSequence("ModNoCrossLaunchOnButtonAction", var_7_95)

	local function var_7_96()
		var_7_16:AnimateSequence("ModNoCrossLaunchOnButtonAction")
	end

	var_7_0._sequences.ModNoCrossLaunchOnButtonAction = var_7_96

	local var_7_97
	local var_7_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/CROSS_LAUNCH_PROMPT_ZOMBIES_TITLE")
		}
	}

	var_7_16:RegisterAnimationSequence("ModCrossLaunchOnButtonAction", var_7_98)

	local function var_7_99()
		var_7_16:AnimateSequence("ModCrossLaunchOnButtonAction")
	end

	var_7_0._sequences.ModCrossLaunchOnButtonAction = var_7_99

	local var_7_100
	local var_7_101 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_31:RegisterAnimationSequence("Disabled", var_7_101)

	local function var_7_102()
		var_7_31:AnimateSequence("Disabled")
	end

	var_7_0._sequences.Disabled = var_7_102

	local function var_7_103()
		return
	end

	var_7_0._sequences.AR = var_7_103

	local function var_7_104()
		return
	end

	var_7_0._sequences.ARTitle = var_7_104

	local var_7_105
	local var_7_106 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("HidePrompt", var_7_106)

	local function var_7_107()
		var_7_16:AnimateSequence("HidePrompt")
	end

	var_7_0._sequences.HidePrompt = var_7_107

	local var_7_108
	local var_7_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_store_bundles_340_bundle")
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -46
		}
	}

	var_7_4:RegisterAnimationSequence("SetupSeasonalEventStoreBundleLayout", var_7_109)

	local var_7_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -130
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_bottom_to_top")
		}
	}

	var_7_6:RegisterAnimationSequence("SetupSeasonalEventStoreBundleLayout", var_7_110)

	local var_7_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("SetupSeasonalEventStoreBundleLayout", var_7_111)

	local var_7_112 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		}
	}

	var_7_10:RegisterAnimationSequence("SetupSeasonalEventStoreBundleLayout", var_7_112)

	local var_7_113 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("SetupSeasonalEventStoreBundleLayout", var_7_113)

	local var_7_114 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("SetupSeasonalEventStoreBundleLayout", var_7_114)

	local var_7_115 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 160
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 184
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 407
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/STORE_BUNDLE_PROMPT_TITLE")
		}
	}

	var_7_16:RegisterAnimationSequence("SetupSeasonalEventStoreBundleLayout", var_7_115)

	local var_7_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_18:RegisterAnimationSequence("SetupSeasonalEventStoreBundleLayout", var_7_116)

	local var_7_117 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_21:RegisterAnimationSequence("SetupSeasonalEventStoreBundleLayout", var_7_117)

	local var_7_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 403
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 117
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 137
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.TabMenuNoFocus
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/CONTENT_DESC_1")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_23:RegisterAnimationSequence("SetupSeasonalEventStoreBundleLayout", var_7_118)

	local var_7_119 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 131
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 155
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ345/STORE_BUNDLE_PROMPT_SUBHEADER")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_7_25:RegisterAnimationSequence("SetupSeasonalEventStoreBundleLayout", var_7_119)

	local var_7_120 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 145
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 190
		}
	}

	var_7_35:RegisterAnimationSequence("SetupSeasonalEventStoreBundleLayout", var_7_120)

	local function var_7_121()
		var_7_4:AnimateSequence("SetupSeasonalEventStoreBundleLayout")
		var_7_6:AnimateSequence("SetupSeasonalEventStoreBundleLayout")
		var_7_8:AnimateSequence("SetupSeasonalEventStoreBundleLayout")
		var_7_10:AnimateSequence("SetupSeasonalEventStoreBundleLayout")
		var_7_12:AnimateSequence("SetupSeasonalEventStoreBundleLayout")
		var_7_14:AnimateSequence("SetupSeasonalEventStoreBundleLayout")
		var_7_16:AnimateSequence("SetupSeasonalEventStoreBundleLayout")
		var_7_18:AnimateSequence("SetupSeasonalEventStoreBundleLayout")
		var_7_21:AnimateSequence("SetupSeasonalEventStoreBundleLayout")
		var_7_23:AnimateSequence("SetupSeasonalEventStoreBundleLayout")
		var_7_25:AnimateSequence("SetupSeasonalEventStoreBundleLayout")
		var_7_35:AnimateSequence("SetupSeasonalEventStoreBundleLayout")
	end

	var_7_0._sequences.SetupSeasonalEventStoreBundleLayout = var_7_121

	var_0_2(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("SeasonalEventButtonPrompt", SeasonalEventButtonPrompt)
LockTable(_M)
