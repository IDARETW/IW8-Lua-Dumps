module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	return false
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Selected)
	arg_2_0:SetAlpha(1)
	ACTIONS.AnimateSequence(arg_2_0.Selected, arg_2_2 and "On" or "Off")

	arg_2_0.isSelected = arg_2_2
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_0._lastState ~= arg_3_1 then
		arg_3_0._lastState = arg_3_1

		WZWIP.AnimateThemeElement(arg_3_0, arg_3_1, {
			doSnapToState = arg_3_2
		})
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.GetNew = var_0_0
	arg_4_0.SetSelected = var_0_1

	local var_4_0 = LUI.Alignment.Left

	arg_4_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		if arg_5_0.Selected and not arg_5_0.isSelected then
			ACTIONS.AnimateSequence(arg_5_0.Selected, "SlotEmpty")
		end

		var_0_2(arg_5_0, "ButtonOver")
	end)
	arg_4_0:addEventHandler("button_over_disable", function(arg_6_0, arg_6_1)
		var_0_2(arg_6_0, "ButtonOverDisabled")
	end)
	arg_4_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		if arg_7_0.Selected and not arg_7_0.isSelected then
			ACTIONS.AnimateSequence(arg_7_0.Selected, "Off")
		end

		var_0_2(arg_7_0, "ButtonUp")
	end)
	arg_4_0:addEventHandler("button_disable", function(arg_8_0, arg_8_1)
		var_0_2(arg_8_0, "ButtonDisabled")
	end)
	THEMES.ApplyRandomMaskRotation(arg_4_0)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_4_0, "WZWipSetup")
	end
end

function SelectLoadoutButton(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIButton.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 370 * _1080p, 0, 60 * _1080p)

	var_9_0.id = "SelectLoadoutButton"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0

	local function var_9_3()
		local var_10_0 = var_9_0:GetDataSource().isLoadoutLocked:GetValue(var_9_1)

		if var_10_0 ~= nil then
			var_9_0:SetButtonDisabled(var_10_0)
		end
	end

	var_9_0:SubscribeToModelThroughElement(var_9_0, "isLoadoutLocked", var_9_3)

	local var_9_4
	local var_9_5 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_9_1
	})

	var_9_5.id = "Background"

	var_9_5:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_9_0:addElement(var_9_5)

	var_9_0.Background = var_9_5

	local var_9_6
	local var_9_7 = LUI.UIStyledText.new()

	var_9_7.id = "Text"

	var_9_7:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_9_7:setText(ToUpperCase(""), 0)
	var_9_7:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_7:SetAlignment(LUI.Alignment.Left)
	var_9_7:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_7:SetStartupDelay(2000)
	var_9_7:SetLineHoldTime(400)
	var_9_7:SetAnimMoveTime(300)
	var_9_7:SetAnimMoveSpeed(50)
	var_9_7:SetEndDelay(1500)
	var_9_7:SetCrossfadeTime(750)
	var_9_7:SetFadeInTime(300)
	var_9_7:SetFadeOutTime(300)
	var_9_7:SetMaxVisibleLines(1)
	var_9_7:SetOutlineRGBFromInt(0, 0)
	var_9_7:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -37, _1080p * -15, _1080p * 15)
	var_9_0:addElement(var_9_7)

	var_9_0.Text = var_9_7

	local var_9_8
	local var_9_9 = LUI.UIImage.new()

	var_9_9.id = "Lock"

	var_9_9:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_9_9:SetAlpha(0, 0)
	var_9_9:setImage(RegisterMaterial("icon_lock"), 0)
	var_9_9:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -25, _1080p * -5, _1080p * -10, _1080p * 10)
	var_9_0:addElement(var_9_9)

	var_9_0.Lock = var_9_9

	local var_9_10

	if CONDITIONS.InGame() then
		var_9_10 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
			controllerIndex = var_9_1
		})
		var_9_10.id = "Selected"

		var_9_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -23, _1080p * -7, _1080p * -8, _1080p * 8)
		var_9_0:addElement(var_9_10)

		var_9_0.Selected = var_9_10
	end

	local var_9_11

	if CONDITIONS.IsBRGameType() then
		var_9_11 = MenuBuilder.BuildRegisteredType("BRWarningIcon", {
			controllerIndex = var_9_1
		})
		var_9_11.id = "BRWarning"

		var_9_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 280, _1080p * 340, _1080p * 15, _1080p * 45)
		var_9_0:addElement(var_9_11)

		var_9_0.BRWarning = var_9_11
	end

	local var_9_12
	local var_9_13 = LUI.UIImage.new()

	var_9_13.id = "RestrictionWarning"

	var_9_13:SetAlpha(0, 0)
	var_9_13:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_9_13:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -58, _1080p * -23, _1080p * 12, _1080p * 48)
	var_9_0:addElement(var_9_13)

	var_9_0.RestrictionWarning = var_9_13

	local var_9_14

	if CONDITIONS.IsVanguardRevealed() then
		var_9_14 = LUI.UIImage.new()
		var_9_14.id = "Mask"

		var_9_14:SetAlpha(0, 0)
		var_9_14:setImage(RegisterMaterial("ui_mp_wz_bkg_button_3"), 0)
		var_9_0:addElement(var_9_14)

		var_9_0.Mask = var_9_14
	end

	local function var_9_15()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_15

	local var_9_16
	local var_9_17 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_9_7:RegisterAnimationSequence("ButtonUp", var_9_17)

	local function var_9_18()
		var_9_7:AnimateSequence("ButtonUp")
	end

	var_9_0._sequences.ButtonUp = var_9_18

	local var_9_19
	local var_9_20 = {
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

	var_9_7:RegisterAnimationSequence("ButtonOver", var_9_20)

	local function var_9_21()
		var_9_7:AnimateSequence("ButtonOver")
	end

	var_9_0._sequences.ButtonOver = var_9_21

	local var_9_22
	local var_9_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_9_7:RegisterAnimationSequence("ButtonDisabled", var_9_23)

	local var_9_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_9:RegisterAnimationSequence("ButtonDisabled", var_9_24)

	local function var_9_25()
		var_9_7:AnimateSequence("ButtonDisabled")
		var_9_9:AnimateSequence("ButtonDisabled")
	end

	var_9_0._sequences.ButtonDisabled = var_9_25

	local var_9_26
	local var_9_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_9_7:RegisterAnimationSequence("ButtonOverDisabled", var_9_27)

	local var_9_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_9:RegisterAnimationSequence("ButtonOverDisabled", var_9_28)

	local function var_9_29()
		var_9_7:AnimateSequence("ButtonOverDisabled")
		var_9_9:AnimateSequence("ButtonOverDisabled")
	end

	var_9_0._sequences.ButtonOverDisabled = var_9_29

	local var_9_30

	if CONDITIONS.InGame() then
		local var_9_31 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -46
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -12
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -22
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 12
			}
		}

		var_9_10:RegisterAnimationSequence("Splitscreen", var_9_31)
	end

	local function var_9_32()
		if CONDITIONS.InGame() then
			var_9_10:AnimateSequence("Splitscreen")
		end
	end

	var_9_0._sequences.Splitscreen = var_9_32

	local var_9_33
	local var_9_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -59
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_9_7:RegisterAnimationSequence("AR", var_9_34)

	local var_9_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -359
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -339
		}
	}

	var_9_9:RegisterAnimationSequence("AR", var_9_35)

	if CONDITIONS.InGame() then
		local var_9_36 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -357
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -341
			}
		}

		var_9_10:RegisterAnimationSequence("AR", var_9_36)
	end

	if CONDITIONS.IsBRGameType() then
		local var_9_37 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 39
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 69
			}
		}

		var_9_11:RegisterAnimationSequence("AR", var_9_37)
	end

	local function var_9_38()
		var_9_7:AnimateSequence("AR")
		var_9_9:AnimateSequence("AR")

		if CONDITIONS.InGame() then
			var_9_10:AnimateSequence("AR")
		end

		if CONDITIONS.IsBRGameType() then
			var_9_11:AnimateSequence("AR")
		end
	end

	var_9_0._sequences.AR = var_9_38

	local var_9_39
	local var_9_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_13:RegisterAnimationSequence("RestrictionOn", var_9_40)

	local function var_9_41()
		var_9_13:AnimateSequence("RestrictionOn")
	end

	var_9_0._sequences.RestrictionOn = var_9_41

	local var_9_42
	local var_9_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_13:RegisterAnimationSequence("RestrictionOff", var_9_43)

	local function var_9_44()
		var_9_13:AnimateSequence("RestrictionOff")
	end

	var_9_0._sequences.RestrictionOff = var_9_44

	local var_9_45
	local var_9_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_7:RegisterAnimationSequence("WZWipSetup", var_9_46)

	if CONDITIONS.IsVanguardRevealed() then
		local var_9_47 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_14:RegisterAnimationSequence("WZWipSetup", var_9_47)
	end

	local function var_9_48()
		var_9_7:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsVanguardRevealed() then
			var_9_14:AnimateSequence("WZWipSetup")
		end
	end

	var_9_0._sequences.WZWipSetup = var_9_48

	local var_9_49
	local var_9_50 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_7:RegisterAnimationSequence("WZWipButtonDisabled", var_9_50)

	local var_9_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_9:RegisterAnimationSequence("WZWipButtonDisabled", var_9_51)

	local function var_9_52()
		var_9_7:AnimateSequence("WZWipButtonDisabled")
		var_9_9:AnimateSequence("WZWipButtonDisabled")
	end

	var_9_0._sequences.WZWipButtonDisabled = var_9_52

	local var_9_53
	local var_9_54 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_7:RegisterAnimationSequence("WZWipButtonOver", var_9_54)

	local function var_9_55()
		var_9_7:AnimateSequence("WZWipButtonOver")
	end

	var_9_0._sequences.WZWipButtonOver = var_9_55

	local var_9_56
	local var_9_57 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_9_7:RegisterAnimationSequence("WZWipButtonOverDisabled", var_9_57)

	local var_9_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_9:RegisterAnimationSequence("WZWipButtonOverDisabled", var_9_58)

	local function var_9_59()
		var_9_7:AnimateSequence("WZWipButtonOverDisabled")
		var_9_9:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_9_0._sequences.WZWipButtonOverDisabled = var_9_59

	local var_9_60
	local var_9_61 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_7:RegisterAnimationSequence("WZWipButtonUp", var_9_61)

	local function var_9_62()
		var_9_7:AnimateSequence("WZWipButtonUp")
	end

	var_9_0._sequences.WZWipButtonUp = var_9_62

	var_0_3(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("SelectLoadoutButton", SelectLoadoutButton)
LockTable(_M)
