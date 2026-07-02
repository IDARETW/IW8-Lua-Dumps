module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0.LoadoutItemButtonBackground:SetupTheme(true)

	arg_1_0._ButtonOver = "ButtonOverBundle"
	arg_1_0._ButtonUp = "ButtonUpBundle"

	arg_1_0.Icon:setImage(RegisterMaterial("icon_blueprint_bundle_lg"))

	if not CONDITIONS.IsSplitscreen(arg_1_0) then
		ACTIONS.AnimateSequence(arg_1_0.NewItemSmallIcon, "Store")
	end

	ACTIONS.AnimateSequence(arg_1_0, "ButtonUpBundle")
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupTheme = var_0_0

	if IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_2_0, "JP")
	end

	arg_2_0._ButtonOver = WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOver")
	arg_2_0._ButtonUp = WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUp")
	arg_2_0._ButtonOverDisabled = WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOverDisabled")
	arg_2_0._ButtonUpDisabled = WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUpDisabled")

	arg_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		if not arg_3_1.controller then
			local var_3_0 = arg_2_1
		end

		ACTIONS.AnimateSequence(arg_2_0, arg_2_0._ButtonOver)
	end)
	arg_2_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		if not arg_4_1.controller then
			local var_4_0 = arg_2_1
		end

		ACTIONS.AnimateSequence(arg_2_0, arg_2_0._ButtonUp)
	end)
	arg_2_0:addEventHandler("button_over_disable", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = arg_2_1
		end

		ACTIONS.AnimateSequence(arg_2_0, arg_2_0._ButtonOverDisabled)
	end)
	arg_2_0:addEventHandler("button_disable", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = arg_2_1
		end

		ACTIONS.AnimateSequence(arg_2_0, arg_2_0._ButtonUpDisabled)
	end)
	arg_2_0.FocusableRegion:addEventHandler("button_over", function()
		arg_2_0:dispatchEventToParent({
			name = "DisplayLoadoutButtons"
		})
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

function LoadoutEditButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 134 * _1080p, 0, 140 * _1080p)

	var_8_0.id = "LoadoutEditButton"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("EmptyFocusable", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "FocusableRegion"

	var_8_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -80, _1080p * 80, 0, _1080p * 210)
	var_8_0:addElement(var_8_4)

	var_8_0.FocusableRegion = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "FullBackground"

	var_8_6:SetRGBFromInt(0, 0)
	var_8_6:SetAlpha(0, 0)
	var_8_0:addElement(var_8_6)

	var_8_0.FullBackground = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "LoadoutItemButtonBackground"

	var_8_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_8)

	var_8_0.LoadoutItemButtonBackground = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIImage.new()

	var_8_10.id = "Icon"

	var_8_10:SetRGBFromTable(SWATCHES.CAC.labelText, 0)
	var_8_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -36, _1080p * 36, _1080p * -24, _1080p * 48)
	var_8_0:addElement(var_8_10)

	var_8_0.Icon = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIStyledText.new()

	var_8_12.id = "ItemName"

	var_8_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_8_12:setText("", 0)
	var_8_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_12:SetWordWrap(false)
	var_8_12:SetAlignment(LUI.Alignment.Center)
	var_8_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_12:SetStartupDelay(1000)
	var_8_12:SetLineHoldTime(400)
	var_8_12:SetAnimMoveTime(150)
	var_8_12:SetAnimMoveSpeed(50)
	var_8_12:SetEndDelay(1000)
	var_8_12:SetCrossfadeTime(400)
	var_8_12:SetFadeInTime(300)
	var_8_12:SetFadeOutTime(300)
	var_8_12:SetMaxVisibleLines(1)
	var_8_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 7, _1080p * -7, _1080p * 11, _1080p * 35)
	var_8_0:addElement(var_8_12)

	var_8_0.ItemName = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIImage.new()

	var_8_14.id = "Lock"

	var_8_14:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_8_14:SetAlpha(0, 0)
	var_8_14:setImage(RegisterMaterial("icon_lock"), 0)
	var_8_14:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -25, _1080p * -5, _1080p * -25, _1080p * -5)
	var_8_0:addElement(var_8_14)

	var_8_0.Lock = var_8_14

	local var_8_15

	if not CONDITIONS.IsSplitscreen() then
		local var_8_16 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
			controllerIndex = var_8_1
		})

		var_8_16.id = "NewItemSmallIcon"

		var_8_16:SetAlpha(0, 0)
		var_8_16:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -19, _1080p * -11, _1080p * -19, _1080p * -11)
		var_8_0:addElement(var_8_16)

		var_8_0.NewItemSmallIcon = var_8_16
	end

	local var_8_17
	local var_8_18 = LUI.UIImage.new()

	var_8_18.id = "RestrictionWarning"

	var_8_18:SetAlpha(0, 0)
	var_8_18:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_8_18:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -31, _1080p * -1, _1080p * -30, 0)
	var_8_0:addElement(var_8_18)

	var_8_0.RestrictionWarning = var_8_18

	local function var_8_19()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_19

	local var_8_20
	local var_8_21 = {
		{
			value = 16777215,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonOver", var_8_21)

	local var_8_22 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_12:RegisterAnimationSequence("ButtonOver", var_8_22)

	local var_8_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("ButtonOver", var_8_23)

	local function var_8_24()
		var_8_10:AnimateSequence("ButtonOver")
		var_8_12:AnimateSequence("ButtonOver")
		var_8_14:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_24

	local var_8_25
	local var_8_26 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonUp", var_8_26)

	local var_8_27 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_8_12:RegisterAnimationSequence("ButtonUp", var_8_27)

	local var_8_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("ButtonUp", var_8_28)

	local function var_8_29()
		var_8_10:AnimateSequence("ButtonUp")
		var_8_12:AnimateSequence("ButtonUp")
		var_8_14:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_29

	local var_8_30
	local var_8_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonOverDisabled", var_8_31)

	local var_8_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("ButtonOverDisabled", var_8_32)

	local function var_8_33()
		var_8_10:AnimateSequence("ButtonOverDisabled")
		var_8_14:AnimateSequence("ButtonOverDisabled")
	end

	var_8_0._sequences.ButtonOverDisabled = var_8_33

	local var_8_34
	local var_8_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextDisabled
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonUpDisabled", var_8_35)

	local var_8_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextDisabled
		}
	}

	var_8_12:RegisterAnimationSequence("ButtonUpDisabled", var_8_36)

	local var_8_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("ButtonUpDisabled", var_8_37)

	local function var_8_38()
		var_8_10:AnimateSequence("ButtonUpDisabled")
		var_8_12:AnimateSequence("ButtonUpDisabled")
		var_8_14:AnimateSequence("ButtonUpDisabled")
	end

	var_8_0._sequences.ButtonUpDisabled = var_8_38

	local var_8_39
	local var_8_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5
		}
	}

	var_8_12:RegisterAnimationSequence("JP", var_8_40)

	local function var_8_41()
		var_8_12:AnimateSequence("JP")
	end

	var_8_0._sequences.JP = var_8_41

	local var_8_42
	local var_8_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("RestrictionOn", var_8_43)

	local var_8_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("RestrictionOn", var_8_44)

	local function var_8_45()
		var_8_6:AnimateSequence("RestrictionOn")
		var_8_18:AnimateSequence("RestrictionOn")
	end

	var_8_0._sequences.RestrictionOn = var_8_45

	local var_8_46
	local var_8_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("RestrictionOff", var_8_47)

	local var_8_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("RestrictionOff", var_8_48)

	local function var_8_49()
		var_8_6:AnimateSequence("RestrictionOff")
		var_8_18:AnimateSequence("RestrictionOff")
	end

	var_8_0._sequences.RestrictionOff = var_8_49

	local var_8_50
	local var_8_51 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonUpBundle", var_8_51)

	local var_8_52 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextDefault
		}
	}

	var_8_12:RegisterAnimationSequence("ButtonUpBundle", var_8_52)

	local var_8_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("ButtonUpBundle", var_8_53)

	local function var_8_54()
		var_8_10:AnimateSequence("ButtonUpBundle")
		var_8_12:AnimateSequence("ButtonUpBundle")
		var_8_14:AnimateSequence("ButtonUpBundle")
	end

	var_8_0._sequences.ButtonUpBundle = var_8_54

	local var_8_55
	local var_8_56 = {
		{
			value = 16777215,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonOverBundle", var_8_56)

	local var_8_57 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextFocus
		}
	}

	var_8_12:RegisterAnimationSequence("ButtonOverBundle", var_8_57)

	local var_8_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("ButtonOverBundle", var_8_58)

	local function var_8_59()
		var_8_10:AnimateSequence("ButtonOverBundle")
		var_8_12:AnimateSequence("ButtonOverBundle")
		var_8_14:AnimateSequence("ButtonOverBundle")
	end

	var_8_0._sequences.ButtonOverBundle = var_8_59

	local var_8_60
	local var_8_61 = {
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

	var_8_12:RegisterAnimationSequence("WZWipSetup", var_8_61)

	local function var_8_62()
		var_8_12:AnimateSequence("WZWipSetup")
	end

	var_8_0._sequences.WZWipSetup = var_8_62

	local var_8_63
	local var_8_64 = {
		{
			value = 16777215,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("WZWipButtonOver", var_8_64)

	local var_8_65 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("WZWipButtonOver", var_8_65)

	local var_8_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("WZWipButtonOver", var_8_66)

	local function var_8_67()
		var_8_10:AnimateSequence("WZWipButtonOver")
		var_8_12:AnimateSequence("WZWipButtonOver")
		var_8_14:AnimateSequence("WZWipButtonOver")
	end

	var_8_0._sequences.WZWipButtonOver = var_8_67

	local var_8_68
	local var_8_69 = {
		{
			value = 16777215,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("WZWipButtonOverBundle", var_8_69)

	local var_8_70 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextFocus
		}
	}

	var_8_12:RegisterAnimationSequence("WZWipButtonOverBundle", var_8_70)

	local var_8_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("WZWipButtonOverBundle", var_8_71)

	local function var_8_72()
		var_8_10:AnimateSequence("WZWipButtonOverBundle")
		var_8_12:AnimateSequence("WZWipButtonOverBundle")
		var_8_14:AnimateSequence("WZWipButtonOverBundle")
	end

	var_8_0._sequences.WZWipButtonOverBundle = var_8_72

	local var_8_73
	local var_8_74 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("WZWipButtonOverDisabled", var_8_74)

	local var_8_75 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("WZWipButtonOverDisabled", var_8_75)

	local var_8_76 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("WZWipButtonOverDisabled", var_8_76)

	local function var_8_77()
		var_8_10:AnimateSequence("WZWipButtonOverDisabled")
		var_8_12:AnimateSequence("WZWipButtonOverDisabled")
		var_8_14:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_8_0._sequences.WZWipButtonOverDisabled = var_8_77

	local var_8_78
	local var_8_79 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("WZWipButtonUp", var_8_79)

	local var_8_80 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("WZWipButtonUp", var_8_80)

	local var_8_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("WZWipButtonUp", var_8_81)

	local function var_8_82()
		var_8_10:AnimateSequence("WZWipButtonUp")
		var_8_12:AnimateSequence("WZWipButtonUp")
		var_8_14:AnimateSequence("WZWipButtonUp")
	end

	var_8_0._sequences.WZWipButtonUp = var_8_82

	local var_8_83
	local var_8_84 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("WZWipButtonUpBundle", var_8_84)

	local var_8_85 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextDefault
		}
	}

	var_8_12:RegisterAnimationSequence("WZWipButtonUpBundle", var_8_85)

	local var_8_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("WZWipButtonUpBundle", var_8_86)

	local function var_8_87()
		var_8_10:AnimateSequence("WZWipButtonUpBundle")
		var_8_12:AnimateSequence("WZWipButtonUpBundle")
		var_8_14:AnimateSequence("WZWipButtonUpBundle")
	end

	var_8_0._sequences.WZWipButtonUpBundle = var_8_87

	local var_8_88
	local var_8_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextDisabled
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_8_89)

	local var_8_90 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("WZWipButtonUpDisabled", var_8_90)

	local var_8_91 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("WZWipButtonUpDisabled", var_8_91)

	local function var_8_92()
		var_8_10:AnimateSequence("WZWipButtonUpDisabled")
		var_8_12:AnimateSequence("WZWipButtonUpDisabled")
		var_8_14:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_8_0._sequences.WZWipButtonUpDisabled = var_8_92

	var_0_1(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("LoadoutEditButton", LoadoutEditButton)
LockTable(_M)
