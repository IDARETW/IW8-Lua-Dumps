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
	if arg_3_0._isEmpty then
		arg_3_1 = CONDITIONS.IsWZWipFlowEnabled() and SWATCHES.CH2.WZGenericText or arg_3_1

		arg_3_0.Image:SetRGBFromTable(arg_3_1, 0)
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetSelectedImage = var_0_1
	arg_4_0.SetTintIfEmpty = var_0_2
	arg_4_0.UpdateBreadcrumb = var_0_0
	arg_4_0._isEmpty = false

	arg_4_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		arg_5_0:SetTintIfEmpty(SWATCHES.genericButton.textFocus)
		ACTIONS.AnimateSequence(arg_5_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOver"))
	end)
	arg_4_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		arg_6_0:SetTintIfEmpty(SWATCHES.genericButton.textDefault)
		ACTIONS.AnimateSequence(arg_6_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUp"))
	end)
	arg_4_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		arg_7_0:SetTintIfEmpty(SWATCHES.genericButton.textDefault)
		ACTIONS.AnimateSequence(arg_7_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUpDisabled"))
	end)
	arg_4_0:addEventHandler("button_over_disable", function(arg_8_0, arg_8_1)
		arg_8_0:SetTintIfEmpty(SWATCHES.genericButton.textDisabled)
		ACTIONS.AnimateSequence(arg_8_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOverDisabled"))
	end)
	arg_4_0:addEventHandler("disable", function(arg_9_0, arg_9_1)
		ACTIONS.AnimateSequence(arg_9_0, "Locked")
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_4_0, "WZWipSetup")
	end
end

function StickerLocationButton(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIButton.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 301 * _1080p, 0, 112 * _1080p)

	var_10_0.id = "StickerLocationButton"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_10_1
	})

	var_10_4.id = "LoadoutItemButtonBackground"

	var_10_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.LoadoutItemButtonBackground = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIImage.new()

	var_10_6.id = "Image"

	var_10_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -122, _1080p * -30, _1080p * 10, _1080p * 102)
	var_10_0:addElement(var_10_6)

	var_10_0.Image = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIImage.new()

	var_10_8.id = "Lock"

	var_10_8:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_10_8:SetAlpha(0, 0)
	var_10_8:setImage(RegisterMaterial("icon_lock"), 0)
	var_10_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -25, _1080p * -5, _1080p * 5, _1080p * 25)
	var_10_0:addElement(var_10_8)

	var_10_0.Lock = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIStyledText.new()

	var_10_10.id = "Category"

	var_10_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_10_10:setText("", 0)
	var_10_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_10:SetAlignment(LUI.Alignment.Left)
	var_10_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 14, _1080p * -112, _1080p * 8, _1080p * 36)
	var_10_0:addElement(var_10_10)

	var_10_0.Category = var_10_10

	local var_10_11
	local var_10_12 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_10_1
	})

	var_10_12.id = "NewItemSmallIcon"

	var_10_12:SetAlpha(0, 0)
	var_10_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_10_0:addElement(var_10_12)

	var_10_0.NewItemSmallIcon = var_10_12

	local function var_10_13()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_13

	local var_10_14
	local var_10_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonOver", var_10_15)

	local var_10_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonOver", var_10_16)

	local function var_10_17()
		var_10_8:AnimateSequence("ButtonOver")
		var_10_10:AnimateSequence("ButtonOver")
	end

	var_10_0._sequences.ButtonOver = var_10_17

	local var_10_18
	local var_10_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonUp", var_10_19)

	local var_10_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonUp", var_10_20)

	local function var_10_21()
		var_10_8:AnimateSequence("ButtonUp")
		var_10_10:AnimateSequence("ButtonUp")
	end

	var_10_0._sequences.ButtonUp = var_10_21

	local var_10_22
	local var_10_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("Locked", var_10_23)

	local var_10_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("Locked", var_10_24)

	local var_10_25 = {
		{
			value = "",
			duration = 0,
			property = TWEEN_PROPERTY.Text
		}
	}

	var_10_10:RegisterAnimationSequence("Locked", var_10_25)

	local function var_10_26()
		var_10_6:AnimateSequence("Locked")
		var_10_8:AnimateSequence("Locked")
		var_10_10:AnimateSequence("Locked")
	end

	var_10_0._sequences.Locked = var_10_26

	local var_10_27
	local var_10_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonOverDisabled", var_10_28)

	local var_10_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonOverDisabled", var_10_29)

	local function var_10_30()
		var_10_8:AnimateSequence("ButtonOverDisabled")
		var_10_10:AnimateSequence("ButtonOverDisabled")
	end

	var_10_0._sequences.ButtonOverDisabled = var_10_30

	local var_10_31
	local var_10_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonUpDisabled", var_10_32)

	local var_10_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonUpDisabled", var_10_33)

	local function var_10_34()
		var_10_8:AnimateSequence("ButtonUpDisabled")
		var_10_10:AnimateSequence("ButtonUpDisabled")
	end

	var_10_0._sequences.ButtonUpDisabled = var_10_34

	local var_10_35
	local var_10_36 = {
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

	var_10_10:RegisterAnimationSequence("WZWipSetup", var_10_36)

	local function var_10_37()
		var_10_10:AnimateSequence("WZWipSetup")
	end

	var_10_0._sequences.WZWipSetup = var_10_37

	local var_10_38
	local var_10_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("WZWipButtonOver", var_10_39)

	local var_10_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("WZWipButtonOver", var_10_40)

	local function var_10_41()
		var_10_8:AnimateSequence("WZWipButtonOver")
		var_10_10:AnimateSequence("WZWipButtonOver")
	end

	var_10_0._sequences.WZWipButtonOver = var_10_41

	local var_10_42
	local var_10_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("WZWipButtonOverDisabled", var_10_43)

	local var_10_44 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("WZWipButtonOverDisabled", var_10_44)

	local function var_10_45()
		var_10_8:AnimateSequence("WZWipButtonOverDisabled")
		var_10_10:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_10_0._sequences.WZWipButtonOverDisabled = var_10_45

	local var_10_46
	local var_10_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("WZWipButtonUp", var_10_47)

	local var_10_48 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("WZWipButtonUp", var_10_48)

	local function var_10_49()
		var_10_8:AnimateSequence("WZWipButtonUp")
		var_10_10:AnimateSequence("WZWipButtonUp")
	end

	var_10_0._sequences.WZWipButtonUp = var_10_49

	local var_10_50
	local var_10_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("WZWipButtonUpDisabled", var_10_51)

	local var_10_52 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_10_52)

	local function var_10_53()
		var_10_8:AnimateSequence("WZWipButtonUpDisabled")
		var_10_10:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_10_0._sequences.WZWipButtonUpDisabled = var_10_53

	var_0_3(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("StickerLocationButton", StickerLocationButton)
LockTable(_M)
