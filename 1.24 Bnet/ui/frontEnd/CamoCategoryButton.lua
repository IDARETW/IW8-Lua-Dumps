module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.NewItemSmallIcon)
	arg_1_0.NewItemSmallIcon:UpdateAlpha(arg_1_1 and 1 or 0)
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

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetImage = var_0_1
	arg_3_0.UpdateBreadcrumb = var_0_0

	if IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_3_0, "JP")
	end
end

function CamoCategoryButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 301 * _1080p, 0, 112 * _1080p)

	var_4_0.id = "CamoCategoryButton"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "LoadoutItemButtonBackground"

	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.LoadoutItemButtonBackground = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Image"

	var_4_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -122, _1080p * -30, _1080p * 10, _1080p * 102)
	var_4_0:addElement(var_4_6)

	var_4_0.Image = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Lock"

	var_4_8:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_4_8:SetAlpha(0, 0)
	var_4_8:setImage(RegisterMaterial("icon_lock"), 0)
	var_4_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -25, _1080p * -5, _1080p * 5, _1080p * 25)
	var_4_0:addElement(var_4_8)

	var_4_0.Lock = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "EquippedNotification"

	var_4_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -23, _1080p * -7, _1080p * 7, _1080p * 23)
	var_4_0:addElement(var_4_10)

	var_4_0.EquippedNotification = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIStyledText.new()

	var_4_12.id = "Description"

	var_4_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_4_12:SetAlpha(0.6, 0)
	var_4_12:setText("", 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_12:SetAlignment(LUI.Alignment.Left)
	var_4_12:SetShadowRGBFromInt(0, 0)
	var_4_12:SetOutlineRGBFromInt(0, 0)
	var_4_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 14, _1080p * -128, _1080p * 36, _1080p * 58)
	var_4_0:addElement(var_4_12)

	var_4_0.Description = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIStyledText.new()

	var_4_14.id = "Category"

	var_4_14:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_14:setText("", 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_14:SetAlignment(LUI.Alignment.Left)
	var_4_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 14, _1080p * -128, _1080p * 8, _1080p * 36)
	var_4_0:addElement(var_4_14)

	var_4_0.Category = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "NewItemSmallIcon"

	var_4_16:SetAlpha(0, 0)
	var_4_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_4_0:addElement(var_4_16)

	var_4_0.NewItemSmallIcon = var_4_16

	local function var_4_17()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_17

	local var_4_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonOver", var_4_18)

	local var_4_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("ButtonOver", var_4_19)

	local var_4_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_14:RegisterAnimationSequence("ButtonOver", var_4_20)

	local function var_4_21()
		var_4_8:AnimateSequence("ButtonOver")
		var_4_12:AnimateSequence("ButtonOver")
		var_4_14:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_21

	local var_4_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonUp", var_4_22)

	local var_4_23 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("ButtonUp", var_4_23)

	local var_4_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_4_14:RegisterAnimationSequence("ButtonUp", var_4_24)

	local function var_4_25()
		var_4_8:AnimateSequence("ButtonUp")
		var_4_12:AnimateSequence("ButtonUp")
		var_4_14:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_25

	local var_4_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Locked", var_4_26)

	local var_4_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Locked", var_4_27)

	local var_4_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -28
		}
	}

	var_4_12:RegisterAnimationSequence("Locked", var_4_28)

	local function var_4_29()
		var_4_6:AnimateSequence("Locked")
		var_4_8:AnimateSequence("Locked")
		var_4_12:AnimateSequence("Locked")
	end

	var_4_0._sequences.Locked = var_4_29

	local var_4_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonOverDisabled", var_4_30)

	local var_4_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("ButtonOverDisabled", var_4_31)

	local var_4_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_4_14:RegisterAnimationSequence("ButtonOverDisabled", var_4_32)

	local function var_4_33()
		var_4_8:AnimateSequence("ButtonOverDisabled")
		var_4_12:AnimateSequence("ButtonOverDisabled")
		var_4_14:AnimateSequence("ButtonOverDisabled")
	end

	var_4_0._sequences.ButtonOverDisabled = var_4_33

	local var_4_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonUpDisabled", var_4_34)

	local var_4_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("ButtonUpDisabled", var_4_35)

	local var_4_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_4_14:RegisterAnimationSequence("ButtonUpDisabled", var_4_36)

	local function var_4_37()
		var_4_8:AnimateSequence("ButtonUpDisabled")
		var_4_12:AnimateSequence("ButtonUpDisabled")
		var_4_14:AnimateSequence("ButtonUpDisabled")
	end

	var_4_0._sequences.ButtonUpDisabled = var_4_37

	local var_4_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 43
		}
	}

	var_4_16:RegisterAnimationSequence("EquippedAndNew", var_4_38)

	local function var_4_39()
		var_4_16:AnimateSequence("EquippedAndNew")
	end

	var_4_0._sequences.EquippedAndNew = var_4_39

	local var_4_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 19
		}
	}

	var_4_16:RegisterAnimationSequence("NotEquippedAndNew", var_4_40)

	local function var_4_41()
		var_4_16:AnimateSequence("NotEquippedAndNew")
	end

	var_4_0._sequences.NotEquippedAndNew = var_4_41

	local var_4_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 66
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 88
		}
	}

	var_4_12:RegisterAnimationSequence("JP", var_4_42)

	local function var_4_43()
		var_4_12:AnimateSequence("JP")
	end

	var_4_0._sequences.JP = var_4_43

	var_4_0:addEventHandler("button_over", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonOver")
	end)
	var_4_0:addEventHandler("button_up", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonUp")
	end)
	var_4_0:addEventHandler("button_disable", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonUpDisabled")
	end)
	var_4_0:addEventHandler("button_over_disable", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonOverDisabled")
	end)
	var_4_0:addEventHandler("disable", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "Locked")
	end)
	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CamoCategoryButton", CamoCategoryButton)
LockTable(_M)
