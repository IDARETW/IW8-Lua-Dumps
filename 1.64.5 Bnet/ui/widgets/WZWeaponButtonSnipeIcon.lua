module(..., package.seeall)

function WZWeaponButtonSnipeIcon(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 180 * _1080p, 0, 96 * _1080p)

	var_1_0.id = "WZWeaponButtonSnipeIcon"
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

	var_1_4.id = "Icon"

	var_1_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_1_4:setImage(RegisterMaterial("ui_icon_snipe_mw_truncated"), 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Icon = var_1_4

	local function var_1_5()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_5

	local var_1_6
	local var_1_7 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_icon_snipe_blackops_truncated")
		}
	}

	var_1_4:RegisterAnimationSequence("CW", var_1_7)

	local function var_1_8()
		var_1_4:AnimateSequence("CW")
	end

	var_1_0._sequences.CW = var_1_8

	local var_1_9
	local var_1_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_icon_snipe_mw_truncated")
		}
	}

	var_1_4:RegisterAnimationSequence("MW", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("MW")
	end

	var_1_0._sequences.MW = var_1_11

	local var_1_12
	local var_1_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_mp_wz_icon_snipe_vanguard_small")
		}
	}

	var_1_4:RegisterAnimationSequence("VG", var_1_13)

	local function var_1_14()
		var_1_4:AnimateSequence("VG")
	end

	var_1_0._sequences.VG = var_1_14

	return var_1_0
end

MenuBuilder.registerType("WZWeaponButtonSnipeIcon", WZWeaponButtonSnipeIcon)
LockTable(_M)
