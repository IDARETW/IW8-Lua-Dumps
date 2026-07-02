module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	ACTIONS.AnimateSequence(arg_1_0, arg_1_1 and "On" or "Off")
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetEquipped = var_0_0

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

function EquippedNotification(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p)

	var_3_0.id = "EquippedNotification"
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

	var_3_4.id = "Icon"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_3_4:SetAlpha(0, 0)
	var_3_4:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Icon = var_3_4

	local function var_3_5()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_5

	local var_3_6
	local var_3_7 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("On", var_3_7)

	local function var_3_8()
		var_3_4:AnimateSequence("On")
	end

	var_3_0._sequences.On = var_3_8

	local var_3_9
	local var_3_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Off", var_3_10)

	local function var_3_11()
		var_3_4:AnimateSequence("Off")
	end

	var_3_0._sequences.Off = var_3_11

	local var_3_12
	local var_3_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_fill")
		}
	}

	var_3_4:RegisterAnimationSequence("Filled", var_3_13)

	local function var_3_14()
		var_3_4:AnimateSequence("Filled")
	end

	var_3_0._sequences.Filled = var_3_14

	local var_3_15
	local var_3_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_ring")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.attachmentEmpty
		}
	}

	var_3_4:RegisterAnimationSequence("Empty", var_3_16)

	local function var_3_17()
		var_3_4:AnimateSequence("Empty")
	end

	var_3_0._sequences.Empty = var_3_17

	local var_3_18
	local var_3_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_3_4:RegisterAnimationSequence("WZWipSetup", var_3_19)

	local function var_3_20()
		var_3_4:AnimateSequence("WZWipSetup")
	end

	var_3_0._sequences.WZWipSetup = var_3_20

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("EquippedNotification", EquippedNotification)
LockTable(_M)
