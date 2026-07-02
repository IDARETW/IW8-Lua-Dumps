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

local function var_0_3(arg_3_0)
	ACTIONS.AnimateSequence(arg_3_0, CONDITIONS.IsMagmaGameMode(arg_3_0) and "WZButtonOver" or "ButtonOver")
	arg_3_0.Background:processEvent({
		name = "gain_focus"
	})
	arg_3_0.NewItemSmallIcon:SetAlpha(0)
	arg_3_0.NewItemNotification:SetAlpha(arg_3_0._isNewShown and 1 or 0, 150)
	arg_3_0.CategoryName:SetFont(FONTS.GetFont(FONTS.MainBold.File))
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetNew = var_0_1
	arg_4_0.UpdateBreadcrumb = var_0_2
	arg_4_0.ForceButtonOver = var_0_3
	arg_4_0._isNew = false
	arg_4_0._isButtonEnabled = true

	arg_4_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		arg_4_0._isFocused = true

		arg_4_0:ForceButtonOver()
	end)
	arg_4_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_4_0, CONDITIONS.IsMagmaGameMode(arg_4_0) and "WZButtonUp" or "ButtonUp")
		ACTIONS.AnimateSequence(arg_4_0.Background, CONDITIONS.IsMagmaGameMode(arg_4_0) and "WZButtonUp" or "ButtonUp")

		arg_4_0._isFocused = false

		arg_4_0.NewItemSmallIcon:SetAlpha(arg_4_0._isNewShown and 1 or 0, 150)
		arg_4_0.NewItemNotification:SetAlpha(0)
		arg_4_0.CategoryName:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	end)
	arg_4_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		arg_4_0._isFocused = false

		ACTIONS.AnimateSequence(arg_7_0, "ButtonUpDisabled")
		arg_4_0.NewItemSmallIcon:SetAlpha(arg_4_0._isNewShown and 1 or 0, 150)
		arg_4_0.NewItemNotification:SetAlpha(0)
		arg_4_0.CategoryName:SetFont(FONTS.GetFont(FONTS.MainRegular.File))

		arg_4_0._isButtonEnabled = false

		arg_4_0:UpdateBreadcrumb()
		ACTIONS.AnimateSequence(arg_4_0, "Disabled")
	end)
	arg_4_0:addEventHandler("button_over_disable", function(arg_8_0, arg_8_1)
		arg_4_0._isFocused = true

		ACTIONS.AnimateSequence(arg_4_0, "ButtonOverDisabled")
		arg_4_0.NewItemSmallIcon:SetAlpha(0)
		arg_4_0.NewItemNotification:SetAlpha(arg_4_0._isNewShown and 1 or 0, 150)
		arg_4_0.CategoryName:SetFont(FONTS.GetFont(FONTS.MainBold.File))
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
	arg_4_0.Background:SetWZTheme(true)
	ACTIONS.AnimateSequence(arg_4_0, CONDITIONS.IsMagmaGameMode(arg_4_0) and "WZButtonUp" or "ButtonUp")
	ACTIONS.AnimateSequence(arg_4_0.Background, CONDITIONS.IsMagmaGameMode(arg_4_0) and "WZButtonUp" or "ButtonUp")
end

function BRPlaylistButton(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 130 * _1080p)

	var_11_0.id = "BRPlaylistButton"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("QuickPlayButtonBackground", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "Background"

	var_11_4.BackgroundImage:setImage(RegisterMaterial("button_offline"), 0)
	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.Background = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIStyledText.new()

	var_11_6.id = "CategoryName"

	var_11_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_11_6:setText(ToUpperCase(""), 0)
	var_11_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_6:SetWordWrap(false)
	var_11_6:SetAlignment(LUI.Alignment.Left)
	var_11_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_11_6:SetStartupDelay(2000)
	var_11_6:SetLineHoldTime(400)
	var_11_6:SetAnimMoveTime(2000)
	var_11_6:SetAnimMoveSpeed(150)
	var_11_6:SetEndDelay(2000)
	var_11_6:SetCrossfadeTime(250)
	var_11_6:SetFadeInTime(300)
	var_11_6:SetFadeOutTime(300)
	var_11_6:SetMaxVisibleLines(1)
	var_11_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 26, _1080p * 358, _1080p * -59, _1080p * -29)
	var_11_0:addElement(var_11_6)

	var_11_0.CategoryName = var_11_6

	local var_11_7
	local var_11_8 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_11_1
	})

	var_11_8.id = "NewItemSmallIcon"

	var_11_8:SetAlpha(0, 0)
	var_11_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 405, _1080p * 413, _1080p * -8, 0)
	var_11_0:addElement(var_11_8)

	var_11_0.NewItemSmallIcon = var_11_8

	local var_11_9
	local var_11_10 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_11_1
	})

	var_11_10.id = "NewItemNotification"

	var_11_10:SetAlpha(0, 0)
	var_11_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 343, _1080p * 421, _1080p * -24, _1080p * 6)
	var_11_0:addElement(var_11_10)

	var_11_0.NewItemNotification = var_11_10

	local var_11_11
	local var_11_12 = LUI.UIImage.new()

	var_11_12.id = "Lock"

	var_11_12:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_11_12:SetAlpha(0, 0)
	var_11_12:setImage(RegisterMaterial("icon_lock"), 0)
	var_11_12:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -36, _1080p * -6, _1080p * 32, _1080p * 62)
	var_11_0:addElement(var_11_12)

	var_11_0.Lock = var_11_12

	local var_11_13
	local var_11_14 = LUI.UIStyledText.new()

	var_11_14.id = "Description"

	var_11_14:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_14:SetAlpha(0, 0)
	var_11_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_14:SetAlignment(LUI.Alignment.Left)
	var_11_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_11_14:SetStartupDelay(2000)
	var_11_14:SetLineHoldTime(2000)
	var_11_14:SetAnimMoveTime(1000)
	var_11_14:SetAnimMoveSpeed(150)
	var_11_14:SetEndDelay(2000)
	var_11_14:SetCrossfadeTime(1000)
	var_11_14:SetFadeInTime(300)
	var_11_14:SetFadeOutTime(300)
	var_11_14:SetMaxVisibleLines(2)
	var_11_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 26, _1080p * 343, _1080p * -29, _1080p * -9)

	local function var_11_15()
		local var_12_0 = var_11_0:GetDataSource().DataSources.frontEnd.MP.playlist.desc:GetValue(var_11_1)

		if var_12_0 ~= nil then
			var_11_14:setText(var_12_0, 0)
		end
	end

	var_11_14:SubscribeToModelThroughElement(var_11_0, "DataSources.frontEnd.MP.playlist.desc", var_11_15)
	var_11_0:addElement(var_11_14)

	var_11_0.Description = var_11_14

	local var_11_16
	local var_11_17 = LUI.UIImage.new()

	var_11_17.id = "Backer"

	var_11_17:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_11_17:SetAlpha(0, 0)
	var_11_17:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 430, _1080p * -38, _1080p * -2)
	var_11_0:addElement(var_11_17)

	var_11_0.Backer = var_11_17

	local var_11_18
	local var_11_19 = LUI.UIStyledText.new()

	var_11_19.id = "DisabledText"

	var_11_19:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_11_19:SetAlpha(0, 0)
	var_11_19:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST"), 0)
	var_11_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_19:SetWordWrap(false)
	var_11_19:SetAlignment(LUI.Alignment.Left)
	var_11_19:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_11_19:SetStartupDelay(2000)
	var_11_19:SetLineHoldTime(400)
	var_11_19:SetAnimMoveTime(2000)
	var_11_19:SetAnimMoveSpeed(150)
	var_11_19:SetEndDelay(2000)
	var_11_19:SetCrossfadeTime(1000)
	var_11_19:SetFadeInTime(300)
	var_11_19:SetFadeOutTime(300)
	var_11_19:SetMaxVisibleLines(1)
	var_11_19:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 19, _1080p * 376, _1080p * 37, _1080p * 57)
	var_11_0:addElement(var_11_19)

	var_11_0.DisabledText = var_11_19

	local function var_11_20()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_20

	local var_11_21
	local var_11_22 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = -0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonOver", var_11_22)

	local var_11_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonOver", var_11_23)

	local var_11_24 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("ButtonOver", var_11_24)

	local function var_11_25()
		var_11_6:AnimateSequence("ButtonOver")
		var_11_12:AnimateSequence("ButtonOver")
		var_11_14:AnimateSequence("ButtonOver")
	end

	var_11_0._sequences.ButtonOver = var_11_25

	local var_11_26
	local var_11_27 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
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
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_Color
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonUp", var_11_27)

	local var_11_28 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("ButtonUp", var_11_28)

	local function var_11_29()
		var_11_6:AnimateSequence("ButtonUp")
		var_11_14:AnimateSequence("ButtonUp")
	end

	var_11_0._sequences.ButtonUp = var_11_29

	local var_11_30
	local var_11_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textDisabled
		},
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

	var_11_6:RegisterAnimationSequence("ButtonOverDisabled", var_11_31)

	local var_11_32 = {
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

	var_11_17:RegisterAnimationSequence("ButtonOverDisabled", var_11_32)

	local var_11_33 = {
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

	var_11_19:RegisterAnimationSequence("ButtonOverDisabled", var_11_33)

	local function var_11_34()
		var_11_6:AnimateSequence("ButtonOverDisabled")
		var_11_17:AnimateSequence("ButtonOverDisabled")
		var_11_19:AnimateSequence("ButtonOverDisabled")
	end

	var_11_0._sequences.ButtonOverDisabled = var_11_34

	local var_11_35
	local var_11_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textDisabled
		},
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

	var_11_6:RegisterAnimationSequence("ButtonOverDisabledKBM", var_11_36)

	local function var_11_37()
		var_11_6:AnimateSequence("ButtonOverDisabledKBM")
	end

	var_11_0._sequences.ButtonOverDisabledKBM = var_11_37

	local var_11_38
	local var_11_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
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

	var_11_6:RegisterAnimationSequence("ButtonUpDisabled", var_11_39)

	local var_11_40 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_17:RegisterAnimationSequence("ButtonUpDisabled", var_11_40)

	local var_11_41 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_19:RegisterAnimationSequence("ButtonUpDisabled", var_11_41)

	local function var_11_42()
		var_11_6:AnimateSequence("ButtonUpDisabled")
		var_11_17:AnimateSequence("ButtonUpDisabled")
		var_11_19:AnimateSequence("ButtonUpDisabled")
	end

	var_11_0._sequences.ButtonUpDisabled = var_11_42

	local var_11_43
	local var_11_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = -0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 1,
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
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_6:RegisterAnimationSequence("ButtonOverKBM", var_11_44)

	local function var_11_45()
		var_11_6:AnimateSequence("ButtonOverKBM")
	end

	var_11_0._sequences.ButtonOverKBM = var_11_45

	local var_11_46
	local var_11_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("Disabled", var_11_47)

	local function var_11_48()
		var_11_12:AnimateSequence("Disabled")
	end

	var_11_0._sequences.Disabled = var_11_48

	local function var_11_49()
		return
	end

	var_11_0._sequences.DisabledAR = var_11_49

	local var_11_50
	local var_11_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("Enabled", var_11_51)

	local function var_11_52()
		var_11_12:AnimateSequence("Enabled")
	end

	var_11_0._sequences.Enabled = var_11_52

	local function var_11_53()
		return
	end

	var_11_0._sequences.EnabledAR = var_11_53

	local var_11_54
	local var_11_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -274
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -16
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

	var_11_6:RegisterAnimationSequence("AR", var_11_55)

	local var_11_56 = {
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

	var_11_8:RegisterAnimationSequence("AR", var_11_56)

	local var_11_57 = {
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

	var_11_10:RegisterAnimationSequence("AR", var_11_57)

	local var_11_58 = {
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

	var_11_12:RegisterAnimationSequence("AR", var_11_58)

	local var_11_59 = {
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
			value = _1080p * -29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -1
		}
	}

	var_11_14:RegisterAnimationSequence("AR", var_11_59)

	local var_11_60 = {
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

	var_11_19:RegisterAnimationSequence("AR", var_11_60)

	local function var_11_61()
		var_11_6:AnimateSequence("AR")
		var_11_8:AnimateSequence("AR")
		var_11_10:AnimateSequence("AR")
		var_11_12:AnimateSequence("AR")
		var_11_14:AnimateSequence("AR")
		var_11_19:AnimateSequence("AR")
	end

	var_11_0._sequences.AR = var_11_61

	local var_11_62
	local var_11_63 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		},
		{
			value = -0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.warzoneTextFocus
		}
	}

	var_11_6:RegisterAnimationSequence("WZButtonOver", var_11_63)

	local var_11_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("WZButtonOver", var_11_64)

	local var_11_65 = {
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

	var_11_14:RegisterAnimationSequence("WZButtonOver", var_11_65)

	local function var_11_66()
		var_11_6:AnimateSequence("WZButtonOver")
		var_11_12:AnimateSequence("WZButtonOver")
		var_11_14:AnimateSequence("WZButtonOver")
	end

	var_11_0._sequences.WZButtonOver = var_11_66

	local var_11_67
	local var_11_68 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextDefault
		},
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
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.Shadow_Color
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -59
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -29
		}
	}

	var_11_6:RegisterAnimationSequence("WZButtonUp", var_11_68)

	local var_11_69 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("WZButtonUp", var_11_69)

	local function var_11_70()
		var_11_6:AnimateSequence("WZButtonUp")
		var_11_14:AnimateSequence("WZButtonUp")
	end

	var_11_0._sequences.WZButtonUp = var_11_70

	local var_11_71
	local var_11_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.warzoneTextFocus
		},
		{
			value = -0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 1,
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
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		}
	}

	var_11_6:RegisterAnimationSequence("WZButtonOverKBM", var_11_72)

	local function var_11_73()
		var_11_6:AnimateSequence("WZButtonOverKBM")
	end

	var_11_0._sequences.WZButtonOverKBM = var_11_73

	var_0_4(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("BRPlaylistButton", BRPlaylistButton)
LockTable(_M)
