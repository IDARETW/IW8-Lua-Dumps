module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.Shine:SetMask(arg_1_0.Mask)
	arg_1_0.Mask:SetAlpha(1)
	arg_1_0:addEventHandler("button_up", function(arg_2_0, arg_2_1)
		ACTIONS.AnimateSequence(arg_2_0, "ButtonUp")
	end)
	arg_1_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_3_0, "ButtonOver")
	end)

	if CONDITIONS.IsArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function CortezUpsellButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 506 * _1080p, 0, 60 * _1080p)

	var_4_0.id = "CortezUpsellButton"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Backer"

	var_4_4:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezButton, 0)
	var_4_4:setImage(RegisterMaterial("cortez_store_upsell_button"), 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Backer = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "Text"

	var_4_6:SetRGBFromTable(SWATCHES.Reticles.Black, 0)
	var_4_6:setText(ToUpperCase("Button"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -195, _1080p * 195, _1080p * -18, _1080p * 18)
	var_4_0:addElement(var_4_6)

	var_4_0.Text = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Shine"

	var_4_8:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_4_8:SetAlpha(0, 0)
	var_4_8:SetZRotation(-45, 0)
	var_4_8:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -215, _1080p * -87, _1080p * -160, _1080p * 204)
	var_4_0:addElement(var_4_8)

	var_4_0.Shine = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "Mask"

	var_4_10:SetAlpha(0, 0)
	var_4_10:setImage(RegisterMaterial("stencil_mask"), 0)
	var_4_0:addElement(var_4_10)

	var_4_0.Mask = var_4_10

	local function var_4_11()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_11

	local var_4_12
	local var_4_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -215
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -87
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 532,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 660,
			easing = LUI.EASING.inOutCubic
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -233,
			easing = LUI.EASING.snap
		},
		{
			duration = 1000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -105,
			easing = LUI.EASING.snap
		}
	}

	var_4_8:RegisterAnimationSequence("Glint", var_4_13)

	local function var_4_14()
		var_4_8:AnimateLoop("Glint")
	end

	var_4_0._sequences.Glint = var_4_14

	local var_4_15
	local var_4_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Reticles.White
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ButtonOver", var_4_16)

	local var_4_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Reticles.Black
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonOver", var_4_17)

	local function var_4_18()
		var_4_4:AnimateSequence("ButtonOver")
		var_4_6:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_18

	local var_4_19
	local var_4_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3CortezButton
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ButtonUp", var_4_20)

	local var_4_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Reticles.Black
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUp", var_4_21)

	local function var_4_22()
		var_4_4:AnimateSequence("ButtonUp")
		var_4_6:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_22

	local var_4_23
	local var_4_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 26
		}
	}

	var_4_6:RegisterAnimationSequence("AR", var_4_24)

	local function var_4_25()
		var_4_6:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_25

	local var_4_26
	local var_4_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundDisabledFocus
		}
	}

	var_4_4:RegisterAnimationSequence("ButtonDisabled", var_4_27)

	local function var_4_28()
		var_4_4:AnimateSequence("ButtonDisabled")
	end

	var_4_0._sequences.ButtonDisabled = var_4_28

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CortezUpsellButton", CortezUpsellButton)
LockTable(_M)
