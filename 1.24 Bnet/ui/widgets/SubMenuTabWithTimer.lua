module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.NewItemSmallIcon:UpdateAlpha(arg_1_1 and 1 or 0)
end

local function var_0_1(arg_2_0, arg_2_1)
	local function var_2_0()
		local var_3_0 = Engine.DEIDGHDBHD()
		local var_3_1 = arg_2_1 - var_3_0

		if var_3_1 > 0 then
			arg_2_0.TimerText:SetAlpha(1)
			arg_2_0.TimerText:setText(Engine.JCBDICCAH(Engine.BJCFFHAIFA(var_3_1)))
		else
			arg_2_0.TimerText:SetAlpha(0)
		end
	end

	if not arg_2_0.countDownTimer then
		arg_2_0.countDownTimer = LUI.UITimer.new({
			interval = 1000,
			event = "update_timer"
		})
		arg_2_0.countDownTimer.id = "countDownTimer"

		arg_2_0:addElement(arg_2_0.countDownTimer)
		var_2_0()
		arg_2_0:addEventHandler("update_timer", function(arg_4_0, arg_4_1)
			var_2_0()
		end)
	end
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._isBattlePassTab = false
	arg_5_0._controllerIndex = arg_5_1
	arg_5_0.SetupTimer = var_0_1

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_5_0, "WZ")
	end

	function arg_5_0.Setup(arg_6_0, arg_6_1)
		arg_6_0.TabText:setText(ToUpperCase(arg_6_1.name))

		if arg_6_1.hasNewItem then
			arg_6_0.NewItemSmallIcon:UpdateAlpha(arg_6_1.hasNewItem and 1 or 0)
		end
	end

	function arg_5_0.Enable(arg_7_0)
		arg_7_0._disabled = false

		ACTIONS.AnimateSequence(arg_7_0, "UnFocused")
	end

	function arg_5_0.Disable(arg_8_0)
		arg_8_0._disabled = true

		ACTIONS.AnimateSequence(arg_8_0, "Disabled")
	end

	function arg_5_0.IsEnabled(arg_9_0)
		return not arg_9_0._disabled
	end

	arg_5_0.SetBreadcrumb = var_0_0

	arg_5_0:registerEventHandler("focus_tab", function(arg_10_0, arg_10_1)
		if arg_10_1.index == arg_10_0.index then
			if arg_10_1.playSound then
				if CONDITIONS.IsMagmaGameMode() then
					ACTIONS.AnimateSequence(arg_10_0, "WZFocused")
				else
					ACTIONS.AnimateSequence(arg_10_0, "Focused")
				end
			elseif CONDITIONS.IsMagmaGameMode() then
				ACTIONS.AnimateSequence(arg_10_0, "WZFocusedNoSound")
			else
				ACTIONS.AnimateSequence(arg_10_0, "FocusedNoSound")
			end

			arg_10_0.focused = true
		elseif arg_10_0.focused then
			ACTIONS.AnimateSequence(arg_10_0, "UnFocused")

			arg_10_0.focused = false
		end

		arg_10_0.TabText:SetParentHasFocus(not not arg_10_0.focused)
	end)
	arg_5_0:SetHandleMouse(true)
	arg_5_0:registerEventHandler("mouseenter", function(arg_11_0, arg_11_1)
		Engine.BJDBIAGIDA(CoD.SFX.MouseOver)

		if not arg_11_0.focused then
			if not arg_11_0._disabled then
				if CONDITIONS.IsMagmaGameMode() then
					ACTIONS.AnimateSequence(arg_11_0, "WZHighlighted")
				else
					ACTIONS.AnimateSequence(arg_11_0, "Highlighted")
				end
			elseif CONDITIONS.IsMagmaGameMode() then
				ACTIONS.AnimateSequence(arg_11_0, "WZFocused")
			else
				ACTIONS.AnimateSequence(arg_11_0, "Focused")
			end
		elseif CONDITIONS.IsMagmaGameMode() then
			ACTIONS.AnimateSequence(arg_11_0, "WZHighlighted")
		else
			ACTIONS.AnimateSequence(arg_11_0, "Highlighted")
		end
	end)
	arg_5_0:registerEventHandler("mouseleave", function(arg_12_0, arg_12_1)
		if arg_12_0.focused and not arg_12_0._disabled then
			if CONDITIONS.IsMagmaGameMode() then
				ACTIONS.AnimateSequence(arg_12_0, "WZFocusedNoSound")
			else
				ACTIONS.AnimateSequence(arg_12_0, "FocusedNoSound")
			end
		else
			ACTIONS.AnimateSequence(arg_12_0, "UnFocused")

			if arg_12_0._disabled then
				ACTIONS.AnimateSequence(arg_12_0, "Disabled")
			end
		end

		arg_12_0:setFocus(false)
	end)
	arg_5_0:registerEventHandler("leftmousedown", function(arg_13_0, arg_13_1)
		return
	end)
	arg_5_0:registerEventHandler("leftmouseup", function(arg_14_0, arg_14_1)
		if arg_14_1.inside and not arg_14_0._disabled then
			arg_14_0:playSound("menu_open")
			arg_14_0:dispatchEventToCurrentMenu({
				name = "tab_mouse_select",
				index = arg_14_0.index
			})

			if CONDITIONS.IsMagmaGameMode() then
				ACTIONS.AnimateSequence(arg_14_0, "WZHighlighted")
			else
				ACTIONS.AnimateSequence(arg_14_0, "Highlighted")
			end
		end
	end)
	arg_5_0:registerEventHandler("tab_disable_blur", function(arg_15_0, arg_15_1)
		ACTIONS.AnimateSequence(arg_15_0, "NoBlur")
	end)
	arg_5_0:SubscribeToModelThroughElement(arg_5_0, "disabled", function(arg_16_0)
		if DataModel.JJEHAEBDF(arg_16_0) then
			arg_5_0:Disable()
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_5_0, "AR")
	elseif IsLanguageKorean() or IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_5_0, "KORZH")
	elseif IsLanguageGerman() then
		ACTIONS.AnimateSequence(arg_5_0, "DE")
	elseif IsLanguageRussian() then
		ACTIONS.AnimateSequence(arg_5_0, "RU")
	end
end

function SubMenuTabWithTimer(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIElement.new()

	var_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 52 * _1080p)

	var_17_0.id = "SubMenuTabWithTimer"
	var_17_0._animationSets = var_17_0._animationSets or {}
	var_17_0._sequences = var_17_0._sequences or {}

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = LUI.UIImage.new()

	var_17_4.id = "Backer"

	var_17_4:SetRGBFromTable(SWATCHES.tabManager.tabBackground, 0)
	var_17_4:SetAlpha(0, 0)
	var_17_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_17_0:addElement(var_17_4)

	var_17_0.Backer = var_17_4

	local var_17_5
	local var_17_6 = LUI.UIStyledText.new()

	var_17_6.id = "TabText"

	var_17_6:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_17_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_17_6:SetAlignment(LUI.Alignment.Center)
	var_17_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_17_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_17_6:SetStartupDelay(5000)
	var_17_6:SetLineHoldTime(4000)
	var_17_6:SetAnimMoveTime(500)
	var_17_6:SetAnimMoveSpeed(300)
	var_17_6:SetEndDelay(1000)
	var_17_6:SetCrossfadeTime(400)
	var_17_6:SetFadeInTime(300)
	var_17_6:SetFadeOutTime(300)
	var_17_6:SetMaxVisibleLines(2)
	var_17_6:SetShadowRGBFromTable(SWATCHES.tabManager.tabTextFocused, 0)
	var_17_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -9, _1080p * 9)

	local function var_17_7()
		local var_18_0 = var_17_0:GetDataSource().name:GetValue(var_17_1)

		if var_18_0 ~= nil then
			var_17_6:setText(var_18_0, 0)
		end
	end

	var_17_6:SubscribeToModelThroughElement(var_17_0, "name", var_17_7)
	var_17_0:addElement(var_17_6)

	var_17_0.TabText = var_17_6

	local var_17_8
	local var_17_9 = LUI.UIImage.new()

	var_17_9.id = "DisabledIcon"

	var_17_9:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_17_9:SetAlpha(0, 0)
	var_17_9:setImage(RegisterMaterial("icon_lock"), 0)
	var_17_9:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * 18, _1080p * -19, _1080p * 17)
	var_17_0:addElement(var_17_9)

	var_17_0.DisabledIcon = var_17_9

	local var_17_10
	local var_17_11 = LUI.UIImage.new()

	var_17_11.id = "ChangeIndicator"

	var_17_11:SetAlpha(0, 0)
	var_17_11:setImage(RegisterMaterial("ui_changed_indicator"), 0)
	var_17_11:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -32, 0, 0, _1080p * 32)
	var_17_0:addElement(var_17_11)

	var_17_0.ChangeIndicator = var_17_11

	local var_17_12
	local var_17_13 = LUI.UIImage.new()

	var_17_13.id = "Highlight"

	var_17_13:SetRGBFromTable(SWATCHES.tabManager.tabFrame, 0)
	var_17_13:SetAlpha(0, 0)
	var_17_13:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -4, 0)
	var_17_0:addElement(var_17_13)

	var_17_0.Highlight = var_17_13

	local var_17_14
	local var_17_15 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_17_1
	})

	var_17_15.id = "NewItemSmallIcon"

	var_17_15:SetAlpha(0, 0)
	var_17_15:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -18, _1080p * -10, _1080p * 10, _1080p * 18)
	var_17_0:addElement(var_17_15)

	var_17_0.NewItemSmallIcon = var_17_15

	local var_17_16
	local var_17_17 = LUI.UIText.new()

	var_17_17.id = "TimerText"

	var_17_17:setText("", 0)
	var_17_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_17:SetAlignment(LUI.Alignment.Center)
	var_17_17:SetVerticalAlignment(LUI.Alignment.Center)
	var_17_17:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 150, _1080p * 61, _1080p * 79)
	var_17_0:addElement(var_17_17)

	var_17_0.TimerText = var_17_17

	local var_17_18
	local var_17_19 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_17_1
	})

	var_17_19.id = "CheckBox"

	var_17_19:SetAlpha(0, 0)
	var_17_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 28, _1080p * 15, _1080p * 37)
	var_17_0:addElement(var_17_19)

	var_17_0.CheckBox = var_17_19

	local function var_17_20()
		return
	end

	var_17_0._sequences.DefaultSequence = var_17_20

	local var_17_21
	local var_17_22 = {
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

	var_17_4:RegisterAnimationSequence("Focused", var_17_22)

	local var_17_23 = {
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

	var_17_6:RegisterAnimationSequence("Focused", var_17_23)

	local var_17_24 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_17_11:RegisterAnimationSequence("Focused", var_17_24)

	local var_17_25 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_13:RegisterAnimationSequence("Focused", var_17_25)

	local function var_17_26()
		var_17_4:AnimateSequence("Focused")
		var_17_6:AnimateSequence("Focused")
		var_17_11:AnimateSequence("Focused")
		var_17_13:AnimateSequence("Focused")
	end

	var_17_0._sequences.Focused = var_17_26

	local var_17_27
	local var_17_28 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_4:RegisterAnimationSequence("UnFocused", var_17_28)

	local var_17_29 = {
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

	var_17_6:RegisterAnimationSequence("UnFocused", var_17_29)

	local var_17_30 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_9:RegisterAnimationSequence("UnFocused", var_17_30)

	local var_17_31 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_17_11:RegisterAnimationSequence("UnFocused", var_17_31)

	local var_17_32 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_13:RegisterAnimationSequence("UnFocused", var_17_32)

	local function var_17_33()
		var_17_4:AnimateSequence("UnFocused")
		var_17_6:AnimateSequence("UnFocused")
		var_17_9:AnimateSequence("UnFocused")
		var_17_11:AnimateSequence("UnFocused")
		var_17_13:AnimateSequence("UnFocused")
	end

	var_17_0._sequences.UnFocused = var_17_33

	local function var_17_34()
		return
	end

	var_17_0._sequences.Locked = var_17_34

	local var_17_35
	local var_17_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_4:RegisterAnimationSequence("Disabled", var_17_36)

	local var_17_37 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_6:RegisterAnimationSequence("Disabled", var_17_37)

	local var_17_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_9:RegisterAnimationSequence("Disabled", var_17_38)

	local function var_17_39()
		var_17_4:AnimateSequence("Disabled")
		var_17_6:AnimateSequence("Disabled")
		var_17_9:AnimateSequence("Disabled")
	end

	var_17_0._sequences.Disabled = var_17_39

	local var_17_40
	local var_17_41 = {
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_4:RegisterAnimationSequence("Highlighted", var_17_41)

	local var_17_42 = {
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

	var_17_6:RegisterAnimationSequence("Highlighted", var_17_42)

	local function var_17_43()
		var_17_4:AnimateSequence("Highlighted")
		var_17_6:AnimateSequence("Highlighted")
	end

	var_17_0._sequences.Highlighted = var_17_43

	local var_17_44
	local var_17_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_11:RegisterAnimationSequence("Changed", var_17_45)

	local function var_17_46()
		var_17_11:AnimateSequence("Changed")
	end

	var_17_0._sequences.Changed = var_17_46

	local var_17_47
	local var_17_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_11:RegisterAnimationSequence("NotChanged", var_17_48)

	local function var_17_49()
		var_17_11:AnimateSequence("NotChanged")
	end

	var_17_0._sequences.NotChanged = var_17_49

	local var_17_50
	local var_17_51 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_4:RegisterAnimationSequence("FocusedNoSound", var_17_51)

	local var_17_52 = {
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

	var_17_6:RegisterAnimationSequence("FocusedNoSound", var_17_52)

	local var_17_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_17_11:RegisterAnimationSequence("FocusedNoSound", var_17_53)

	local var_17_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_13:RegisterAnimationSequence("FocusedNoSound", var_17_54)

	local function var_17_55()
		var_17_4:AnimateSequence("FocusedNoSound")
		var_17_6:AnimateSequence("FocusedNoSound")
		var_17_11:AnimateSequence("FocusedNoSound")
		var_17_13:AnimateSequence("FocusedNoSound")
	end

	var_17_0._sequences.FocusedNoSound = var_17_55

	local var_17_56
	local var_17_57 = {
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

	var_17_6:RegisterAnimationSequence("AR", var_17_57)

	local function var_17_58()
		var_17_6:AnimateSequence("AR")
	end

	var_17_0._sequences.AR = var_17_58

	local var_17_59
	local var_17_60 = {
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

	var_17_6:RegisterAnimationSequence("KORZH", var_17_60)

	local function var_17_61()
		var_17_6:AnimateSequence("KORZH")
	end

	var_17_0._sequences.KORZH = var_17_61

	local var_17_62
	local var_17_63 = {
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

	var_17_6:RegisterAnimationSequence("DE", var_17_63)

	local function var_17_64()
		var_17_6:AnimateSequence("DE")
	end

	var_17_0._sequences.DE = var_17_64

	local var_17_65
	local var_17_66 = {
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

	var_17_6:RegisterAnimationSequence("RU", var_17_66)

	local function var_17_67()
		var_17_6:AnimateSequence("RU")
	end

	var_17_0._sequences.RU = var_17_67

	local var_17_68
	local var_17_69 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.wzBackground
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

	var_17_4:RegisterAnimationSequence("WZFocused", var_17_69)

	local var_17_70 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.wzTextFocused
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
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.tabManager.wzBackground
		}
	}

	var_17_6:RegisterAnimationSequence("WZFocused", var_17_70)

	local var_17_71 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_17_11:RegisterAnimationSequence("WZFocused", var_17_71)

	local var_17_72 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_13:RegisterAnimationSequence("WZFocused", var_17_72)

	local function var_17_73()
		var_17_4:AnimateSequence("WZFocused")
		var_17_6:AnimateSequence("WZFocused")
		var_17_11:AnimateSequence("WZFocused")
		var_17_13:AnimateSequence("WZFocused")
	end

	var_17_0._sequences.WZFocused = var_17_73

	local var_17_74
	local var_17_75 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.wzBackground
		}
	}

	var_17_4:RegisterAnimationSequence("WZFocusedNoSound", var_17_75)

	local var_17_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.wzTextFocused
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
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.tabManager.wzBackground
		}
	}

	var_17_6:RegisterAnimationSequence("WZFocusedNoSound", var_17_76)

	local var_17_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_17_11:RegisterAnimationSequence("WZFocusedNoSound", var_17_77)

	local var_17_78 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_13:RegisterAnimationSequence("WZFocusedNoSound", var_17_78)

	local function var_17_79()
		var_17_4:AnimateSequence("WZFocusedNoSound")
		var_17_6:AnimateSequence("WZFocusedNoSound")
		var_17_11:AnimateSequence("WZFocusedNoSound")
		var_17_13:AnimateSequence("WZFocusedNoSound")
	end

	var_17_0._sequences.WZFocusedNoSound = var_17_79

	local var_17_80
	local var_17_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.wzBackground
		},
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_4:RegisterAnimationSequence("WZHighlighted", var_17_81)

	local var_17_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.wzTextFocused
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.tabManager.wzBackground
		}
	}

	var_17_6:RegisterAnimationSequence("WZHighlighted", var_17_82)

	local function var_17_83()
		var_17_4:AnimateSequence("WZHighlighted")
		var_17_6:AnimateSequence("WZHighlighted")
	end

	var_17_0._sequences.WZHighlighted = var_17_83

	local var_17_84
	local var_17_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.wzTextFocused,
			child = var_17_0.CheckBox.Fill
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.wzBackground,
			child = var_17_0.CheckBox.Frame
		}
	}

	var_17_19:RegisterAnimationSequence("WZ", var_17_85)

	local function var_17_86()
		var_17_19:AnimateSequence("WZ")
	end

	var_17_0._sequences.WZ = var_17_86

	var_0_2(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("SubMenuTabWithTimer", SubMenuTabWithTimer)
LockTable(_M)
