module(..., package.seeall)

local var_0_0 = 16 * _1080p

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0._isNew = arg_1_1
end

local function var_0_2(arg_2_0)
	if arg_2_0._isButtonEnabled and arg_2_0._isNew then
		arg_2_0.NewItemSmallIcon:SetAlpha(1)

		arg_2_0._isNewShown = true
	else
		arg_2_0.NewItemSmallIcon:SetAlpha(0)

		arg_2_0._isNewShown = false
	end
end

local function var_0_3(arg_3_0, arg_3_1)
	ACTIONS.AnimateSequence(arg_3_0, "ButtonOver")

	if not arg_3_1 or not arg_3_1.ignoreFocus then
		arg_3_0.Background:processEvent({
			name = "gain_focus"
		})
	end

	arg_3_0.NewItemSmallIcon:SetAlpha(0)
	arg_3_0.NewItemNotification:SetAlpha(arg_3_0._isNewShown and 1 or 0, 150)

	arg_3_0._isFocused = true

	LAYOUT.ToggleFontOnFocusEvent(arg_3_0.CategoryName, {
		isFocused = arg_3_0._isFocused
	})
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetNew = var_0_1
	arg_4_0.UpdateBreadcrumb = var_0_2
	arg_4_0.ForceButtonOver = var_0_3
	arg_4_0._isNew = false
	arg_4_0._isButtonEnabled = true

	arg_4_0.Background:SetMask(arg_4_0.Mask)
	arg_4_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		arg_4_0:ForceButtonOver()
	end)
	arg_4_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_6_0, "ButtonUp")
		arg_4_0.Background:AnimateQuickplayBgButtonUp()

		arg_4_0._isFocused = false

		arg_4_0.NewItemSmallIcon:SetAlpha(arg_4_0._isNewShown and 1 or 0, 150)
		arg_4_0.NewItemNotification:SetAlpha(0)
		LAYOUT.ToggleFontOnFocusEvent(arg_4_0.CategoryName, {
			isFocused = arg_4_0._isFocused
		})
	end)
	arg_4_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		arg_4_0._isFocused = false

		ACTIONS.AnimateSequence(arg_7_0, "ButtonUpDisabled")
		arg_4_0.NewItemSmallIcon:SetAlpha(arg_4_0._isNewShown and 1 or 0, 150)
		arg_4_0.NewItemNotification:SetAlpha(0)
		LAYOUT.ToggleFontOnFocusEvent(arg_4_0.CategoryName, {
			isFocused = arg_4_0._isFocused
		})

		arg_4_0._isButtonEnabled = false

		arg_4_0:UpdateBreadcrumb()
		ACTIONS.AnimateSequence(arg_4_0, "Disabled")
	end)
	arg_4_0:addEventHandler("button_over_disable", function(arg_8_0, arg_8_1)
		arg_4_0._isFocused = true

		ACTIONS.AnimateSequence(arg_8_0, "ButtonOverDisabled")
		arg_4_0.NewItemSmallIcon:SetAlpha(0)
		arg_4_0.NewItemNotification:SetAlpha(arg_4_0._isNewShown and 1 or 0, 150)
		LAYOUT.ToggleFontOnFocusEvent(arg_4_0.CategoryName, {
			isFocused = arg_4_0._isFocused
		})
	end)
	arg_4_0:addEventHandler("enable", function(arg_9_0, arg_9_1)
		arg_4_0._isButtonEnabled = true

		arg_4_0:UpdateBreadcrumb()
		ACTIONS.AnimateSequence(arg_4_0, "Enabled")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	else
		arg_4_0.NewItemNotification:SetupRightAlignment()
	end

	arg_4_0:SubscribeToModelThroughElement(arg_4_0, "desc", function()
		assert(arg_4_0.Description)

		local var_10_0 = arg_4_0:GetDataSource().desc:GetValue(arg_4_1)
	end)
	assert(arg_4_0.Background)
	ACTIONS.AnimateSequence(arg_4_0, "ButtonUp")
	arg_4_0.Background:AnimateQuickplayBgButtonUp()
end

function BRPlaylistButton(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 792 * _1080p, 0, 154 * _1080p)

	var_11_0.id = "BRPlaylistButton"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0

	var_11_0:setUseStencil(true)

	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("QuickPlayButtonBackground", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "Background"

	var_11_4.BackgroundImage:setImage(RegisterMaterial("button_offline"), 0)
	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 3, _1080p * -3)
	var_11_0:addElement(var_11_4)

	var_11_0.Background = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "Mask"

	var_11_6:SetZRotation(180, 0)
	var_11_6:setImage(RegisterMaterial("ui_mp_wz_bkg_button_1"), 0)
	var_11_6:Setup9SliceImage(_1080p * 100, _1080p * 50, 0.15, 0.3)
	var_11_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 3, _1080p * -1)
	var_11_0:addElement(var_11_6)

	var_11_0.Mask = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIStyledText.new()

	var_11_8.id = "CategoryName"

	var_11_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_11_8:setText(ToUpperCase(""), 0)
	var_11_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_8:SetWordWrap(false)
	var_11_8:SetAlignment(LUI.Alignment.Left)
	var_11_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_11_8:SetStartupDelay(2000)
	var_11_8:SetLineHoldTime(400)
	var_11_8:SetAnimMoveTime(2000)
	var_11_8:SetAnimMoveSpeed(150)
	var_11_8:SetEndDelay(2000)
	var_11_8:SetCrossfadeTime(250)
	var_11_8:SetFadeInTime(300)
	var_11_8:SetFadeOutTime(300)
	var_11_8:SetMaxVisibleLines(1)
	var_11_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 11, _1080p * 358, _1080p * 7, _1080p * 37)
	var_11_0:addElement(var_11_8)

	var_11_0.CategoryName = var_11_8

	local var_11_9
	local var_11_10 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_11_1
	})

	var_11_10.id = "NewItemSmallIcon"

	var_11_10:SetAlpha(0, 0)
	var_11_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 405, _1080p * 413, _1080p * 13, _1080p * 21)
	var_11_0:addElement(var_11_10)

	var_11_0.NewItemSmallIcon = var_11_10

	local var_11_11
	local var_11_12 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_11_1
	})

	var_11_12.id = "NewItemNotification"

	var_11_12:SetAlpha(0, 0)
	var_11_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 343, _1080p * 421, _1080p * 2, _1080p * 32)
	var_11_0:addElement(var_11_12)

	var_11_0.NewItemNotification = var_11_12

	local var_11_13
	local var_11_14 = LUI.UIImage.new()

	var_11_14.id = "Lock"

	var_11_14:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_11_14:SetAlpha(0, 0)
	var_11_14:setImage(RegisterMaterial("icon_lock"), 0)
	var_11_14:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -40, _1080p * -10, _1080p * -50, _1080p * -20)
	var_11_0:addElement(var_11_14)

	var_11_0.Lock = var_11_14

	local var_11_15
	local var_11_16 = LUI.UIStyledText.new()

	var_11_16.id = "Description"

	var_11_16:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_11_16:SetAlpha(0, 0)
	var_11_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_16:SetAlignment(LUI.Alignment.Left)
	var_11_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_11_16:SetStartupDelay(2000)
	var_11_16:SetLineHoldTime(2000)
	var_11_16:SetAnimMoveTime(1000)
	var_11_16:SetAnimMoveSpeed(150)
	var_11_16:SetEndDelay(2000)
	var_11_16:SetCrossfadeTime(1000)
	var_11_16:SetFadeInTime(300)
	var_11_16:SetFadeOutTime(300)
	var_11_16:SetMaxVisibleLines(2)
	var_11_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 11, _1080p * 328, _1080p * 37, _1080p * 57)

	local function var_11_17()
		local var_12_0 = var_11_0:GetDataSource().DataSources.frontEnd.MP.playlist.desc:GetValue(var_11_1)

		if var_12_0 ~= nil then
			var_11_16:setText(var_12_0, 0)
		end
	end

	var_11_16:SubscribeToModelThroughElement(var_11_0, "DataSources.frontEnd.MP.playlist.desc", var_11_17)
	var_11_0:addElement(var_11_16)

	var_11_0.Description = var_11_16

	local var_11_18
	local var_11_19 = LUI.UIImage.new()

	var_11_19.id = "Backer"

	var_11_19:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_11_19:SetAlpha(0, 0)
	var_11_19:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 430, _1080p * -52, _1080p * -16)
	var_11_0:addElement(var_11_19)

	var_11_0.Backer = var_11_19

	local var_11_20
	local var_11_21 = LUI.UIStyledText.new()

	var_11_21.id = "DisabledText"

	var_11_21:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_11_21:SetAlpha(0, 0)
	var_11_21:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_11_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_21:SetWordWrap(false)
	var_11_21:SetAlignment(LUI.Alignment.Left)
	var_11_21:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_11_21:SetStartupDelay(2000)
	var_11_21:SetLineHoldTime(400)
	var_11_21:SetAnimMoveTime(2000)
	var_11_21:SetAnimMoveSpeed(150)
	var_11_21:SetEndDelay(2000)
	var_11_21:SetCrossfadeTime(1000)
	var_11_21:SetFadeInTime(300)
	var_11_21:SetFadeOutTime(300)
	var_11_21:SetMaxVisibleLines(1)
	var_11_21:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 19, _1080p * 376, _1080p * -47, _1080p * -27)
	var_11_0:addElement(var_11_21)

	var_11_0.DisabledText = var_11_21

	local var_11_22

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_11_22 = LUI.UIImage.new()
		var_11_22.id = "HighlightTop"

		var_11_22:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
		var_11_22:SetAlpha(0, 0)
		var_11_22:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
		var_11_22:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 2, _1080p * 4)
		var_11_0:addElement(var_11_22)

		var_11_0.HighlightTop = var_11_22
	end

	local var_11_23

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_11_23 = LUI.UIImage.new()
		var_11_23.id = "HighlightBottom"

		var_11_23:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
		var_11_23:SetAlpha(0, 0)
		var_11_23:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
		var_11_23:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -5, _1080p * -3)
		var_11_0:addElement(var_11_23)

		var_11_0.HighlightBottom = var_11_23
	end

	local function var_11_24()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_24

	local var_11_25
	local var_11_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("Disabled", var_11_26)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_11_27 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_11_22:RegisterAnimationSequence("Disabled", var_11_27)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_11_28 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_11_23:RegisterAnimationSequence("Disabled", var_11_28)
	end

	local function var_11_29()
		var_11_14:AnimateSequence("Disabled")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_11_22:AnimateSequence("Disabled")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_11_23:AnimateSequence("Disabled")
		end
	end

	var_11_0._sequences.Disabled = var_11_29

	local var_11_30

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_11_31 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_11_22:RegisterAnimationSequence("DisabledAR", var_11_31)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_11_32 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_11_23:RegisterAnimationSequence("DisabledAR", var_11_32)
	end

	local function var_11_33()
		if CONDITIONS.IsWZWipFlowEnabled() then
			var_11_22:AnimateSequence("DisabledAR")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_11_23:AnimateSequence("DisabledAR")
		end
	end

	var_11_0._sequences.DisabledAR = var_11_33

	local var_11_34
	local var_11_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("Enabled", var_11_35)

	local function var_11_36()
		var_11_14:AnimateSequence("Enabled")
	end

	var_11_0._sequences.Enabled = var_11_36

	local function var_11_37()
		return
	end

	var_11_0._sequences.EnabledAR = var_11_37

	local var_11_38
	local var_11_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -274
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 43
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
		}
	}

	var_11_8:RegisterAnimationSequence("AR", var_11_39)

	local var_11_40 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -413
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -405
		}
	}

	var_11_10:RegisterAnimationSequence("AR", var_11_40)

	local var_11_41 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -419
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -341
		}
	}

	var_11_12:RegisterAnimationSequence("AR", var_11_41)

	local var_11_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 35
		}
	}

	var_11_14:RegisterAnimationSequence("AR", var_11_42)

	local var_11_43 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -336
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 58
		}
	}

	var_11_16:RegisterAnimationSequence("AR", var_11_43)

	local var_11_44 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -376
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -19
		}
	}

	var_11_21:RegisterAnimationSequence("AR", var_11_44)

	local function var_11_45()
		var_11_8:AnimateSequence("AR")
		var_11_10:AnimateSequence("AR")
		var_11_12:AnimateSequence("AR")
		var_11_14:AnimateSequence("AR")
		var_11_16:AnimateSequence("AR")
		var_11_21:AnimateSequence("AR")
	end

	var_11_0._sequences.AR = var_11_45

	local var_11_46
	local var_11_47 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonOver", var_11_47)

	local var_11_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("ButtonOver", var_11_48)

	local var_11_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneDescription
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonOver", var_11_49)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_11_50 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 0.6,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_22:RegisterAnimationSequence("ButtonOver", var_11_50)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_11_51 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 0.6,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_23:RegisterAnimationSequence("ButtonOver", var_11_51)
	end

	local function var_11_52()
		var_11_8:AnimateSequence("ButtonOver")
		var_11_14:AnimateSequence("ButtonOver")
		var_11_16:AnimateSequence("ButtonOver")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_11_22:AnimateSequence("ButtonOver")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_11_23:AnimateSequence("ButtonOver")
		end
	end

	var_11_0._sequences.ButtonOver = var_11_52

	local var_11_53
	local var_11_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonOverKBM", var_11_54)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_11_55 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 0.6,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_22:RegisterAnimationSequence("ButtonOverKBM", var_11_55)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_11_56 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 0.6,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_23:RegisterAnimationSequence("ButtonOverKBM", var_11_56)
	end

	local function var_11_57()
		var_11_8:AnimateSequence("ButtonOverKBM")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_11_22:AnimateSequence("ButtonOverKBM")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_11_23:AnimateSequence("ButtonOverKBM")
		end
	end

	var_11_0._sequences.ButtonOverKBM = var_11_57

	local var_11_58
	local var_11_59 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUp", var_11_59)

	local var_11_60 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("ButtonUp", var_11_60)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_11_61 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 7
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			},
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_22:RegisterAnimationSequence("ButtonUp", var_11_61)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_11_62 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			},
			{
				value = 0,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_23:RegisterAnimationSequence("ButtonUp", var_11_62)
	end

	local function var_11_63()
		var_11_8:AnimateSequence("ButtonUp")
		var_11_16:AnimateSequence("ButtonUp")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_11_22:AnimateSequence("ButtonUp")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_11_23:AnimateSequence("ButtonUp")
		end
	end

	var_11_0._sequences.ButtonUp = var_11_63

	local var_11_64
	local var_11_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonOverDisabled", var_11_65)

	local var_11_66 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_19:RegisterAnimationSequence("ButtonOverDisabled", var_11_66)

	local var_11_67 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_21:RegisterAnimationSequence("ButtonOverDisabled", var_11_67)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_11_68 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 0.6,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_22:RegisterAnimationSequence("ButtonOverDisabled", var_11_68)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_11_69 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 0.6,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_23:RegisterAnimationSequence("ButtonOverDisabled", var_11_69)
	end

	local function var_11_70()
		var_11_8:AnimateSequence("ButtonOverDisabled")
		var_11_19:AnimateSequence("ButtonOverDisabled")
		var_11_21:AnimateSequence("ButtonOverDisabled")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_11_22:AnimateSequence("ButtonOverDisabled")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_11_23:AnimateSequence("ButtonOverDisabled")
		end
	end

	var_11_0._sequences.ButtonOverDisabled = var_11_70

	local var_11_71
	local var_11_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonOverDisabledKBM", var_11_72)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_11_73 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 0.6,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_22:RegisterAnimationSequence("ButtonOverDisabledKBM", var_11_73)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_11_74 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			},
			{
				value = 0.6,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_23:RegisterAnimationSequence("ButtonOverDisabledKBM", var_11_74)
	end

	local function var_11_75()
		var_11_8:AnimateSequence("ButtonOverDisabledKBM")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_11_22:AnimateSequence("ButtonOverDisabledKBM")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_11_23:AnimateSequence("ButtonOverDisabledKBM")
		end
	end

	var_11_0._sequences.ButtonOverDisabledKBM = var_11_75

	local var_11_76
	local var_11_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_U_Offset
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_V_Offset
		},
		{
			value = 0.3,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUpDisabled", var_11_77)

	local var_11_78 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_19:RegisterAnimationSequence("ButtonUpDisabled", var_11_78)

	local var_11_79 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_21:RegisterAnimationSequence("ButtonUpDisabled", var_11_79)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_11_80 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_11_22:RegisterAnimationSequence("ButtonUpDisabled", var_11_80)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_11_81 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_11_23:RegisterAnimationSequence("ButtonUpDisabled", var_11_81)
	end

	local function var_11_82()
		var_11_8:AnimateSequence("ButtonUpDisabled")
		var_11_19:AnimateSequence("ButtonUpDisabled")
		var_11_21:AnimateSequence("ButtonUpDisabled")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_11_22:AnimateSequence("ButtonUpDisabled")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_11_23:AnimateSequence("ButtonUpDisabled")
		end
	end

	var_11_0._sequences.ButtonUpDisabled = var_11_82

	local var_11_83
	local var_11_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Y_Rotation
		}
	}

	var_11_6:RegisterAnimationSequence("MaskState1", var_11_84)

	local function var_11_85()
		var_11_6:AnimateSequence("MaskState1")
	end

	var_11_0._sequences.MaskState1 = var_11_85

	local var_11_86
	local var_11_87 = {
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Y_Rotation
		}
	}

	var_11_6:RegisterAnimationSequence("MaskState3", var_11_87)

	local function var_11_88()
		var_11_6:AnimateSequence("MaskState3")
	end

	var_11_0._sequences.MaskState3 = var_11_88

	local var_11_89
	local var_11_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Y_Rotation
		}
	}

	var_11_6:RegisterAnimationSequence("MaskState2", var_11_90)

	local function var_11_91()
		var_11_6:AnimateSequence("MaskState2")
	end

	var_11_0._sequences.MaskState2 = var_11_91

	local var_11_92
	local var_11_93 = {
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Y_Rotation
		}
	}

	var_11_6:RegisterAnimationSequence("MaskState4", var_11_93)

	local function var_11_94()
		var_11_6:AnimateSequence("MaskState4")
	end

	var_11_0._sequences.MaskState4 = var_11_94

	var_0_4(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("BRPlaylistButton", BRPlaylistButton)
LockTable(_M)
