module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0:addEventHandler("calibration_updated", arg_1_1)
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Label)
	assert(arg_2_0.Icon)
	assert(arg_2_0.Border)
	assert(arg_2_0.Visibility)
	assert(arg_2_0.Background)

	arg_2_0.SetUpdateHandler = var_0_0

	if Engine.CJJAFGIFAC(arg_2_1) then
		if not Engine.CFHBIHABCB(arg_2_1) then
			ACTIONS.AnimateSequence(arg_2_0, "WarzoneLogo")
		end
	else
		ACTIONS.AnimateSequence(arg_2_0, "HybridLogo")
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function CalibrationSwatch(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 250 * _1080p, 0, 250 * _1080p)

	var_3_0.id = "CalibrationSwatch"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("Calibration", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Background"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 225, _1080p * 25, _1080p * 225)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "Visibility"

	var_3_6:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 25, _1080p * -25, _1080p * 228, _1080p * 250)
	var_3_0:addElement(var_3_6)

	var_3_0.Visibility = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("GenericBorderFrame", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Border"

	var_3_8:SetRGBFromTable(SWATCHES.HUD.LightBacker, 0)
	var_3_8.Left:SetRight(_1080p * 1, 0)
	var_3_8.Right:SetLeft(_1080p * -1, 0)
	var_3_8.Top:SetBottom(_1080p * 1, 0)
	var_3_8.Bottom:SetTop(_1080p * -1, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 226, _1080p * 24, _1080p * 226)
	var_3_0:addElement(var_3_8)

	var_3_0.Border = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("Calibration", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "Icon"

	var_3_10:SetRGBFromInt(0, 0)
	var_3_10:setImage(RegisterMaterial("gamma_logo_cod_iw8"), 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 225, _1080p * 25, _1080p * 225)
	var_3_0:addElement(var_3_10)

	var_3_0.Icon = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "Label"

	var_3_12:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_3_12:SetAlpha(0, 0)
	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 250, 0, _1080p * 22)
	var_3_0:addElement(var_3_12)

	var_3_0.Label = var_3_12

	local function var_3_13()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_13

	local var_3_14
	local var_3_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 258
		}
	}

	var_3_6:RegisterAnimationSequence("AR", var_3_15)

	local function var_3_16()
		var_3_6:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_16

	local var_3_17
	local var_3_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("logo_wz")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 56
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 56
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 194
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 194
		}
	}

	var_3_10:RegisterAnimationSequence("WarzoneLogo", var_3_18)

	local function var_3_19()
		var_3_10:AnimateSequence("WarzoneLogo")
	end

	var_3_0._sequences.WarzoneLogo = var_3_19

	local var_3_20
	local var_3_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("logo_cod_warzone_mw")
		}
	}

	var_3_10:RegisterAnimationSequence("HybridLogo", var_3_21)

	local function var_3_22()
		var_3_10:AnimateSequence("HybridLogo")
	end

	var_3_0._sequences.HybridLogo = var_3_22

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CalibrationSwatch", CalibrationSwatch)
LockTable(_M)
