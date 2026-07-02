module(..., package.seeall)

function WZAccentMenuOverlay(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_1_0.id = "WZAccentMenuOverlay"
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

	var_1_4.id = "GradientLeft"

	var_1_4:SetAlpha(0.8, 0)
	var_1_4:setImage(RegisterMaterial("ui_mp_wz_bkg_vignette_left"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 960, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.GradientLeft = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "GradientRight"

	var_1_6:SetAlpha(0.6, 0)
	var_1_6:setImage(RegisterMaterial("ui_mp_wz_bkg_vignette_right"), 0)
	var_1_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -960, 0, 0, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.GradientRight = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8
	local var_1_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_mp_wz_bkg_loadout_vignette_left")
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ShowWeaponOverlay", var_1_9)

	local var_1_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("ShowWeaponOverlay", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("ShowWeaponOverlay")
		var_1_6:AnimateSequence("ShowWeaponOverlay")
	end

	var_1_0._sequences.ShowWeaponOverlay = var_1_11

	local var_1_12
	local var_1_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		},
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.multiply
		}
	}

	var_1_4:RegisterAnimationSequence("MW", var_1_13)

	local var_1_14 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -564
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.multiply
		}
	}

	var_1_6:RegisterAnimationSequence("MW", var_1_14)

	local function var_1_15()
		var_1_4:AnimateSequence("MW")
		var_1_6:AnimateSequence("MW")
	end

	var_1_0._sequences.MW = var_1_15

	return var_1_0
end

MenuBuilder.registerType("WZAccentMenuOverlay", WZAccentMenuOverlay)
LockTable(_M)
