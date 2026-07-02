module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.NewItemSmallIcon)
	arg_1_0.NewItemSmallIcon:UpdateAlpha(arg_1_1 and 1 or 0, 0, true)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_2 ~= "" then
		arg_2_0._images[arg_2_1]:setImage(RegisterMaterial(arg_2_2))

		if arg_2_2 == WEAPON.emptyCustomizeSlotIcon then
			arg_2_0._isEmptyImages[arg_2_1] = true
		else
			arg_2_0._isEmptyImages[arg_2_1] = false
		end

		arg_2_0:EmptySlotColor(arg_2_1, SWATCHES.genericButton.textDefault)
	else
		arg_2_0._images[arg_2_1]:SetAlpha(0)
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	assert(arg_3_0.Image1)
	ACTIONS.AnimateSequence(arg_3_0, "ShowSticker" .. tostring(arg_3_1))

	local var_3_0 = 316 + (LAYOUT.GetElementWidth(arg_3_0.Image1) / _1080p + 5) * (arg_3_1 - 1)

	arg_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_3_0 * _1080p, 0, 112 * _1080p)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_0._isEmptyImages[arg_4_1] then
		arg_4_0._images[arg_4_1]:SetRGBFromTable(arg_4_2, 0)
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.Image1)
	assert(arg_5_0.Image2)
	assert(arg_5_0.Image3)
	assert(arg_5_0.Image4)

	arg_5_0.SetImageWithNum = var_0_1
	arg_5_0.SetAvailableImages = var_0_2
	arg_5_0.EmptySlotColor = var_0_3
	arg_5_0.UpdateBreadcrumb = var_0_0
	arg_5_0._images = {
		arg_5_0.Image1,
		arg_5_0.Image2,
		arg_5_0.Image3,
		arg_5_0.Image4
	}
	arg_5_0._isEmptyImages = {
		false,
		false,
		false,
		false
	}

	arg_5_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		for iter_6_0 = 1, #arg_5_0._images do
			arg_5_0:EmptySlotColor(iter_6_0, SWATCHES.genericButton.textFocus)
		end
	end)
	arg_5_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		for iter_7_0 = 1, #arg_5_0._images do
			arg_5_0:EmptySlotColor(iter_7_0, SWATCHES.genericButton.textDefault)
		end
	end)
	arg_5_0:addEventHandler("button_disable", function(arg_8_0, arg_8_1)
		for iter_8_0 = 1, #arg_5_0._images do
			arg_5_0:EmptySlotColor(iter_8_0, SWATCHES.genericButton.textDefault)
		end
	end)
	arg_5_0:addEventHandler("button_over_disable", function(arg_9_0, arg_9_1)
		for iter_9_0 = 1, #arg_5_0._images do
			arg_5_0:EmptySlotColor(iter_9_0, SWATCHES.genericButton.textDisabled)
		end
	end)
end

function StickerCustomizeButton(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIButton.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 301 * _1080p, 0, 112 * _1080p)

	var_10_0.id = "StickerCustomizeButton"
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

	var_10_6.id = "Image1"

	var_10_6:setImage(RegisterMaterial("customization_empty_slot"), 0)
	var_10_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 194, _1080p * 286, _1080p * 10, _1080p * 102)
	var_10_0:addElement(var_10_6)

	var_10_0.Image1 = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIImage.new()

	var_10_8.id = "Image2"

	var_10_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 291, _1080p * 383, _1080p * 10, _1080p * 102)
	var_10_0:addElement(var_10_8)

	var_10_0.Image2 = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIImage.new()

	var_10_10.id = "Image3"

	var_10_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 388, _1080p * 480, _1080p * 10, _1080p * 102)
	var_10_0:addElement(var_10_10)

	var_10_0.Image3 = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIImage.new()

	var_10_12.id = "Image4"

	var_10_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 485, _1080p * 577, _1080p * 10, _1080p * 102)
	var_10_0:addElement(var_10_12)

	var_10_0.Image4 = var_10_12

	local var_10_13
	local var_10_14 = LUI.UIImage.new()

	var_10_14.id = "Lock"

	var_10_14:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_10_14:SetAlpha(0, 0)
	var_10_14:setImage(RegisterMaterial("icon_lock"), 0)
	var_10_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -25, _1080p * -5, _1080p * 5, _1080p * 25)
	var_10_0:addElement(var_10_14)

	var_10_0.Lock = var_10_14

	local var_10_15
	local var_10_16 = LUI.UIStyledText.new()

	var_10_16.id = "Description"

	var_10_16:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_10_16:SetAlpha(0, 0)
	var_10_16:setText("", 0)
	var_10_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_16:SetAlignment(LUI.Alignment.Left)
	var_10_16:SetShadowRGBFromInt(0, 0)
	var_10_16:SetOutlineRGBFromInt(0, 0)
	var_10_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 14, _1080p * 189, _1080p * 37, _1080p * 58)
	var_10_0:addElement(var_10_16)

	var_10_0.Description = var_10_16

	local var_10_17
	local var_10_18 = LUI.UIStyledText.new()

	var_10_18.id = "Category"

	var_10_18:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_10_18:setText("WWWWWWWWWW", 0)
	var_10_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_18:SetAlignment(LUI.Alignment.Left)
	var_10_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 14, _1080p * 189, _1080p * 9, _1080p * 37)
	var_10_0:addElement(var_10_18)

	var_10_0.Category = var_10_18

	local var_10_19
	local var_10_20 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_10_1
	})

	var_10_20.id = "NewItemSmallIcon"

	var_10_20:SetAlpha(0, 0)
	var_10_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_10_0:addElement(var_10_20)

	var_10_0.NewItemSmallIcon = var_10_20

	local function var_10_21()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_21

	local var_10_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ButtonOver", var_10_22)

	local var_10_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ButtonOver", var_10_23)

	local var_10_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_10_18:RegisterAnimationSequence("ButtonOver", var_10_24)

	local function var_10_25()
		var_10_14:AnimateSequence("ButtonOver")
		var_10_16:AnimateSequence("ButtonOver")
		var_10_18:AnimateSequence("ButtonOver")
	end

	var_10_0._sequences.ButtonOver = var_10_25

	local var_10_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ButtonUp", var_10_26)

	local var_10_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ButtonUp", var_10_27)

	local var_10_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_10_18:RegisterAnimationSequence("ButtonUp", var_10_28)

	local function var_10_29()
		var_10_14:AnimateSequence("ButtonUp")
		var_10_16:AnimateSequence("ButtonUp")
		var_10_18:AnimateSequence("ButtonUp")
	end

	var_10_0._sequences.ButtonUp = var_10_29

	local var_10_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ButtonOverDisabled", var_10_30)

	local var_10_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ButtonOverDisabled", var_10_31)

	local var_10_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_10_18:RegisterAnimationSequence("ButtonOverDisabled", var_10_32)

	local function var_10_33()
		var_10_14:AnimateSequence("ButtonOverDisabled")
		var_10_16:AnimateSequence("ButtonOverDisabled")
		var_10_18:AnimateSequence("ButtonOverDisabled")
	end

	var_10_0._sequences.ButtonOverDisabled = var_10_33

	local var_10_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ButtonUpDisabled", var_10_34)

	local var_10_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("ButtonUpDisabled", var_10_35)

	local var_10_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_10_18:RegisterAnimationSequence("ButtonUpDisabled", var_10_36)

	local function var_10_37()
		var_10_14:AnimateSequence("ButtonUpDisabled")
		var_10_16:AnimateSequence("ButtonUpDisabled")
		var_10_18:AnimateSequence("ButtonUpDisabled")
	end

	var_10_0._sequences.ButtonUpDisabled = var_10_37

	local var_10_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("Locked", var_10_38)

	local var_10_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("Locked", var_10_39)

	local var_10_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("Locked", var_10_40)

	local var_10_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("Locked", var_10_41)

	local var_10_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("Locked", var_10_42)

	local function var_10_43()
		var_10_6:AnimateSequence("Locked")
		var_10_8:AnimateSequence("Locked")
		var_10_10:AnimateSequence("Locked")
		var_10_12:AnimateSequence("Locked")
		var_10_14:AnimateSequence("Locked")
	end

	var_10_0._sequences.Locked = var_10_43

	local var_10_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ShowSticker1", var_10_44)

	local var_10_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ShowSticker1", var_10_45)

	local var_10_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ShowSticker1", var_10_46)

	local var_10_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("ShowSticker1", var_10_47)

	local function var_10_48()
		var_10_6:AnimateSequence("ShowSticker1")
		var_10_8:AnimateSequence("ShowSticker1")
		var_10_10:AnimateSequence("ShowSticker1")
		var_10_12:AnimateSequence("ShowSticker1")
	end

	var_10_0._sequences.ShowSticker1 = var_10_48

	local var_10_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ShowSticker2", var_10_49)

	local var_10_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ShowSticker2", var_10_50)

	local var_10_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ShowSticker2", var_10_51)

	local var_10_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("ShowSticker2", var_10_52)

	local function var_10_53()
		var_10_6:AnimateSequence("ShowSticker2")
		var_10_8:AnimateSequence("ShowSticker2")
		var_10_10:AnimateSequence("ShowSticker2")
		var_10_12:AnimateSequence("ShowSticker2")
	end

	var_10_0._sequences.ShowSticker2 = var_10_53

	local var_10_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ShowSticker3", var_10_54)

	local var_10_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ShowSticker3", var_10_55)

	local var_10_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ShowSticker3", var_10_56)

	local var_10_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("ShowSticker3", var_10_57)

	local function var_10_58()
		var_10_6:AnimateSequence("ShowSticker3")
		var_10_8:AnimateSequence("ShowSticker3")
		var_10_10:AnimateSequence("ShowSticker3")
		var_10_12:AnimateSequence("ShowSticker3")
	end

	var_10_0._sequences.ShowSticker3 = var_10_58

	local var_10_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ShowSticker4", var_10_59)

	local var_10_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ShowSticker4", var_10_60)

	local var_10_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ShowSticker4", var_10_61)

	local var_10_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_12:RegisterAnimationSequence("ShowSticker4", var_10_62)

	local function var_10_63()
		var_10_6:AnimateSequence("ShowSticker4")
		var_10_8:AnimateSequence("ShowSticker4")
		var_10_10:AnimateSequence("ShowSticker4")
		var_10_12:AnimateSequence("ShowSticker4")
	end

	var_10_0._sequences.ShowSticker4 = var_10_63

	var_10_0:addEventHandler("button_over", function(arg_21_0, arg_21_1)
		if not arg_21_1.controller then
			local var_21_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "ButtonOver")
	end)
	var_10_0:addEventHandler("button_up", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "ButtonUp")
	end)
	var_10_0:addEventHandler("button_disable", function(arg_23_0, arg_23_1)
		if not arg_23_1.controller then
			local var_23_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "ButtonUpDisabled")
	end)
	var_10_0:addEventHandler("button_over_disable", function(arg_24_0, arg_24_1)
		if not arg_24_1.controller then
			local var_24_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "ButtonOverDisabled")
	end)
	var_10_0:addEventHandler("disable", function(arg_25_0, arg_25_1)
		if not arg_25_1.controller then
			local var_25_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "Locked")
	end)
	var_0_4(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("StickerCustomizeButton", StickerCustomizeButton)
LockTable(_M)
