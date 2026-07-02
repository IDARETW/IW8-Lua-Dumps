module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.NewItemSmallIcon)
	arg_1_0.NewItemSmallIcon:UpdateAlpha(arg_1_1 and 1 or 0, 0, true)
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_1 == "customization_empty_slot" then
		arg_2_0._isEmpty = true
	else
		arg_2_0._isEmpty = false
	end

	arg_2_0.Image:setImage(RegisterMaterial(arg_2_1))
	arg_2_0:SetTintIfEmpty(SWATCHES.genericButton.textDefault)
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0.Description:setText(arg_3_1)
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_1 = CONDITIONS.IsWZWipFlowEnabled() and SWATCHES.CH2.WZGenericText or arg_4_1

	if arg_4_0._isEmpty then
		arg_4_0.Image:SetRGBFromTable(arg_4_1, 0)
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.SetSelectedImage = var_0_1
	arg_5_0.SetTintIfEmpty = var_0_3
	arg_5_0.SetDisabledText = var_0_2
	arg_5_0.UpdateBreadcrumb = var_0_0
	arg_5_0._isEmpty = false
	arg_5_0._disabledText = ""

	arg_5_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		arg_6_0:SetTintIfEmpty(SWATCHES.genericButton.textFocus)
		ACTIONS.AnimateSequence(arg_6_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOver"))
	end)
	arg_5_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		arg_7_0:SetTintIfEmpty(SWATCHES.genericButton.textDefault)
		ACTIONS.AnimateSequence(arg_7_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUp"))
	end)
	arg_5_0:addEventHandler("button_disable", function(arg_8_0, arg_8_1)
		arg_8_0:SetTintIfEmpty(SWATCHES.genericButton.textDefault)
		ACTIONS.AnimateSequence(arg_8_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUpDisabled"))
	end)
	arg_5_0:addEventHandler("button_over_disable", function(arg_9_0, arg_9_1)
		arg_9_0:SetTintIfEmpty(SWATCHES.genericButton.textDisabled)
		ACTIONS.AnimateSequence(arg_9_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOverDisabled"))
	end)
	arg_5_0:addEventHandler("disable", function(arg_10_0, arg_10_1)
		ACTIONS.AnimateSequence(arg_10_0, "Locked")
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_5_0, "WZWipSetup")
	end
end

function WeaponCustomizeButton(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 301 * _1080p, 0, 112 * _1080p)

	var_11_0.id = "WeaponCustomizeButton"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "LoadoutItemButtonBackground"

	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.LoadoutItemButtonBackground = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "Image"

	var_11_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -121, _1080p * -30, _1080p * 10, _1080p * 102)
	var_11_0:addElement(var_11_6)

	var_11_0.Image = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIImage.new()

	var_11_8.id = "Lock"

	var_11_8:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_11_8:SetAlpha(0, 0)
	var_11_8:setImage(RegisterMaterial("icon_lock"), 0)
	var_11_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -25, _1080p * -5, _1080p * 5, _1080p * 25)
	var_11_0:addElement(var_11_8)

	var_11_0.Lock = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIStyledText.new()

	var_11_10.id = "Description"

	var_11_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_11_10:SetAlpha(0, 0)
	var_11_10:setText("", 0)
	var_11_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_11_10:SetAlignment(LUI.Alignment.Left)
	var_11_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_11_10:SetStartupDelay(3000)
	var_11_10:SetLineHoldTime(1000)
	var_11_10:SetAnimMoveTime(300)
	var_11_10:SetAnimMoveSpeed(100)
	var_11_10:SetEndDelay(2000)
	var_11_10:SetCrossfadeTime(400)
	var_11_10:SetFadeInTime(300)
	var_11_10:SetFadeOutTime(300)
	var_11_10:SetMaxVisibleLines(3)
	var_11_10:SetShadowRGBFromInt(0, 0)
	var_11_10:SetOutlineRGBFromInt(0, 0)
	var_11_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 14, _1080p * -128, _1080p * 36, _1080p * 58)
	var_11_0:addElement(var_11_10)

	var_11_0.Description = var_11_10

	local var_11_11
	local var_11_12 = LUI.UIStyledText.new()

	var_11_12.id = "Category"

	var_11_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_11_12:setText("WWWWWWWWWW", 0)
	var_11_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_12:SetAlignment(LUI.Alignment.Left)
	var_11_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 14, _1080p * -128, _1080p * 8, _1080p * 36)
	var_11_0:addElement(var_11_12)

	var_11_0.Category = var_11_12

	local var_11_13
	local var_11_14 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_11_1
	})

	var_11_14.id = "NewItemSmallIcon"

	var_11_14:SetAlpha(0, 0)
	var_11_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_11_0:addElement(var_11_14)

	var_11_0.NewItemSmallIcon = var_11_14

	local function var_11_15()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_15

	local var_11_16
	local var_11_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonOver", var_11_17)

	local var_11_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonOver", var_11_18)

	local var_11_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonOver", var_11_19)

	local function var_11_20()
		var_11_8:AnimateSequence("ButtonOver")
		var_11_10:AnimateSequence("ButtonOver")
		var_11_12:AnimateSequence("ButtonOver")
	end

	var_11_0._sequences.ButtonOver = var_11_20

	local var_11_21
	local var_11_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUp", var_11_22)

	local var_11_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonUp", var_11_23)

	local var_11_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUp", var_11_24)

	local function var_11_25()
		var_11_8:AnimateSequence("ButtonUp")
		var_11_10:AnimateSequence("ButtonUp")
		var_11_12:AnimateSequence("ButtonUp")
	end

	var_11_0._sequences.ButtonUp = var_11_25

	local var_11_26
	local var_11_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("Locked", var_11_27)

	local var_11_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("Locked", var_11_28)

	local var_11_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -14
		}
	}

	var_11_10:RegisterAnimationSequence("Locked", var_11_29)

	local function var_11_30()
		var_11_6:AnimateSequence("Locked")
		var_11_8:AnimateSequence("Locked")
		var_11_10:AnimateSequence("Locked")
	end

	var_11_0._sequences.Locked = var_11_30

	local var_11_31
	local var_11_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonOverDisabled", var_11_32)

	local var_11_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonOverDisabled", var_11_33)

	local var_11_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonOverDisabled", var_11_34)

	local function var_11_35()
		var_11_8:AnimateSequence("ButtonOverDisabled")
		var_11_10:AnimateSequence("ButtonOverDisabled")
		var_11_12:AnimateSequence("ButtonOverDisabled")
	end

	var_11_0._sequences.ButtonOverDisabled = var_11_35

	local var_11_36
	local var_11_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("ButtonUpDisabled", var_11_37)

	local var_11_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("ButtonUpDisabled", var_11_38)

	local var_11_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextDisabled
		}
	}

	var_11_12:RegisterAnimationSequence("ButtonUpDisabled", var_11_39)

	local function var_11_40()
		var_11_8:AnimateSequence("ButtonUpDisabled")
		var_11_10:AnimateSequence("ButtonUpDisabled")
		var_11_12:AnimateSequence("ButtonUpDisabled")
	end

	var_11_0._sequences.ButtonUpDisabled = var_11_40

	local var_11_41
	local var_11_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("WZWipSetup", var_11_42)

	local function var_11_43()
		var_11_12:AnimateSequence("WZWipSetup")
	end

	var_11_0._sequences.WZWipSetup = var_11_43

	local var_11_44
	local var_11_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("WZWipButtonOver", var_11_45)

	local var_11_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("WZWipButtonOver", var_11_46)

	local var_11_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("WZWipButtonOver", var_11_47)

	local function var_11_48()
		var_11_8:AnimateSequence("WZWipButtonOver")
		var_11_10:AnimateSequence("WZWipButtonOver")
		var_11_12:AnimateSequence("WZWipButtonOver")
	end

	var_11_0._sequences.WZWipButtonOver = var_11_48

	local var_11_49
	local var_11_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("WZWipButtonUpDisabled", var_11_50)

	local var_11_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_11_51)

	local var_11_52 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("WZWipButtonUpDisabled", var_11_52)

	local function var_11_53()
		var_11_8:AnimateSequence("WZWipButtonUpDisabled")
		var_11_10:AnimateSequence("WZWipButtonUpDisabled")
		var_11_12:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_11_0._sequences.WZWipButtonUpDisabled = var_11_53

	local var_11_54
	local var_11_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("WZWipButtonUp", var_11_55)

	local var_11_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("WZWipButtonUp", var_11_56)

	local var_11_57 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("WZWipButtonUp", var_11_57)

	local function var_11_58()
		var_11_8:AnimateSequence("WZWipButtonUp")
		var_11_10:AnimateSequence("WZWipButtonUp")
		var_11_12:AnimateSequence("WZWipButtonUp")
	end

	var_11_0._sequences.WZWipButtonUp = var_11_58

	local var_11_59
	local var_11_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("WZWipButtonOverDisabled", var_11_60)

	local var_11_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("WZWipButtonOverDisabled", var_11_61)

	local var_11_62 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("WZWipButtonOverDisabled", var_11_62)

	local function var_11_63()
		var_11_8:AnimateSequence("WZWipButtonOverDisabled")
		var_11_10:AnimateSequence("WZWipButtonOverDisabled")
		var_11_12:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_11_0._sequences.WZWipButtonOverDisabled = var_11_63

	var_0_4(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("WeaponCustomizeButton", WeaponCustomizeButton)
LockTable(_M)
