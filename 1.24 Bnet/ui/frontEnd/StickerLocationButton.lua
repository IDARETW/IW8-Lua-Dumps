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
	end)
	arg_4_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		arg_6_0:SetTintIfEmpty(SWATCHES.genericButton.textDefault)
	end)
	arg_4_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		arg_7_0:SetTintIfEmpty(SWATCHES.genericButton.textDefault)
	end)
	arg_4_0:addEventHandler("button_over_disable", function(arg_8_0, arg_8_1)
		arg_8_0:SetTintIfEmpty(SWATCHES.genericButton.textDisabled)
	end)
end

function StickerLocationButton(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIButton.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 301 * _1080p, 0, 112 * _1080p)

	var_9_0.id = "StickerLocationButton"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "LoadoutItemButtonBackground"

	var_9_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.LoadoutItemButtonBackground = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIImage.new()

	var_9_6.id = "Image"

	var_9_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -122, _1080p * -30, _1080p * 10, _1080p * 102)
	var_9_0:addElement(var_9_6)

	var_9_0.Image = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIImage.new()

	var_9_8.id = "Lock"

	var_9_8:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_9_8:SetAlpha(0, 0)
	var_9_8:setImage(RegisterMaterial("icon_lock"), 0)
	var_9_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -25, _1080p * -5, _1080p * 5, _1080p * 25)
	var_9_0:addElement(var_9_8)

	var_9_0.Lock = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIStyledText.new()

	var_9_10.id = "Category"

	var_9_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_9_10:setText("", 0)
	var_9_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_10:SetAlignment(LUI.Alignment.Left)
	var_9_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 14, _1080p * -112, _1080p * 8, _1080p * 36)
	var_9_0:addElement(var_9_10)

	var_9_0.Category = var_9_10

	local var_9_11
	local var_9_12 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_9_1
	})

	var_9_12.id = "NewItemSmallIcon"

	var_9_12:SetAlpha(0, 0)
	var_9_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_9_0:addElement(var_9_12)

	var_9_0.NewItemSmallIcon = var_9_12

	local function var_9_13()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_13

	local var_9_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonOver", var_9_14)

	local var_9_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonOver", var_9_15)

	local function var_9_16()
		var_9_8:AnimateSequence("ButtonOver")
		var_9_10:AnimateSequence("ButtonOver")
	end

	var_9_0._sequences.ButtonOver = var_9_16

	local var_9_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonUp", var_9_17)

	local var_9_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonUp", var_9_18)

	local function var_9_19()
		var_9_8:AnimateSequence("ButtonUp")
		var_9_10:AnimateSequence("ButtonUp")
	end

	var_9_0._sequences.ButtonUp = var_9_19

	local var_9_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("Locked", var_9_20)

	local var_9_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("Locked", var_9_21)

	local var_9_22 = {
		{
			value = "",
			duration = 0,
			property = TWEEN_PROPERTY.Text
		}
	}

	var_9_10:RegisterAnimationSequence("Locked", var_9_22)

	local function var_9_23()
		var_9_6:AnimateSequence("Locked")
		var_9_8:AnimateSequence("Locked")
		var_9_10:AnimateSequence("Locked")
	end

	var_9_0._sequences.Locked = var_9_23

	local var_9_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonOverDisabled", var_9_24)

	local var_9_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonOverDisabled", var_9_25)

	local function var_9_26()
		var_9_8:AnimateSequence("ButtonOverDisabled")
		var_9_10:AnimateSequence("ButtonOverDisabled")
	end

	var_9_0._sequences.ButtonOverDisabled = var_9_26

	local var_9_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonUpDisabled", var_9_27)

	local var_9_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonUpDisabled", var_9_28)

	local function var_9_29()
		var_9_8:AnimateSequence("ButtonUpDisabled")
		var_9_10:AnimateSequence("ButtonUpDisabled")
	end

	var_9_0._sequences.ButtonUpDisabled = var_9_29

	var_9_0:addEventHandler("button_over", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "ButtonOver")
	end)
	var_9_0:addEventHandler("button_up", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "ButtonUp")
	end)
	var_9_0:addEventHandler("button_disable", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "ButtonUpDisabled")
	end)
	var_9_0:addEventHandler("button_over_disable", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "ButtonOverDisabled")
	end)
	var_9_0:addEventHandler("disable", function(arg_20_0, arg_20_1)
		if not arg_20_1.controller then
			local var_20_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "Locked")
	end)
	var_0_3(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("StickerLocationButton", StickerLocationButton)
LockTable(_M)
