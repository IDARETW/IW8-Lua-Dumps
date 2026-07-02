module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0.Text:setText(arg_1_0._originalText)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Text)

	arg_2_0.Reset = var_0_0
	arg_2_0._originalText = arg_2_0.Text:getText()

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function CODAccountInputRequired(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 342 * _1080p, 0, 44 * _1080p)

	var_3_0.id = "CODAccountInputRequired"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background2"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_3_4:SetPixelGridEnabled(true)
	var_3_4:SetPixelGridContrast(0.5, 0)
	var_3_4:SetPixelGridBlockWidth(2, 0)
	var_3_4:SetPixelGridBlockHeight(2, 0)
	var_3_4:SetPixelGridGutterWidth(1, 0)
	var_3_4:SetPixelGridGutterHeight(1, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background2 = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Background"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_3_6:SetPixelGridEnabled(true)
	var_3_6:SetPixelGridContrast(0.25, 0)
	var_3_6:SetPixelGridBlockWidth(2, 0)
	var_3_6:SetPixelGridBlockHeight(2, 0)
	var_3_6:SetPixelGridGutterWidth(1, 0)
	var_3_6:SetPixelGridGutterHeight(1, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.Background = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "BorderImg"

	var_3_8:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 2, 0, 0)
	var_3_0:addElement(var_3_8)

	var_3_0.BorderImg = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "Text"

	var_3_10:SetRGBFromTable(SWATCHES.text.buildNumber, 0)
	var_3_10:setText(Engine.CBBHFCGDIC("CODACCOUNT/PLEASE_COMPLETE"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -156, _1080p * 155, _1080p * -12, _1080p * 12)
	var_3_0:addElement(var_3_10)

	var_3_0.Text = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Arrow"

	var_3_12:SetRGBFromTable(SWATCHES.HUD.HUDPrimary, 0)
	var_3_12:SetZRotation(180, 0)
	var_3_12:setImage(RegisterMaterial("wdg_button_arrow_tip"), 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -14, _1080p * -6, _1080p * -10, _1080p * 10)
	var_3_0:addElement(var_3_12)

	var_3_0.Arrow = var_3_12

	local function var_3_13()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_13

	local var_3_14 = {
		{
			value = 0.85,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("On", var_3_14)

	local var_3_15 = {
		{
			value = 0.85,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("On", var_3_15)

	local var_3_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("On", var_3_16)

	local var_3_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("On", var_3_17)

	local var_3_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("On", var_3_18)

	local function var_3_19()
		var_3_4:AnimateSequence("On")
		var_3_6:AnimateSequence("On")
		var_3_8:AnimateSequence("On")
		var_3_10:AnimateSequence("On")
		var_3_12:AnimateSequence("On")
	end

	var_3_0._sequences.On = var_3_19

	local var_3_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Off", var_3_20)

	local var_3_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Off", var_3_21)

	local var_3_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Off", var_3_22)

	local var_3_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Off", var_3_23)

	local var_3_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Off", var_3_24)

	local function var_3_25()
		var_3_4:AnimateSequence("Off")
		var_3_6:AnimateSequence("Off")
		var_3_8:AnimateSequence("Off")
		var_3_10:AnimateSequence("Off")
		var_3_12:AnimateSequence("Off")
	end

	var_3_0._sequences.Off = var_3_25

	local var_3_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -150
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_3_10:RegisterAnimationSequence("AR", var_3_26)

	local function var_3_27()
		var_3_10:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_27

	var_3_0:addEventHandler("menu_create", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "Off")
	end)
	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CODAccountInputRequired", CODAccountInputRequired)
LockTable(_M)
