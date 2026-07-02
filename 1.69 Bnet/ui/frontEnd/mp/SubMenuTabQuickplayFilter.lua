module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0
	local var_1_1 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
		controllerIndex = arg_1_1
	})

	var_1_1.id = "FreeBanner"

	var_1_1:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, _1080p * 24)
	var_1_1:setPriority(-1)
	var_1_1:SetAlpha(0.75)
	var_1_1:SetText(Engine.CBBHFCGDIC("MENU/FREE_BUNDLE"))
	arg_1_0:addElement(var_1_1)

	arg_1_0.FreeBanner = var_1_1

	ACTIONS.AnimateSequence(arg_1_0.FreeBanner, "FreeBundleVariant")
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._isBattlePassTab = false

	function arg_2_0.Setup(arg_3_0, arg_3_1)
		arg_3_0.TabText:setText(ToUpperCase(arg_3_1.name))

		if arg_3_1.hasNewItem then
			arg_3_0.NewItemSmallIcon:UpdateAlpha(arg_3_1.hasNewItem and 1 or 0)
		end

		if arg_3_1.isStoreTab then
			ACTIONS.AnimateSequence(arg_3_0.NewItemSmallIcon, "Store")
		end

		if arg_3_1.isBattlePassTab then
			arg_3_0._isBattlePassTab = true

			ACTIONS.AnimateSequence(arg_3_0, "BattlePassTabUp")
		end

		if arg_3_1.hasFreeItem then
			var_0_0(arg_3_0, arg_2_1)
		end
	end

	function arg_2_0.Enable(arg_4_0)
		arg_4_0._disabled = false

		ACTIONS.AnimateSequence(arg_4_0, "UnFocused")
	end

	function arg_2_0.Disable(arg_5_0)
		arg_5_0._disabled = true

		ACTIONS.AnimateSequence(arg_5_0, "Disabled")
	end

	function arg_2_0.IsEnabled(arg_6_0)
		return not arg_6_0._disabled
	end

	function arg_2_0.ClearBreadcrumb(arg_7_0)
		arg_7_0.NewItemSmallIcon:SetAlpha(0)
	end

	arg_2_0:registerEventHandler("focus_tab", function(arg_8_0, arg_8_1)
		if arg_8_1.index == arg_8_0.index then
			if arg_8_1.playSound then
				arg_8_0._sequences.Focused()
			else
				arg_8_0._sequences.FocusedNoSound()
			end

			arg_8_0.focused = true
		elseif arg_8_0.focused then
			arg_8_0._sequences.UnFocused()

			arg_8_0.focused = false
		end

		if arg_8_0._isBattlePassTab then
			if arg_8_0.focused then
				ACTIONS.AnimateSequence(arg_8_0, "BattlePassTabOver")
			else
				ACTIONS.AnimateSequence(arg_8_0, "BattlePassTabUp")
			end
		end

		arg_8_0.TabText:SetParentHasFocus(not not arg_8_0.focused)
	end)
	arg_2_0:SetHandleMouse(true)
	arg_2_0:registerEventHandler("mouseenter", function(arg_9_0, arg_9_1)
		Engine.BJDBIAGIDA(CoD.SFX.MouseOver)

		if not arg_9_0.focused then
			if not arg_9_0._disabled then
				arg_9_0._sequences.Highlighted()
			else
				arg_9_0._sequences.Focused()
			end
		else
			arg_9_0._sequences.Highlighted()
		end

		if arg_9_0._isBattlePassTab then
			ACTIONS.AnimateSequence(arg_9_0, "BattlePassTabOver")
		end
	end)
	arg_2_0:registerEventHandler("mouseleave", function(arg_10_0, arg_10_1)
		if arg_10_0.focused and not arg_10_0._disabled then
			arg_10_0._sequences.FocusedNoSound()
		else
			arg_10_0._sequences.UnFocused()

			if arg_10_0._disabled then
				arg_10_0._sequences.Disabled()
			end
		end

		if arg_10_0._isBattlePassTab then
			if arg_10_0.focused then
				ACTIONS.AnimateSequence(arg_10_0, "BattlePassTabOver")
			else
				ACTIONS.AnimateSequence(arg_10_0, "BattlePassTabUp")
			end
		end

		arg_10_0:setFocus(false)
	end)
	arg_2_0:registerEventHandler("leftmousedown", function(arg_11_0, arg_11_1)
		return
	end)
	arg_2_0:registerEventHandler("leftmouseup", function(arg_12_0, arg_12_1)
		if arg_12_1.inside and not arg_12_0._disabled then
			arg_12_0:playSound("menu_open")
			arg_12_0:dispatchEventToCurrentMenu({
				name = "tab_mouse_select",
				index = arg_12_0.index
			})
			arg_12_0._sequences.Highlighted()

			if arg_12_0._isBattlePassTab then
				ACTIONS.AnimateSequence(arg_12_0, "BattlePassTabOver")
			end
		end
	end)
	arg_2_0:registerEventHandler("tab_disable_blur", function(arg_13_0, arg_13_1)
		ACTIONS.AnimateSequence(arg_13_0, "NoBlur")
	end)
	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "disabled", function(arg_14_0)
		if DataModel.JJEHAEBDF(arg_14_0) then
			arg_2_0:Disable()
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	elseif IsLanguageKorean() or IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_2_0, "KORZH")
	elseif IsLanguageGerman() then
		ACTIONS.AnimateSequence(arg_2_0, "DE")
	elseif IsLanguageRussian() then
		ACTIONS.AnimateSequence(arg_2_0, "RU")
	end
end

function SubMenuTabQuickplayFilter(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIElement.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 175 * _1080p, 0, 52 * _1080p)

	var_15_0.id = "SubMenuTabQuickplayFilter"
	var_15_0._animationSets = var_15_0._animationSets or {}
	var_15_0._sequences = var_15_0._sequences or {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = LUI.UIImage.new()

	var_15_4.id = "Backer"

	var_15_4:SetRGBFromTable(SWATCHES.tabManager.tabBackground, 0)
	var_15_4:SetAlpha(0, 0)
	var_15_4:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_15_0:addElement(var_15_4)

	var_15_0.Backer = var_15_4

	local var_15_5
	local var_15_6 = LUI.UIStyledText.new()

	var_15_6.id = "TabText"

	var_15_6:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_15_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_15_6:SetAlignment(LUI.Alignment.Center)
	var_15_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_15_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_15_6:SetStartupDelay(5000)
	var_15_6:SetLineHoldTime(4000)
	var_15_6:SetAnimMoveTime(500)
	var_15_6:SetAnimMoveSpeed(300)
	var_15_6:SetEndDelay(1000)
	var_15_6:SetCrossfadeTime(400)
	var_15_6:SetFadeInTime(300)
	var_15_6:SetFadeOutTime(300)
	var_15_6:SetMaxVisibleLines(2)
	var_15_6:SetShadowRGBFromTable(SWATCHES.tabManager.tabTextFocused, 0)
	var_15_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, _1080p * -41, _1080p * -9, _1080p * 9)

	local function var_15_7()
		local var_16_0 = var_15_0:GetDataSource().name:GetValue(var_15_1)

		if var_16_0 ~= nil then
			var_15_6:setText(var_16_0, 0)
		end
	end

	var_15_6:SubscribeToModelThroughElement(var_15_0, "name", var_15_7)
	var_15_0:addElement(var_15_6)

	var_15_0.TabText = var_15_6

	local var_15_8
	local var_15_9 = LUI.UIImage.new()

	var_15_9.id = "DisabledIcon"

	var_15_9:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_15_9:SetAlpha(0, 0)
	var_15_9:setImage(RegisterMaterial("icon_lock"), 0)
	var_15_9:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * 18.5, _1080p * -19, _1080p * 17)
	var_15_0:addElement(var_15_9)

	var_15_0.DisabledIcon = var_15_9

	local var_15_10
	local var_15_11 = LUI.UIImage.new()

	var_15_11.id = "Highlight"

	var_15_11:SetRGBFromTable(SWATCHES.tabManager.tabFrame, 0)
	var_15_11:SetAlpha(0, 0)
	var_15_11:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -4, 0)
	var_15_0:addElement(var_15_11)

	var_15_0.Highlight = var_15_11

	local var_15_12
	local var_15_13 = LUI.UIImage.new()

	var_15_13.id = "Fill"

	var_15_13:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_15_13:setImage(RegisterMaterial("cac_equip_ring"), 0)
	var_15_13:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -36, _1080p * -14, _1080p * -11, _1080p * 11)
	var_15_0:addElement(var_15_13)

	var_15_0.Fill = var_15_13

	local function var_15_14()
		return
	end

	var_15_0._sequences.DefaultSequence = var_15_14

	local var_15_15 = {
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

	var_15_4:RegisterAnimationSequence("Focused", var_15_15)

	local var_15_16 = {
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

	var_15_6:RegisterAnimationSequence("Focused", var_15_16)

	local var_15_17 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_11:RegisterAnimationSequence("Focused", var_15_17)

	local function var_15_18()
		var_15_4:AnimateSequence("Focused")
		var_15_6:AnimateSequence("Focused")
		var_15_11:AnimateSequence("Focused")
	end

	var_15_0._sequences.Focused = var_15_18

	local var_15_19 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_4:RegisterAnimationSequence("UnFocused", var_15_19)

	local var_15_20 = {
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

	var_15_6:RegisterAnimationSequence("UnFocused", var_15_20)

	local var_15_21 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_9:RegisterAnimationSequence("UnFocused", var_15_21)

	local var_15_22 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_11:RegisterAnimationSequence("UnFocused", var_15_22)

	local function var_15_23()
		var_15_4:AnimateSequence("UnFocused")
		var_15_6:AnimateSequence("UnFocused")
		var_15_9:AnimateSequence("UnFocused")
		var_15_11:AnimateSequence("UnFocused")
	end

	var_15_0._sequences.UnFocused = var_15_23

	local function var_15_24()
		return
	end

	var_15_0._sequences.Locked = var_15_24

	local var_15_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_4:RegisterAnimationSequence("Disabled", var_15_25)

	local var_15_26 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("Disabled", var_15_26)

	local var_15_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_9:RegisterAnimationSequence("Disabled", var_15_27)

	local function var_15_28()
		var_15_4:AnimateSequence("Disabled")
		var_15_6:AnimateSequence("Disabled")
		var_15_9:AnimateSequence("Disabled")
	end

	var_15_0._sequences.Disabled = var_15_28

	local var_15_29 = {
		{
			value = 0.4,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_4:RegisterAnimationSequence("Highlighted", var_15_29)

	local var_15_30 = {
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

	var_15_6:RegisterAnimationSequence("Highlighted", var_15_30)

	local function var_15_31()
		var_15_4:AnimateSequence("Highlighted")
		var_15_6:AnimateSequence("Highlighted")
	end

	var_15_0._sequences.Highlighted = var_15_31

	local function var_15_32()
		return
	end

	var_15_0._sequences.Changed = var_15_32

	local function var_15_33()
		return
	end

	var_15_0._sequences.NotChanged = var_15_33

	local var_15_34 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_4:RegisterAnimationSequence("FocusedNoSound", var_15_34)

	local var_15_35 = {
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

	var_15_6:RegisterAnimationSequence("FocusedNoSound", var_15_35)

	local var_15_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_11:RegisterAnimationSequence("FocusedNoSound", var_15_36)

	local function var_15_37()
		var_15_4:AnimateSequence("FocusedNoSound")
		var_15_6:AnimateSequence("FocusedNoSound")
		var_15_11:AnimateSequence("FocusedNoSound")
	end

	var_15_0._sequences.FocusedNoSound = var_15_37

	local var_15_38 = {
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

	var_15_6:RegisterAnimationSequence("AR", var_15_38)

	local function var_15_39()
		var_15_6:AnimateSequence("AR")
	end

	var_15_0._sequences.AR = var_15_39

	local var_15_40 = {
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

	var_15_6:RegisterAnimationSequence("KORZH", var_15_40)

	local function var_15_41()
		var_15_6:AnimateSequence("KORZH")
	end

	var_15_0._sequences.KORZH = var_15_41

	local var_15_42 = {
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

	var_15_6:RegisterAnimationSequence("DE", var_15_42)

	local function var_15_43()
		var_15_6:AnimateSequence("DE")
	end

	var_15_0._sequences.DE = var_15_43

	local var_15_44 = {
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

	var_15_6:RegisterAnimationSequence("RU", var_15_44)

	local function var_15_45()
		var_15_6:AnimateSequence("RU")
	end

	var_15_0._sequences.RU = var_15_45

	local var_15_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_fill")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		}
	}

	var_15_13:RegisterAnimationSequence("ToggleOn", var_15_46)

	local function var_15_47()
		var_15_13:AnimateSequence("ToggleOn")
	end

	var_15_0._sequences.ToggleOn = var_15_47

	local var_15_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_ring")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_15_13:RegisterAnimationSequence("ToggleOff", var_15_48)

	local function var_15_49()
		var_15_13:AnimateSequence("ToggleOff")
	end

	var_15_0._sequences.ToggleOff = var_15_49

	var_0_1(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("SubMenuTabQuickplayFilter", SubMenuTabQuickplayFilter)
LockTable(_M)
