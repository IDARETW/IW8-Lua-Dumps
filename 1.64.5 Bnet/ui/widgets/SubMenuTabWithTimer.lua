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

	function arg_5_0.Setup(arg_6_0, arg_6_1)
		arg_6_0.TabText:setText(ToUpperCase(arg_6_1.name))

		if arg_6_1.hasNewItem then
			arg_6_0.NewItemSmallIcon:UpdateAlpha(arg_6_1.hasNewItem and 1 or 0)
		end
	end

	arg_5_0.SetBreadcrumb = var_0_0

	TAB.SetUp(arg_5_0)
end

function SubMenuTabWithTimer(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 52 * _1080p)

	var_7_0.id = "SubMenuTabWithTimer"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_7_3 = LUI.UIImage.new()
		var_7_3.id = "WZWipBacker"

		var_7_3:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
		var_7_3:SetAlpha(0, 0)
		var_7_3:setImage(RegisterMaterial("ui_mp_wz_tab_highlight"), 0)
		var_7_3:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -8, 0)
		var_7_0:addElement(var_7_3)

		var_7_0.WZWipBacker = var_7_3
	end

	local var_7_4
	local var_7_5 = LUI.UIImage.new()

	var_7_5.id = "Backer"

	var_7_5:SetRGBFromTable(SWATCHES.tabManager.tabBackground, 0)
	var_7_5:SetAlpha(0, 0)
	var_7_5:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_7_0:addElement(var_7_5)

	var_7_0.Backer = var_7_5

	local var_7_6
	local var_7_7 = LUI.UIStyledText.new()

	var_7_7.id = "TabText"

	var_7_7:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_7_7:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_7:SetAlignment(LUI.Alignment.Center)
	var_7_7:SetVerticalAlignment(LUI.Alignment.Center)
	var_7_7:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_7_7:SetStartupDelay(5000)
	var_7_7:SetLineHoldTime(4000)
	var_7_7:SetAnimMoveTime(500)
	var_7_7:SetAnimMoveSpeed(300)
	var_7_7:SetEndDelay(1000)
	var_7_7:SetCrossfadeTime(400)
	var_7_7:SetFadeInTime(300)
	var_7_7:SetFadeOutTime(300)
	var_7_7:SetMaxVisibleLines(2)
	var_7_7:SetShadowRGBFromTable(SWATCHES.tabManager.tabTextFocused, 0)
	var_7_7:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -9, _1080p * 9)

	local function var_7_8()
		local var_8_0 = var_7_0:GetDataSource().name:GetValue(var_7_1)

		if var_8_0 ~= nil then
			var_7_7:setText(var_8_0, 0)
		end
	end

	var_7_7:SubscribeToModelThroughElement(var_7_0, "name", var_7_8)
	var_7_0:addElement(var_7_7)

	var_7_0.TabText = var_7_7

	local var_7_9
	local var_7_10 = LUI.UIImage.new()

	var_7_10.id = "DisabledIcon"

	var_7_10:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_7_10:SetAlpha(0, 0)
	var_7_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_7_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * 18, _1080p * -19, _1080p * 17)
	var_7_0:addElement(var_7_10)

	var_7_0.DisabledIcon = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIImage.new()

	var_7_12.id = "ChangeIndicator"

	var_7_12:SetAlpha(0, 0)
	var_7_12:setImage(RegisterMaterial("ui_changed_indicator"), 0)
	var_7_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -32, 0, 0, _1080p * 32)
	var_7_0:addElement(var_7_12)

	var_7_0.ChangeIndicator = var_7_12

	local var_7_13
	local var_7_14 = LUI.UIImage.new()

	var_7_14.id = "Highlight"

	var_7_14:SetRGBFromTable(SWATCHES.tabManager.tabFrame, 0)
	var_7_14:SetAlpha(0, 0)
	var_7_14:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -4, 0)
	var_7_0:addElement(var_7_14)

	var_7_0.Highlight = var_7_14

	local var_7_15
	local var_7_16 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_7_1
	})

	var_7_16.id = "NewItemSmallIcon"

	var_7_16:SetAlpha(0, 0)
	var_7_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -18, _1080p * -10, _1080p * 10, _1080p * 18)
	var_7_0:addElement(var_7_16)

	var_7_0.NewItemSmallIcon = var_7_16

	local var_7_17
	local var_7_18 = LUI.UIText.new()

	var_7_18.id = "TimerText"

	var_7_18:setText("", 0)
	var_7_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_18:SetAlignment(LUI.Alignment.Center)
	var_7_18:SetVerticalAlignment(LUI.Alignment.Center)
	var_7_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 150, _1080p * 50, _1080p * 68)
	var_7_0:addElement(var_7_18)

	var_7_0.TimerText = var_7_18

	local var_7_19
	local var_7_20 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_7_1
	})

	var_7_20.id = "CheckBox"

	var_7_20:SetAlpha(0, 0)
	var_7_20.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_7_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 28, _1080p * 15, _1080p * 37)
	var_7_0:addElement(var_7_20)

	var_7_0.CheckBox = var_7_20

	local function var_7_21()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_21

	local var_7_22
	local var_7_23 = {
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

	var_7_5:RegisterAnimationSequence("Focused", var_7_23)

	local var_7_24 = {
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

	var_7_7:RegisterAnimationSequence("Focused", var_7_24)

	local var_7_25 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_7_12:RegisterAnimationSequence("Focused", var_7_25)

	local var_7_26 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("Focused", var_7_26)

	local function var_7_27()
		var_7_5:AnimateSequence("Focused")
		var_7_7:AnimateSequence("Focused")
		var_7_12:AnimateSequence("Focused")
		var_7_14:AnimateSequence("Focused")
	end

	var_7_0._sequences.Focused = var_7_27

	local var_7_28
	local var_7_29 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_5:RegisterAnimationSequence("UnFocused", var_7_29)

	local var_7_30 = {
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

	var_7_7:RegisterAnimationSequence("UnFocused", var_7_30)

	local var_7_31 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("UnFocused", var_7_31)

	local var_7_32 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_7_12:RegisterAnimationSequence("UnFocused", var_7_32)

	local var_7_33 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("UnFocused", var_7_33)

	local function var_7_34()
		var_7_5:AnimateSequence("UnFocused")
		var_7_7:AnimateSequence("UnFocused")
		var_7_10:AnimateSequence("UnFocused")
		var_7_12:AnimateSequence("UnFocused")
		var_7_14:AnimateSequence("UnFocused")
	end

	var_7_0._sequences.UnFocused = var_7_34

	local function var_7_35()
		return
	end

	var_7_0._sequences.Locked = var_7_35

	local var_7_36
	local var_7_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_5:RegisterAnimationSequence("Disabled", var_7_37)

	local var_7_38 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_7:RegisterAnimationSequence("Disabled", var_7_38)

	local var_7_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("Disabled", var_7_39)

	local function var_7_40()
		var_7_5:AnimateSequence("Disabled")
		var_7_7:AnimateSequence("Disabled")
		var_7_10:AnimateSequence("Disabled")
	end

	var_7_0._sequences.Disabled = var_7_40

	local var_7_41
	local var_7_42 = {
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_5:RegisterAnimationSequence("Highlighted", var_7_42)

	local var_7_43 = {
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

	var_7_7:RegisterAnimationSequence("Highlighted", var_7_43)

	local function var_7_44()
		var_7_5:AnimateSequence("Highlighted")
		var_7_7:AnimateSequence("Highlighted")
	end

	var_7_0._sequences.Highlighted = var_7_44

	local var_7_45
	local var_7_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("Changed", var_7_46)

	local function var_7_47()
		var_7_12:AnimateSequence("Changed")
	end

	var_7_0._sequences.Changed = var_7_47

	local var_7_48
	local var_7_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("NotChanged", var_7_49)

	local function var_7_50()
		var_7_12:AnimateSequence("NotChanged")
	end

	var_7_0._sequences.NotChanged = var_7_50

	local var_7_51
	local var_7_52 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_5:RegisterAnimationSequence("FocusedNoSound", var_7_52)

	local var_7_53 = {
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

	var_7_7:RegisterAnimationSequence("FocusedNoSound", var_7_53)

	local var_7_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_7_12:RegisterAnimationSequence("FocusedNoSound", var_7_54)

	local var_7_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("FocusedNoSound", var_7_55)

	local function var_7_56()
		var_7_5:AnimateSequence("FocusedNoSound")
		var_7_7:AnimateSequence("FocusedNoSound")
		var_7_12:AnimateSequence("FocusedNoSound")
		var_7_14:AnimateSequence("FocusedNoSound")
	end

	var_7_0._sequences.FocusedNoSound = var_7_56

	local var_7_57
	local var_7_58 = {
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

	var_7_7:RegisterAnimationSequence("AR", var_7_58)

	local function var_7_59()
		var_7_7:AnimateSequence("AR")
	end

	var_7_0._sequences.AR = var_7_59

	local var_7_60
	local var_7_61 = {
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

	var_7_7:RegisterAnimationSequence("KORZH", var_7_61)

	local function var_7_62()
		var_7_7:AnimateSequence("KORZH")
	end

	var_7_0._sequences.KORZH = var_7_62

	local var_7_63
	local var_7_64 = {
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

	var_7_7:RegisterAnimationSequence("DE", var_7_64)

	local function var_7_65()
		var_7_7:AnimateSequence("DE")
	end

	var_7_0._sequences.DE = var_7_65

	local var_7_66
	local var_7_67 = {
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

	var_7_7:RegisterAnimationSequence("RU", var_7_67)

	local function var_7_68()
		var_7_7:AnimateSequence("RU")
	end

	var_7_0._sequences.RU = var_7_68

	local var_7_69

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_7_70 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_7_3:RegisterAnimationSequence("WZWipSetup", var_7_70)
	end

	local var_7_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_5:RegisterAnimationSequence("WZWipSetup", var_7_71)

	local var_7_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2
		},
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

	var_7_7:RegisterAnimationSequence("WZWipSetup", var_7_72)

	local function var_7_73()
		if CONDITIONS.IsWZWipFlowEnabled() then
			var_7_3:AnimateSequence("WZWipSetup")
		end

		var_7_5:AnimateSequence("WZWipSetup")
		var_7_7:AnimateSequence("WZWipSetup")
	end

	var_7_0._sequences.WZWipSetup = var_7_73

	local var_7_74

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_7_75 = {
			{
				value = 1,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_3:RegisterAnimationSequence("WZWipFocused", var_7_75)
	end

	local var_7_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.backgroundDisabledFocus
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2
		}
	}

	var_7_7:RegisterAnimationSequence("WZWipFocused", var_7_76)

	local function var_7_77()
		if CONDITIONS.IsWZWipFlowEnabled() then
			var_7_3:AnimateSequence("WZWipFocused")
		end

		var_7_7:AnimateSequence("WZWipFocused")
	end

	var_7_0._sequences.WZWipFocused = var_7_77

	local var_7_78

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_7_79 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_3:RegisterAnimationSequence("WZWipFocusedNoSound", var_7_79)
	end

	local var_7_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
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
			value = SWATCHES.genericButton.backgroundDisabledFocus
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2
		},
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

	var_7_7:RegisterAnimationSequence("WZWipFocusedNoSound", var_7_80)

	local var_7_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_7_12:RegisterAnimationSequence("WZWipFocusedNoSound", var_7_81)

	local function var_7_82()
		if CONDITIONS.IsWZWipFlowEnabled() then
			var_7_3:AnimateSequence("WZWipFocusedNoSound")
		end

		var_7_7:AnimateSequence("WZWipFocusedNoSound")
		var_7_12:AnimateSequence("WZWipFocusedNoSound")
	end

	var_7_0._sequences.WZWipFocusedNoSound = var_7_82

	local var_7_83

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_7_84 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_3:RegisterAnimationSequence("WZWipHighlighted", var_7_84)
	end

	local var_7_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
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
			value = SWATCHES.genericButton.backgroundDisabledFocus
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		}
	}

	var_7_7:RegisterAnimationSequence("WZWipHighlighted", var_7_85)

	local var_7_86 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_7_12:RegisterAnimationSequence("WZWipHighlighted", var_7_86)

	local function var_7_87()
		if CONDITIONS.IsWZWipFlowEnabled() then
			var_7_3:AnimateSequence("WZWipHighlighted")
		end

		var_7_7:AnimateSequence("WZWipHighlighted")
		var_7_12:AnimateSequence("WZWipHighlighted")
	end

	var_7_0._sequences.WZWipHighlighted = var_7_87

	local var_7_88

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_7_89 = {
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_3:RegisterAnimationSequence("WZWipUnFocused", var_7_89)
	end

	local var_7_90 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZTab
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 9
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_7:RegisterAnimationSequence("WZWipUnFocused", var_7_90)

	local var_7_91 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("WZWipUnFocused", var_7_91)

	local var_7_92 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_7_12:RegisterAnimationSequence("WZWipUnFocused", var_7_92)

	local var_7_93 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("WZWipUnFocused", var_7_93)

	local function var_7_94()
		if CONDITIONS.IsWZWipFlowEnabled() then
			var_7_3:AnimateSequence("WZWipUnFocused")
		end

		var_7_7:AnimateSequence("WZWipUnFocused")
		var_7_10:AnimateSequence("WZWipUnFocused")
		var_7_12:AnimateSequence("WZWipUnFocused")
		var_7_14:AnimateSequence("WZWipUnFocused")
	end

	var_7_0._sequences.WZWipUnFocused = var_7_94

	var_0_2(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("SubMenuTabWithTimer", SubMenuTabWithTimer)
LockTable(_M)
