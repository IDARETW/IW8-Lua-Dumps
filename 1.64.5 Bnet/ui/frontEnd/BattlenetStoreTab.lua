module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	function arg_1_0.Setup(arg_2_0, arg_2_1)
		arg_2_0.TabText:setText(ToUpperCase(arg_2_1.name))
	end

	function arg_1_0.Enable(arg_3_0)
		arg_3_0._disabled = false

		ACTIONS.AnimateSequence(arg_3_0, "UnFocused")
	end

	function arg_1_0.Disable(arg_4_0)
		arg_4_0._disabled = true

		ACTIONS.AnimateSequence(arg_4_0, "Disabled")
	end

	function arg_1_0.IsEnabled(arg_5_0)
		return not arg_5_0._disabled
	end

	arg_1_0:registerEventHandler("focus_tab", function(arg_6_0, arg_6_1)
		if arg_6_1.index == arg_6_0.index then
			if arg_6_1.playSound then
				arg_6_0._sequences.Focused()
			else
				arg_6_0._sequences.FocusedNoSound()
			end

			arg_6_0.focused = true
		elseif arg_6_0.focused then
			arg_6_0._sequences.UnFocused()

			arg_6_0.focused = false

			arg_6_0._sequences.Loop()
		end

		arg_6_0.TabText:SetParentHasFocus(not not arg_6_0.focused)
	end)
	arg_1_0:SetHandleMouse(true)
	arg_1_0:registerEventHandler("mouseenter", function(arg_7_0, arg_7_1)
		if not arg_7_0.focused then
			if not arg_7_0._disabled then
				arg_7_0._sequences.Highlighted()
			else
				arg_7_0._sequences.Focused()
			end
		else
			arg_7_0._sequences.Highlighted()
		end
	end)
	arg_1_0:registerEventHandler("mouseleave", function(arg_8_0, arg_8_1)
		if arg_8_0.focused and not arg_8_0._disabled then
			arg_8_0._sequences.FocusedNoSound()
		else
			arg_8_0._sequences.UnFocused()

			if arg_8_0._disabled then
				arg_8_0._sequences.Disabled()
			end
		end

		arg_8_0._sequences.Loop()
		arg_8_0:setFocus(false)
	end)
	arg_1_0:registerEventHandler("leftmousedown", function(arg_9_0, arg_9_1)
		return
	end)
	arg_1_0:registerEventHandler("leftmouseup", function(arg_10_0, arg_10_1)
		if arg_10_1.inside and not arg_10_0._disabled then
			arg_10_0:playSound("menu_open")
			arg_10_0:dispatchEventToCurrentMenu({
				name = "tab_mouse_select",
				index = arg_10_0.index
			})
			arg_10_0._sequences.Highlighted()
		end
	end)
	arg_1_0:registerEventHandler("tab_disable_blur", function(arg_11_0, arg_11_1)
		ACTIONS.AnimateSequence(arg_11_0, "NoBlur")
	end)
	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "disabled", function(arg_12_0)
		if DataModel.JJEHAEBDF(arg_12_0) then
			arg_1_0:Disable()
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	elseif IsLanguageKorean() or IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_1_0, "KORZH")
	elseif IsLanguageGerman() then
		ACTIONS.AnimateSequence(arg_1_0, "DE")
	elseif IsLanguageRussian() then
		ACTIONS.AnimateSequence(arg_1_0, "RU")
	end
end

function BattlenetStoreTab(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIElement.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 52 * _1080p)

	var_13_0.id = "BattlenetStoreTab"
	var_13_0._animationSets = {}
	var_13_0._sequences = {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = LUI.UIImage.new()

	var_13_4.id = "Backer"

	var_13_4:SetRGBFromTable(SWATCHES.tabManager.tabBackground, 0)
	var_13_4:SetAlpha(0, 0)
	var_13_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_13_0:addElement(var_13_4)

	var_13_0.Backer = var_13_4

	local var_13_5
	local var_13_6 = LUI.UIImage.new()

	var_13_6.id = "MW"

	var_13_6:SetRGBFromInt(3034734, 0)
	var_13_6:SetAlpha(0.7, 0)
	var_13_6:setImage(RegisterMaterial("logo_mw_fadeout"), 0)
	var_13_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -40, _1080p * 40, _1080p * -22, _1080p * -2)
	var_13_0:addElement(var_13_6)

	var_13_0.MW = var_13_6

	local var_13_7
	local var_13_8 = LUI.UIImage.new()

	var_13_8.id = "MWGradient"

	var_13_8:SetRGBFromInt(4043488, 0)
	var_13_8:SetAlpha(0.2, 0)
	var_13_8:SetPixelGridEnabled(true)
	var_13_8:SetPixelGridContrast(0.95, 0)
	var_13_8:SetPixelGridBlockWidth(2, 0)
	var_13_8:SetPixelGridBlockHeight(2, 0)
	var_13_8:SetPixelGridGutterWidth(1, 0)
	var_13_8:SetPixelGridGutterHeight(1, 0)
	var_13_8:setImage(RegisterMaterial("logo_mw_glow"), 0)
	var_13_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -40, _1080p * 40, _1080p * -22, _1080p * -2)
	var_13_0:addElement(var_13_8)

	var_13_0.MWGradient = var_13_8

	local var_13_9
	local var_13_10 = LUI.UIStyledText.new()

	var_13_10.id = "TabText"

	var_13_10:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_13_10:setText(Engine.CBBHFCGDIC("MENU/PRE_PURCHASE"), 0)
	var_13_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_13_10:SetAlignment(LUI.Alignment.Center)
	var_13_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_13_10:SetShadowRGBFromTable(SWATCHES.tabManager.tabTextFocused, 0)
	var_13_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -9, _1080p * 9)
	var_13_0:addElement(var_13_10)

	var_13_0.TabText = var_13_10

	local var_13_11
	local var_13_12 = LUI.UIImage.new()

	var_13_12.id = "DiamondGlow"

	var_13_12:SetRGBFromInt(10412540, 0)
	var_13_12:SetAlpha(0.1, 0)
	var_13_12:setImage(RegisterMaterial("diamond_glow"), 0)
	var_13_12:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_13_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -77, _1080p * 77, _1080p * -52, _1080p * 20)
	var_13_0:addElement(var_13_12)

	var_13_0.DiamondGlow = var_13_12

	local var_13_13
	local var_13_14 = LUI.UIImage.new()

	var_13_14.id = "DisabledIcon"

	var_13_14:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_13_14:SetAlpha(0, 0)
	var_13_14:setImage(RegisterMaterial("icon_lock"), 0)
	var_13_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * 18, _1080p * -19, _1080p * 17)
	var_13_0:addElement(var_13_14)

	var_13_0.DisabledIcon = var_13_14

	local var_13_15
	local var_13_16 = LUI.UIImage.new()

	var_13_16.id = "ChangeIndicator"

	var_13_16:SetAlpha(0, 0)
	var_13_16:setImage(RegisterMaterial("ui_changed_indicator"), 0)
	var_13_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -32, 0, 0, _1080p * 32)
	var_13_0:addElement(var_13_16)

	var_13_0.ChangeIndicator = var_13_16

	local var_13_17
	local var_13_18 = LUI.UIImage.new()

	var_13_18.id = "Highlight"

	var_13_18:SetRGBFromTable(SWATCHES.tabManager.tabFrame, 0)
	var_13_18:SetAlpha(0, 0)
	var_13_18:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -4, 0)
	var_13_0:addElement(var_13_18)

	var_13_0.Highlight = var_13_18

	local function var_13_19()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_19

	local var_13_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 38
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 17
		},
		{
			value = 0.3,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_13_4:RegisterAnimationSequence("Focused", var_13_20)

	local var_13_21 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextFocused
		},
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = -0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		}
	}

	var_13_10:RegisterAnimationSequence("Focused", var_13_21)

	local var_13_22 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_13_16:RegisterAnimationSequence("Focused", var_13_22)

	local var_13_23 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_18:RegisterAnimationSequence("Focused", var_13_23)

	local function var_13_24()
		var_13_4:AnimateSequence("Focused")
		var_13_10:AnimateSequence("Focused")
		var_13_16:AnimateSequence("Focused")
		var_13_18:AnimateSequence("Focused")
	end

	var_13_0._sequences.Focused = var_13_24

	local var_13_25 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("UnFocused", var_13_25)

	local var_13_26 = {
		{
			value = 0.7,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 3034734,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_13_6:RegisterAnimationSequence("UnFocused", var_13_26)

	local var_13_27 = {
		{
			value = 0.2,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_8:RegisterAnimationSequence("UnFocused", var_13_27)

	local var_13_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("UnFocused", var_13_28)

	local var_13_29 = {
		{
			value = 0.1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -52
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		}
	}

	var_13_12:RegisterAnimationSequence("UnFocused", var_13_29)

	local var_13_30 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("UnFocused", var_13_30)

	local var_13_31 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_13_16:RegisterAnimationSequence("UnFocused", var_13_31)

	local var_13_32 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_18:RegisterAnimationSequence("UnFocused", var_13_32)

	local function var_13_33()
		var_13_4:AnimateSequence("UnFocused")
		var_13_6:AnimateSequence("UnFocused")
		var_13_8:AnimateSequence("UnFocused")
		var_13_10:AnimateSequence("UnFocused")
		var_13_12:AnimateSequence("UnFocused")
		var_13_14:AnimateSequence("UnFocused")
		var_13_16:AnimateSequence("UnFocused")
		var_13_18:AnimateSequence("UnFocused")
	end

	var_13_0._sequences.UnFocused = var_13_33

	local function var_13_34()
		return
	end

	var_13_0._sequences.Locked = var_13_34

	local var_13_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("Disabled", var_13_35)

	local var_13_36 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("Disabled", var_13_36)

	local var_13_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("Disabled", var_13_37)

	local function var_13_38()
		var_13_4:AnimateSequence("Disabled")
		var_13_10:AnimateSequence("Disabled")
		var_13_14:AnimateSequence("Disabled")
	end

	var_13_0._sequences.Disabled = var_13_38

	local var_13_39 = {
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("Highlighted", var_13_39)

	local var_13_40 = {
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 3105432,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_13_6:RegisterAnimationSequence("Highlighted", var_13_40)

	local var_13_41 = {
		{
			value = 0.42,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_8:RegisterAnimationSequence("Highlighted", var_13_41)

	local var_13_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextFocused
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("Highlighted", var_13_42)

	local var_13_43 = {
		{
			value = 0.35,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 41
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -87
		}
	}

	var_13_12:RegisterAnimationSequence("Highlighted", var_13_43)

	local function var_13_44()
		var_13_4:AnimateSequence("Highlighted")
		var_13_6:AnimateSequence("Highlighted")
		var_13_8:AnimateSequence("Highlighted")
		var_13_10:AnimateSequence("Highlighted")
		var_13_12:AnimateSequence("Highlighted")
	end

	var_13_0._sequences.Highlighted = var_13_44

	local var_13_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_16:RegisterAnimationSequence("Changed", var_13_45)

	local function var_13_46()
		var_13_16:AnimateSequence("Changed")
	end

	var_13_0._sequences.Changed = var_13_46

	local var_13_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_16:RegisterAnimationSequence("NotChanged", var_13_47)

	local function var_13_48()
		var_13_16:AnimateSequence("NotChanged")
	end

	var_13_0._sequences.NotChanged = var_13_48

	local var_13_49 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("FocusedNoSound", var_13_49)

	local var_13_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextFocused
		},
		{
			value = -0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		}
	}

	var_13_10:RegisterAnimationSequence("FocusedNoSound", var_13_50)

	local var_13_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_13_16:RegisterAnimationSequence("FocusedNoSound", var_13_51)

	local var_13_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_18:RegisterAnimationSequence("FocusedNoSound", var_13_52)

	local function var_13_53()
		var_13_4:AnimateSequence("FocusedNoSound")
		var_13_10:AnimateSequence("FocusedNoSound")
		var_13_16:AnimateSequence("FocusedNoSound")
		var_13_18:AnimateSequence("FocusedNoSound")
	end

	var_13_0._sequences.FocusedNoSound = var_13_53

	local var_13_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		}
	}

	var_13_10:RegisterAnimationSequence("AR", var_13_54)

	local function var_13_55()
		var_13_10:AnimateSequence("AR")
	end

	var_13_0._sequences.AR = var_13_55

	local var_13_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		}
	}

	var_13_10:RegisterAnimationSequence("KORZH", var_13_56)

	local function var_13_57()
		var_13_10:AnimateSequence("KORZH")
	end

	var_13_0._sequences.KORZH = var_13_57

	local var_13_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		}
	}

	var_13_10:RegisterAnimationSequence("DE", var_13_58)

	local function var_13_59()
		var_13_10:AnimateSequence("DE")
	end

	var_13_0._sequences.DE = var_13_59

	local var_13_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		}
	}

	var_13_10:RegisterAnimationSequence("RU", var_13_60)

	local function var_13_61()
		var_13_10:AnimateSequence("RU")
	end

	var_13_0._sequences.RU = var_13_61

	local var_13_62 = {
		{
			value = 0.42,
			duration = 1100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0.42,
			duration = 800,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 1480,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0.2,
			duration = 760,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_8:RegisterAnimationSequence("Loop", var_13_62)

	local var_13_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		},
		{
			value = 0.22,
			duration = 1100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 1100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 41
		},
		{
			duration = 1100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -87
		},
		{
			value = 0.22,
			duration = 800,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 800,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 41
		},
		{
			duration = 800,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -87
		},
		{
			duration = 1480,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -52
		},
		{
			duration = 1480,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		},
		{
			value = 0.1,
			duration = 1480,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 760,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -52
		},
		{
			duration = 760,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		},
		{
			value = 0.1,
			duration = 760,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("Loop", var_13_63)

	local function var_13_64()
		var_13_8:AnimateLoop("Loop")
		var_13_12:AnimateLoop("Loop")
	end

	var_13_0._sequences.Loop = var_13_64

	var_0_0(var_13_0, var_13_1, arg_13_1)
	ACTIONS.AnimateSequence(var_13_0, "Loop")

	return var_13_0
end

MenuBuilder.registerType("BattlenetStoreTab", BattlenetStoreTab)
LockTable(_M)
