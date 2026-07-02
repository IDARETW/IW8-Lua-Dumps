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

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = LAYOUT.GetTextHeightWithWrapping(arg_3_0.Category, arg_3_0.Category:getText())
	local var_3_1, var_3_2, var_3_3, var_3_4 = arg_3_0.Category:getLocalRect()
	local var_3_5 = var_3_2 + var_3_0

	arg_3_0.Description:setText(arg_3_1)

	local var_3_6 = LAYOUT.GetTextHeightWithWrapping(arg_3_0.Description, arg_3_1)
	local var_3_7, var_3_8, var_3_9, var_3_10 = arg_3_0.Description:getLocalRect()

	arg_3_0.Description:SetTop(var_3_5)
	arg_3_0.Description:SetBottom(var_3_5 + var_3_6)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetImage = var_0_1
	arg_4_0.UpdateBreadcrumb = var_0_0
	arg_4_0.SetDescription = var_0_2

	if IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_4_0, "JP")
	end
end

function CamoCategoryButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 301 * _1080p, 0, 112 * _1080p)

	var_5_0.id = "CamoCategoryButton"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "LoadoutItemButtonBackground"

	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.LoadoutItemButtonBackground = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Image"

	var_5_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -122, _1080p * -30, _1080p * 10, _1080p * 102)
	var_5_0:addElement(var_5_6)

	var_5_0.Image = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "Lock"

	var_5_8:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_5_8:SetAlpha(0, 0)
	var_5_8:setImage(RegisterMaterial("icon_lock"), 0)
	var_5_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -25, _1080p * -5, _1080p * 5, _1080p * 25)
	var_5_0:addElement(var_5_8)

	var_5_0.Lock = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "EquippedNotification"

	var_5_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -23, _1080p * -7, _1080p * 7, _1080p * 23)
	var_5_0:addElement(var_5_10)

	var_5_0.EquippedNotification = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIStyledText.new()

	var_5_12.id = "Description"

	var_5_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_12:SetAlpha(0.6, 0)
	var_5_12:setText("", 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_12:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetShadowRGBFromInt(0, 0)
	var_5_12:SetOutlineRGBFromInt(0, 0)
	var_5_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 14, _1080p * -128, _1080p * 36, _1080p * 58)
	var_5_0:addElement(var_5_12)

	var_5_0.Description = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIStyledText.new()

	var_5_14.id = "Category"

	var_5_14:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_14:setText("", 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_14:SetAlignment(LUI.Alignment.Left)
	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 14, _1080p * 173, _1080p * 8, _1080p * 36)
	var_5_0:addElement(var_5_14)

	var_5_0.Category = var_5_14

	local var_5_15
	local var_5_16 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_5_1
	})

	var_5_16.id = "NewItemSmallIcon"

	var_5_16:SetAlpha(0, 0)
	var_5_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_5_0:addElement(var_5_16)

	var_5_0.NewItemSmallIcon = var_5_16

	local function var_5_17()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_17

	local var_5_18
	local var_5_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOver", var_5_19)

	local var_5_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonOver", var_5_20)

	local var_5_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_5_14:RegisterAnimationSequence("ButtonOver", var_5_21)

	local function var_5_22()
		var_5_8:AnimateSequence("ButtonOver")
		var_5_12:AnimateSequence("ButtonOver")
		var_5_14:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_22

	local var_5_23
	local var_5_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUp", var_5_24)

	local var_5_25 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonUp", var_5_25)

	local var_5_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_5_14:RegisterAnimationSequence("ButtonUp", var_5_26)

	local function var_5_27()
		var_5_8:AnimateSequence("ButtonUp")
		var_5_12:AnimateSequence("ButtonUp")
		var_5_14:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_27

	local var_5_28
	local var_5_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Locked", var_5_29)

	local var_5_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("Locked", var_5_30)

	local var_5_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -28
		}
	}

	var_5_12:RegisterAnimationSequence("Locked", var_5_31)

	local function var_5_32()
		var_5_6:AnimateSequence("Locked")
		var_5_8:AnimateSequence("Locked")
		var_5_12:AnimateSequence("Locked")
	end

	var_5_0._sequences.Locked = var_5_32

	local var_5_33
	local var_5_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOverDisabled", var_5_34)

	local var_5_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonOverDisabled", var_5_35)

	local var_5_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_5_14:RegisterAnimationSequence("ButtonOverDisabled", var_5_36)

	local function var_5_37()
		var_5_8:AnimateSequence("ButtonOverDisabled")
		var_5_12:AnimateSequence("ButtonOverDisabled")
		var_5_14:AnimateSequence("ButtonOverDisabled")
	end

	var_5_0._sequences.ButtonOverDisabled = var_5_37

	local var_5_38
	local var_5_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUpDisabled", var_5_39)

	local var_5_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonUpDisabled", var_5_40)

	local var_5_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_5_14:RegisterAnimationSequence("ButtonUpDisabled", var_5_41)

	local function var_5_42()
		var_5_8:AnimateSequence("ButtonUpDisabled")
		var_5_12:AnimateSequence("ButtonUpDisabled")
		var_5_14:AnimateSequence("ButtonUpDisabled")
	end

	var_5_0._sequences.ButtonUpDisabled = var_5_42

	local var_5_43
	local var_5_44 = {
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

	var_5_16:RegisterAnimationSequence("EquippedAndNew", var_5_44)

	local function var_5_45()
		var_5_16:AnimateSequence("EquippedAndNew")
	end

	var_5_0._sequences.EquippedAndNew = var_5_45

	local var_5_46
	local var_5_47 = {
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

	var_5_16:RegisterAnimationSequence("NotEquippedAndNew", var_5_47)

	local function var_5_48()
		var_5_16:AnimateSequence("NotEquippedAndNew")
	end

	var_5_0._sequences.NotEquippedAndNew = var_5_48

	local var_5_49
	local var_5_50 = {
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

	var_5_12:RegisterAnimationSequence("JP", var_5_50)

	local function var_5_51()
		var_5_12:AnimateSequence("JP")
	end

	var_5_0._sequences.JP = var_5_51

	local var_5_52
	local var_5_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("ShowImage", var_5_53)

	local function var_5_54()
		var_5_6:AnimateSequence("ShowImage")
	end

	var_5_0._sequences.ShowImage = var_5_54

	var_5_0:addEventHandler("button_over", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonOver")
	end)
	var_5_0:addEventHandler("button_up", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonUp")
	end)
	var_5_0:addEventHandler("button_disable", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonUpDisabled")
	end)
	var_5_0:addEventHandler("button_over_disable", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonOverDisabled")
	end)
	var_5_0:addEventHandler("disable", function(arg_20_0, arg_20_1)
		if not arg_20_1.controller then
			local var_20_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "Locked")
	end)
	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("CamoCategoryButton", CamoCategoryButton)
LockTable(_M)
