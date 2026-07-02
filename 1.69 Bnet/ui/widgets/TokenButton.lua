module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	THEMES.ApplyRandomMaskRotation(arg_1_0, {
		elementToMask = arg_1_0.Background
	})
	arg_1_0:AddTooltipData(arg_1_1, {
		tooltipDescription = Engine.CBBHFCGDIC("LUA_MENU/TOKEN_TOOLTIP")
	})
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		WZWIP.AnimateThemeElement(arg_2_0, "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		WZWIP.AnimateThemeElement(arg_3_0, "ButtonUp")
	end)
	arg_1_0:addEventHandler("disable", function(arg_4_0, arg_4_1)
		WZWIP.AnimateThemeElement(arg_4_0, "ButtonDisabled")
	end)
	arg_1_0:addEventHandler("button_over_disable", function(arg_5_0, arg_5_1)
		WZWIP.AnimateThemeElement(arg_5_0, "ButtonOverDisabled")
	end)
	arg_1_0:addEventHandler("button_disable", function(arg_6_0, arg_6_1)
		WZWIP.AnimateThemeElement(arg_6_0, "ButtonDisabled")
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function TokenButton(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIButton.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 80 * _1080p)

	var_7_0.id = "TokenButton"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "Background"

	var_7_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Background = var_7_4

	local var_7_5

	if CONDITIONS.IsVanguardRevealed() then
		local var_7_6 = LUI.UIImage.new()

		var_7_6.id = "Mask"

		var_7_6:setImage(RegisterMaterial("ui_mp_wz_bkg_button_2"), 0)
		var_7_0:addElement(var_7_6)

		var_7_0.Mask = var_7_6
	end

	local var_7_7
	local var_7_8 = LUI.UIStyledText.new()

	var_7_8.id = "TimerText"

	var_7_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_7_8:SetAlpha(0.5, 0)
	var_7_8:setText("", 0)
	var_7_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_8:SetWordWrap(false)
	var_7_8:SetAlignment(LUI.Alignment.Left)
	var_7_8:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_7_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 87, _1080p * 416, _1080p * -3, _1080p * 15)
	var_7_0:addElement(var_7_8)

	var_7_0.TimerText = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIStyledText.new()

	var_7_10.id = "Text"

	var_7_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_7_10:setText("", 0)
	var_7_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_10:SetWordWrap(false)
	var_7_10:SetAlignment(LUI.Alignment.Left)
	var_7_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_10:SetStartupDelay(2000)
	var_7_10:SetLineHoldTime(400)
	var_7_10:SetAnimMoveTime(2000)
	var_7_10:SetAnimMoveSpeed(150)
	var_7_10:SetEndDelay(2000)
	var_7_10:SetCrossfadeTime(1000)
	var_7_10:SetFadeInTime(300)
	var_7_10:SetFadeOutTime(300)
	var_7_10:SetMaxVisibleLines(1)
	var_7_10:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_7_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 87, _1080p * 365, _1080p * -27, _1080p * -3)
	var_7_0:addElement(var_7_10)

	var_7_0.Text = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIStyledText.new()

	var_7_12.id = "NumberCount"

	var_7_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_7_12:SetAlpha(0.5, 0)
	var_7_12:setText("x999", 0)
	var_7_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_12:SetWordWrap(false)
	var_7_12:SetAlignment(LUI.Alignment.Right)
	var_7_12:SetShadowRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_7_12:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -65, _1080p * -14, _1080p * -26, _1080p * -4)
	var_7_0:addElement(var_7_12)

	var_7_0.NumberCount = var_7_12

	local var_7_13
	local var_7_14 = LUI.UIImage.new()

	var_7_14.id = "TokenImage"

	var_7_14:SetAlpha(0.5, 0)
	var_7_14:setImage(RegisterMaterial("icon_double_xp_token"), 0)
	var_7_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 6, _1080p * 78, _1080p * -38, _1080p * 34)
	var_7_0:addElement(var_7_14)

	var_7_0.TokenImage = var_7_14

	local var_7_15
	local var_7_16 = LUI.UIImage.new()

	var_7_16.id = "Lock"

	var_7_16:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_7_16:SetAlpha(0, 0)
	var_7_16:setImage(RegisterMaterial("icon_lock"), 0)
	var_7_16:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -40, _1080p * -10, _1080p * -36, _1080p * -6)
	var_7_0:addElement(var_7_16)

	var_7_0.Lock = var_7_16

	local var_7_17

	if CONDITIONS.IsVanguardRevealed() then
		var_7_17 = LUI.UIImage.new()
		var_7_17.id = "VGSnipe"

		var_7_17:SetAlpha(0, 0)
		var_7_17:SetScale(-0.6, 0)
		var_7_17:setImage(RegisterMaterial("ui_mp_wz_icon_snipe_vanguard_small"), 0)
		var_7_17:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -136, _1080p * 44, _1080p * -69, _1080p * 27)
		var_7_0:addElement(var_7_17)

		var_7_0.VGSnipe = var_7_17
	end

	local function var_7_18()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_18

	local var_7_19
	local var_7_20 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonOver", var_7_20)

	local var_7_21 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonOver", var_7_21)

	local var_7_22 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonOver", var_7_22)

	local var_7_23 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonOver", var_7_23)

	local function var_7_24()
		var_7_8:AnimateSequence("ButtonOver")
		var_7_10:AnimateSequence("ButtonOver")
		var_7_12:AnimateSequence("ButtonOver")
		var_7_14:AnimateSequence("ButtonOver")
	end

	var_7_0._sequences.ButtonOver = var_7_24

	local var_7_25
	local var_7_26 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUp", var_7_26)

	local var_7_27 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonUp", var_7_27)

	local var_7_28 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonUp", var_7_28)

	local var_7_29 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonUp", var_7_29)

	local function var_7_30()
		var_7_8:AnimateSequence("ButtonUp")
		var_7_10:AnimateSequence("ButtonUp")
		var_7_12:AnimateSequence("ButtonUp")
		var_7_14:AnimateSequence("ButtonUp")
	end

	var_7_0._sequences.ButtonUp = var_7_30

	local var_7_31
	local var_7_32 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonOverDisabled", var_7_32)

	local var_7_33 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonOverDisabled", var_7_33)

	local var_7_34 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonOverDisabled", var_7_34)

	local var_7_35 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonOverDisabled", var_7_35)

	local function var_7_36()
		var_7_8:AnimateSequence("ButtonOverDisabled")
		var_7_10:AnimateSequence("ButtonOverDisabled")
		var_7_12:AnimateSequence("ButtonOverDisabled")
		var_7_14:AnimateSequence("ButtonOverDisabled")
	end

	var_7_0._sequences.ButtonOverDisabled = var_7_36

	local var_7_37
	local var_7_38 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUpDisabled", var_7_38)

	local var_7_39 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonUpDisabled", var_7_39)

	local var_7_40 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonUpDisabled", var_7_40)

	local var_7_41 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonUpDisabled", var_7_41)

	local function var_7_42()
		var_7_8:AnimateSequence("ButtonUpDisabled")
		var_7_10:AnimateSequence("ButtonUpDisabled")
		var_7_12:AnimateSequence("ButtonUpDisabled")
		var_7_14:AnimateSequence("ButtonUpDisabled")
	end

	var_7_0._sequences.ButtonUpDisabled = var_7_42

	local var_7_43
	local var_7_44 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonDisabled", var_7_44)

	local var_7_45 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonDisabled", var_7_45)

	local var_7_46 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonDisabled", var_7_46)

	local var_7_47 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonDisabled", var_7_47)

	local function var_7_48()
		var_7_8:AnimateSequence("ButtonDisabled")
		var_7_10:AnimateSequence("ButtonDisabled")
		var_7_12:AnimateSequence("ButtonDisabled")
		var_7_14:AnimateSequence("ButtonDisabled")
	end

	var_7_0._sequences.ButtonDisabled = var_7_48

	local var_7_49
	local var_7_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_7_8:RegisterAnimationSequence("WZWipSetup", var_7_50)

	local var_7_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("WZWipSetup", var_7_51)

	local var_7_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_7_12:RegisterAnimationSequence("WZWipSetup", var_7_52)

	local var_7_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_7_16:RegisterAnimationSequence("WZWipSetup", var_7_53)

	local function var_7_54()
		var_7_8:AnimateSequence("WZWipSetup")
		var_7_10:AnimateSequence("WZWipSetup")
		var_7_12:AnimateSequence("WZWipSetup")
		var_7_16:AnimateSequence("WZWipSetup")
	end

	var_7_0._sequences.WZWipSetup = var_7_54

	local var_7_55
	local var_7_56 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("WZWipButtonUpDisabled", var_7_56)

	local var_7_57 = {
		{
			value = 0.6,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_7_57)

	local var_7_58 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("WZWipButtonUpDisabled", var_7_58)

	local var_7_59 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("WZWipButtonUpDisabled", var_7_59)

	if CONDITIONS.IsVanguardRevealed() then
		local var_7_60 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -166
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 14
			}
		}

		var_7_17:RegisterAnimationSequence("WZWipButtonUpDisabled", var_7_60)
	end

	local function var_7_61()
		var_7_8:AnimateSequence("WZWipButtonUpDisabled")
		var_7_10:AnimateSequence("WZWipButtonUpDisabled")
		var_7_12:AnimateSequence("WZWipButtonUpDisabled")
		var_7_14:AnimateSequence("WZWipButtonUpDisabled")

		if CONDITIONS.IsVanguardRevealed() then
			var_7_17:AnimateSequence("WZWipButtonUpDisabled")
		end
	end

	var_7_0._sequences.WZWipButtonUpDisabled = var_7_61

	local var_7_62
	local var_7_63 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("WZWipButtonUp", var_7_63)

	local var_7_64 = {
		{
			value = 0.6,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("WZWipButtonUp", var_7_64)

	local var_7_65 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("WZWipButtonUp", var_7_65)

	local var_7_66 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("WZWipButtonUp", var_7_66)

	if CONDITIONS.IsVanguardRevealed() then
		local var_7_67 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -136
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 44
			}
		}

		var_7_17:RegisterAnimationSequence("WZWipButtonUp", var_7_67)
	end

	local function var_7_68()
		var_7_8:AnimateSequence("WZWipButtonUp")
		var_7_10:AnimateSequence("WZWipButtonUp")
		var_7_12:AnimateSequence("WZWipButtonUp")
		var_7_14:AnimateSequence("WZWipButtonUp")

		if CONDITIONS.IsVanguardRevealed() then
			var_7_17:AnimateSequence("WZWipButtonUp")
		end
	end

	var_7_0._sequences.WZWipButtonUp = var_7_68

	local var_7_69
	local var_7_70 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("WZWipButtonOverDisabled", var_7_70)

	local var_7_71 = {
		{
			value = 0.8,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("WZWipButtonOverDisabled", var_7_71)

	local var_7_72 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("WZWipButtonOverDisabled", var_7_72)

	local var_7_73 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("WZWipButtonOverDisabled", var_7_73)

	if CONDITIONS.IsVanguardRevealed() then
		local var_7_74 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -166
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 14
			}
		}

		var_7_17:RegisterAnimationSequence("WZWipButtonOverDisabled", var_7_74)
	end

	local function var_7_75()
		var_7_8:AnimateSequence("WZWipButtonOverDisabled")
		var_7_10:AnimateSequence("WZWipButtonOverDisabled")
		var_7_12:AnimateSequence("WZWipButtonOverDisabled")
		var_7_14:AnimateSequence("WZWipButtonOverDisabled")

		if CONDITIONS.IsVanguardRevealed() then
			var_7_17:AnimateSequence("WZWipButtonOverDisabled")
		end
	end

	var_7_0._sequences.WZWipButtonOverDisabled = var_7_75

	local var_7_76
	local var_7_77 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("WZWipButtonOver", var_7_77)

	local var_7_78 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("WZWipButtonOver", var_7_78)

	local var_7_79 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("WZWipButtonOver", var_7_79)

	local var_7_80 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("WZWipButtonOver", var_7_80)

	if CONDITIONS.IsVanguardRevealed() then
		local var_7_81 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -136
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 44
			}
		}

		var_7_17:RegisterAnimationSequence("WZWipButtonOver", var_7_81)
	end

	local function var_7_82()
		var_7_8:AnimateSequence("WZWipButtonOver")
		var_7_10:AnimateSequence("WZWipButtonOver")
		var_7_12:AnimateSequence("WZWipButtonOver")
		var_7_14:AnimateSequence("WZWipButtonOver")

		if CONDITIONS.IsVanguardRevealed() then
			var_7_17:AnimateSequence("WZWipButtonOver")
		end
	end

	var_7_0._sequences.WZWipButtonOver = var_7_82

	local var_7_83
	local var_7_84 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("WZWipButtonDisabled", var_7_84)

	local var_7_85 = {
		{
			value = 0.6,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("WZWipButtonDisabled", var_7_85)

	local var_7_86 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("WZWipButtonDisabled", var_7_86)

	local var_7_87 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("WZWipButtonDisabled", var_7_87)

	if CONDITIONS.IsVanguardRevealed() then
		local var_7_88 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -166
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 14
			}
		}

		var_7_17:RegisterAnimationSequence("WZWipButtonDisabled", var_7_88)
	end

	local function var_7_89()
		var_7_8:AnimateSequence("WZWipButtonDisabled")
		var_7_10:AnimateSequence("WZWipButtonDisabled")
		var_7_12:AnimateSequence("WZWipButtonDisabled")
		var_7_14:AnimateSequence("WZWipButtonDisabled")

		if CONDITIONS.IsVanguardRevealed() then
			var_7_17:AnimateSequence("WZWipButtonDisabled")
		end
	end

	var_7_0._sequences.WZWipButtonDisabled = var_7_89

	local var_7_90

	if CONDITIONS.IsVanguardRevealed() then
		local var_7_91 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_17:RegisterAnimationSequence("ShowVGSnipe", var_7_91)
	end

	local function var_7_92()
		if CONDITIONS.IsVanguardRevealed() then
			var_7_17:AnimateSequence("ShowVGSnipe")
		end
	end

	var_7_0._sequences.ShowVGSnipe = var_7_92

	local var_7_93
	local var_7_94 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("SetLocked", var_7_94)

	local function var_7_95()
		var_7_16:AnimateSequence("SetLocked")
	end

	var_7_0._sequences.SetLocked = var_7_95

	local var_7_96
	local var_7_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("SetUnlocked", var_7_97)

	local function var_7_98()
		var_7_16:AnimateSequence("SetUnlocked")
	end

	var_7_0._sequences.SetUnlocked = var_7_98

	var_0_0(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("TokenButton", TokenButton)
LockTable(_M)
