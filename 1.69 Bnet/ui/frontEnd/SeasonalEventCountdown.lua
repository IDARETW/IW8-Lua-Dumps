module(..., package.seeall)

function SeasonalEventCountdown(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 96 * _1080p)

	var_1_0.id = "SeasonalEventCountdown"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Backer2"

	var_1_4:SetAlpha(0, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, 0, _1080p * 96)
	var_1_0:addElement(var_1_4)

	var_1_0.Backer2 = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "Backer"

	var_1_6:SetAlpha(0.4, 0)
	var_1_6.Background:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_1_6.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Backer = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Gradient"

	var_1_8:SetAlpha(0.4, 0)
	var_1_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top_opaque"), 0)
	var_1_8:SetBlendMode(BLEND_MODE.multiply)
	var_1_0:addElement(var_1_8)

	var_1_0.Gradient = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "ImageGlow"

	var_1_10:SetRGBFromTable(SWATCHES.EventPromos.OutbreakRed, 0)
	var_1_10:SetAlpha(0, 0)
	var_1_10:setImage(RegisterMaterial("ui_generic_glow"), 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 23, _1080p * 134, _1080p * -46, _1080p * 67)
	var_1_0:addElement(var_1_10)

	var_1_0.ImageGlow = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "EventEndsBacking"

	var_1_12:SetRGBFromTable(SWATCHES.EventPromos.OutbreakRed, 0)
	var_1_12:SetAlpha(0, 0)
	var_1_12:setImage(RegisterMaterial("menu_backer_redact_white"), 0)
	var_1_12:Setup3SliceHorizontalImage(_1080p * 25, 0.3999999)
	var_1_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 108, _1080p * 403, _1080p * -73, _1080p * -47)
	var_1_0:addElement(var_1_12)

	var_1_0.EventEndsBacking = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIText.new()

	var_1_14.id = "EventEndsLabel"

	var_1_14:SetRGBFromTable(SWATCHES.EventPromos.halloweenText, 0)
	var_1_14:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/ENDS_IN"), 0)
	var_1_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_14:SetAlignment(LUI.Alignment.Left)
	var_1_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -94, _1080p * 185, _1080p * -25, _1080p * -1)
	var_1_0:addElement(var_1_14)

	var_1_0.EventEndsLabel = var_1_14

	local var_1_15
	local var_1_16 = LUI.UIImage.new()

	var_1_16.id = "Image"

	var_1_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 24, _1080p * 106, _1080p * -41, _1080p * 41)
	var_1_0:addElement(var_1_16)

	var_1_0.Image = var_1_16

	local var_1_17
	local var_1_18 = LUI.UIText.new()

	var_1_18.id = "CountdownLabel"

	var_1_18:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_1_18:setText("", 0)
	var_1_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_18:SetAlignment(LUI.Alignment.Left)
	var_1_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 116, _1080p * 395, _1080p * 48, _1080p * 78)
	var_1_0:addElement(var_1_18)

	var_1_0.CountdownLabel = var_1_18

	local function var_1_19()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_19

	local var_1_20
	local var_1_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("AR", var_1_21)

	local var_1_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 301
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 412
		}
	}

	var_1_10:RegisterAnimationSequence("AR", var_1_22)

	local var_1_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 313
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_1_14:RegisterAnimationSequence("AR", var_1_23)

	local var_1_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 313
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 395
		}
	}

	var_1_16:RegisterAnimationSequence("AR", var_1_24)

	local var_1_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 298
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 48
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 78
		}
	}

	var_1_18:RegisterAnimationSequence("AR", var_1_25)

	local function var_1_26()
		var_1_4:AnimateSequence("AR")
		var_1_10:AnimateSequence("AR")
		var_1_14:AnimateSequence("AR")
		var_1_16:AnimateSequence("AR")
		var_1_18:AnimateSequence("AR")
	end

	var_1_0._sequences.AR = var_1_26

	if CONDITIONS.IsArabic() then
		ACTIONS.AnimateSequence(var_1_0, "AR")
	end

	return var_1_0
end

MenuBuilder.registerType("SeasonalEventCountdown", SeasonalEventCountdown)
LockTable(_M)
