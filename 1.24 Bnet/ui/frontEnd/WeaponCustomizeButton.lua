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
	end)
	arg_5_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		arg_7_0:SetTintIfEmpty(SWATCHES.genericButton.textDefault)
	end)
	arg_5_0:addEventHandler("button_disable", function(arg_8_0, arg_8_1)
		arg_8_0:SetTintIfEmpty(SWATCHES.genericButton.textDefault)
	end)
	arg_5_0:addEventHandler("button_over_disable", function(arg_9_0, arg_9_1)
		arg_9_0:SetTintIfEmpty(SWATCHES.genericButton.textDisabled)
	end)
end

function WeaponCustomizeButton(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIButton.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 301 * _1080p, 0, 112 * _1080p)

	var_10_0.id = "WeaponCustomizeButton"
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

	var_10_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -121, _1080p * -30, _1080p * 10, _1080p * 102)
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

	var_10_10.id = "Description"

	var_10_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_10_10:SetAlpha(0, 0)
	var_10_10:setText("", 0)
	var_10_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_10:SetAlignment(LUI.Alignment.Left)
	var_10_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_10_10:SetStartupDelay(3000)
	var_10_10:SetLineHoldTime(1000)
	var_10_10:SetAnimMoveTime(300)
	var_10_10:SetAnimMoveSpeed(100)
	var_10_10:SetEndDelay(2000)
	var_10_10:SetCrossfadeTime(400)
	var_10_10:SetFadeInTime(300)
	var_10_10:SetFadeOutTime(300)
	var_10_10:SetMaxVisibleLines(3)
	var_10_10:SetShadowRGBFromInt(0, 0)
	var_10_10:SetOutlineRGBFromInt(0, 0)
	var_10_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 14, _1080p * -128, _1080p * 36, _1080p * 58)
	var_10_0:addElement(var_10_10)

	var_10_0.Description = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIStyledText.new()

	var_10_12.id = "Category"

	var_10_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_10_12:setText("WWWWWWWWWW", 0)
	var_10_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_12:SetAlignment(LUI.Alignment.Left)
	var_10_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 14, _1080p * -128, _1080p * 8, _1080p * 36)
	var_10_0:addElement(var_10_12)

	var_10_0.Category = var_10_12

	local var_10_13
	local var_10_14 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_10_1
	})

	var_10_14.id = "NewItemSmallIcon"

	var_10_14:SetAlpha(0, 0)
	var_10_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_10_0:addElement(var_10_14)

	var_10_0.NewItemSmallIcon = var_10_14

	local function var_10_15()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_15

	local var_10_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonOver", var_10_16)

	local var_10_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonOver", var_10_17)

	local var_10_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_10_12:RegisterAnimationSequence("ButtonOver", var_10_18)

	local function var_10_19()
		var_10_8:AnimateSequence("ButtonOver")
		var_10_10:AnimateSequence("ButtonOver")
		var_10_12:AnimateSequence("ButtonOver")
	end

	var_10_0._sequences.ButtonOver = var_10_19

	local var_10_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonUp", var_10_20)

	local var_10_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonUp", var_10_21)

	local var_10_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_10_12:RegisterAnimationSequence("ButtonUp", var_10_22)

	local function var_10_23()
		var_10_8:AnimateSequence("ButtonUp")
		var_10_10:AnimateSequence("ButtonUp")
		var_10_12:AnimateSequence("ButtonUp")
	end

	var_10_0._sequences.ButtonUp = var_10_23

	local var_10_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("Locked", var_10_24)

	local var_10_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("Locked", var_10_25)

	local var_10_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -14
		}
	}

	var_10_10:RegisterAnimationSequence("Locked", var_10_26)

	local function var_10_27()
		var_10_6:AnimateSequence("Locked")
		var_10_8:AnimateSequence("Locked")
		var_10_10:AnimateSequence("Locked")
	end

	var_10_0._sequences.Locked = var_10_27

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
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonOverDisabled", var_10_29)

	local var_10_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_10_12:RegisterAnimationSequence("ButtonOverDisabled", var_10_30)

	local function var_10_31()
		var_10_8:AnimateSequence("ButtonOverDisabled")
		var_10_10:AnimateSequence("ButtonOverDisabled")
		var_10_12:AnimateSequence("ButtonOverDisabled")
	end

	var_10_0._sequences.ButtonOverDisabled = var_10_31

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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ButtonUpDisabled", var_10_33)

	local var_10_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextDisabled
		}
	}

	var_10_12:RegisterAnimationSequence("ButtonUpDisabled", var_10_34)

	local function var_10_35()
		var_10_8:AnimateSequence("ButtonUpDisabled")
		var_10_10:AnimateSequence("ButtonUpDisabled")
		var_10_12:AnimateSequence("ButtonUpDisabled")
	end

	var_10_0._sequences.ButtonUpDisabled = var_10_35

	var_10_0:addEventHandler("button_over", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "ButtonOver")
	end)
	var_10_0:addEventHandler("button_up", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "ButtonUp")
	end)
	var_10_0:addEventHandler("button_disable", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "ButtonUpDisabled")
	end)
	var_10_0:addEventHandler("button_over_disable", function(arg_20_0, arg_20_1)
		if not arg_20_1.controller then
			local var_20_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "ButtonOverDisabled")
	end)
	var_10_0:addEventHandler("disable", function(arg_21_0, arg_21_1)
		if not arg_21_1.controller then
			local var_21_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "Locked")
	end)
	var_0_4(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("WeaponCustomizeButton", WeaponCustomizeButton)
LockTable(_M)
