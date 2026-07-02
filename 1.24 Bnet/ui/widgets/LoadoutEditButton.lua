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

	arg_2_0._ButtonOver = "ButtonOver"
	arg_2_0._ButtonUp = "ButtonUp"
	arg_2_0._ButtonOverDisabled = "ButtonOverDisabled"
	arg_2_0._ButtonUpDisabled = "ButtonUpDisabled"

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
end

function LoadoutEditButton(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIButton.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 134 * _1080p, 0, 140 * _1080p)

	var_7_0.id = "LoadoutEditButton"
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

	var_7_4.id = "FullBackground"

	var_7_4:SetRGBFromInt(0, 0)
	var_7_4:SetAlpha(0, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.FullBackground = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "LoadoutItemButtonBackground"

	var_7_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_7_0:addElement(var_7_6)

	var_7_0.LoadoutItemButtonBackground = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIImage.new()

	var_7_8.id = "Icon"

	var_7_8:SetRGBFromTable(SWATCHES.CAC.labelText, 0)
	var_7_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -36, _1080p * 36, _1080p * -24, _1080p * 48)
	var_7_0:addElement(var_7_8)

	var_7_0.Icon = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIStyledText.new()

	var_7_10.id = "ItemName"

	var_7_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_7_10:setText("", 0)
	var_7_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_10:SetWordWrap(false)
	var_7_10:SetAlignment(LUI.Alignment.Center)
	var_7_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_10:SetStartupDelay(1000)
	var_7_10:SetLineHoldTime(400)
	var_7_10:SetAnimMoveTime(150)
	var_7_10:SetAnimMoveSpeed(50)
	var_7_10:SetEndDelay(1000)
	var_7_10:SetCrossfadeTime(400)
	var_7_10:SetFadeInTime(300)
	var_7_10:SetFadeOutTime(300)
	var_7_10:SetMaxVisibleLines(1)
	var_7_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 7, _1080p * -7, _1080p * 11, _1080p * 35)
	var_7_0:addElement(var_7_10)

	var_7_0.ItemName = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIImage.new()

	var_7_12.id = "Lock"

	var_7_12:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_7_12:SetAlpha(0, 0)
	var_7_12:setImage(RegisterMaterial("icon_lock"), 0)
	var_7_12:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -25, _1080p * -5, _1080p * -25, _1080p * -5)
	var_7_0:addElement(var_7_12)

	var_7_0.Lock = var_7_12

	local var_7_13

	if not CONDITIONS.IsSplitscreen(var_7_0) then
		local var_7_14 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
			controllerIndex = var_7_1
		})

		var_7_14.id = "NewItemSmallIcon"

		var_7_14:SetAlpha(0, 0)
		var_7_14:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -19, _1080p * -11, _1080p * -19, _1080p * -11)
		var_7_0:addElement(var_7_14)

		var_7_0.NewItemSmallIcon = var_7_14
	end

	local var_7_15
	local var_7_16 = LUI.UIImage.new()

	var_7_16.id = "RestrictionWarning"

	var_7_16:SetAlpha(0, 0)
	var_7_16:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_7_16:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -31, _1080p * -1, _1080p * -30, 0)
	var_7_0:addElement(var_7_16)

	var_7_0.RestrictionWarning = var_7_16

	local function var_7_17()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_17

	local var_7_18
	local var_7_19 = {
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

	var_7_8:RegisterAnimationSequence("ButtonOver", var_7_19)

	local var_7_20 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonOver", var_7_20)

	local var_7_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonOver", var_7_21)

	local function var_7_22()
		var_7_8:AnimateSequence("ButtonOver")
		var_7_10:AnimateSequence("ButtonOver")
		var_7_12:AnimateSequence("ButtonOver")
	end

	var_7_0._sequences.ButtonOver = var_7_22

	local var_7_23
	local var_7_24 = {
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

	var_7_8:RegisterAnimationSequence("ButtonUp", var_7_24)

	local var_7_25 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonUp", var_7_25)

	local var_7_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonUp", var_7_26)

	local function var_7_27()
		var_7_8:AnimateSequence("ButtonUp")
		var_7_10:AnimateSequence("ButtonUp")
		var_7_12:AnimateSequence("ButtonUp")
	end

	var_7_0._sequences.ButtonUp = var_7_27

	local var_7_28
	local var_7_29 = {
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

	var_7_8:RegisterAnimationSequence("ButtonOverDisabled", var_7_29)

	local var_7_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonOverDisabled", var_7_30)

	local function var_7_31()
		var_7_8:AnimateSequence("ButtonOverDisabled")
		var_7_12:AnimateSequence("ButtonOverDisabled")
	end

	var_7_0._sequences.ButtonOverDisabled = var_7_31

	local var_7_32
	local var_7_33 = {
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

	var_7_8:RegisterAnimationSequence("ButtonUpDisabled", var_7_33)

	local var_7_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextDisabled
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonUpDisabled", var_7_34)

	local var_7_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonUpDisabled", var_7_35)

	local function var_7_36()
		var_7_8:AnimateSequence("ButtonUpDisabled")
		var_7_10:AnimateSequence("ButtonUpDisabled")
		var_7_12:AnimateSequence("ButtonUpDisabled")
	end

	var_7_0._sequences.ButtonUpDisabled = var_7_36

	local var_7_37
	local var_7_38 = {
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

	var_7_10:RegisterAnimationSequence("JP", var_7_38)

	local function var_7_39()
		var_7_10:AnimateSequence("JP")
	end

	var_7_0._sequences.JP = var_7_39

	local var_7_40
	local var_7_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("RestrictionOn", var_7_41)

	local var_7_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("RestrictionOn", var_7_42)

	local function var_7_43()
		var_7_4:AnimateSequence("RestrictionOn")
		var_7_16:AnimateSequence("RestrictionOn")
	end

	var_7_0._sequences.RestrictionOn = var_7_43

	local var_7_44
	local var_7_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("RestrictionOff", var_7_45)

	local var_7_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("RestrictionOff", var_7_46)

	local function var_7_47()
		var_7_4:AnimateSequence("RestrictionOff")
		var_7_16:AnimateSequence("RestrictionOff")
	end

	var_7_0._sequences.RestrictionOff = var_7_47

	local var_7_48
	local var_7_49 = {
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

	var_7_8:RegisterAnimationSequence("ButtonUpBundle", var_7_49)

	local var_7_50 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextDefault
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonUpBundle", var_7_50)

	local var_7_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonUpBundle", var_7_51)

	local function var_7_52()
		var_7_8:AnimateSequence("ButtonUpBundle")
		var_7_10:AnimateSequence("ButtonUpBundle")
		var_7_12:AnimateSequence("ButtonUpBundle")
	end

	var_7_0._sequences.ButtonUpBundle = var_7_52

	local var_7_53
	local var_7_54 = {
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

	var_7_8:RegisterAnimationSequence("ButtonOverBundle", var_7_54)

	local var_7_55 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextFocus
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonOverBundle", var_7_55)

	local var_7_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonOverBundle", var_7_56)

	local function var_7_57()
		var_7_8:AnimateSequence("ButtonOverBundle")
		var_7_10:AnimateSequence("ButtonOverBundle")
		var_7_12:AnimateSequence("ButtonOverBundle")
	end

	var_7_0._sequences.ButtonOverBundle = var_7_57

	var_0_1(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("LoadoutEditButton", LoadoutEditButton)
LockTable(_M)
