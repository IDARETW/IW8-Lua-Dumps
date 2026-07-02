module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	ACTIONS.AnimateSequence(arg_1_0, arg_1_1 and "Show" or "Hide")
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetShowWarningIcon = var_0_0

	ACTIONS.AnimateSequence(arg_2_0, "Hide")
end

function BRWarningIcon(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p)

	var_3_0.id = "BRWarningIcon"
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

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.frame, 0)
	var_3_4:setImage(RegisterMaterial("logo_mw"), 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -8, _1080p * 8)
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

	var_3_4:RegisterAnimationSequence("Show", var_3_7)

	local function var_3_8()
		var_3_4:AnimateSequence("Show")
	end

	var_3_0._sequences.Show = var_3_8

	local var_3_9
	local var_3_10 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.ItemBtn_Disabled
		}
	}

	var_3_4:RegisterAnimationSequence("Locked", var_3_10)

	local function var_3_11()
		var_3_4:AnimateSequence("Locked")
	end

	var_3_0._sequences.Locked = var_3_11

	local var_3_12
	local var_3_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Hide", var_3_13)

	local function var_3_14()
		var_3_4:AnimateSequence("Hide")
	end

	var_3_0._sequences.Hide = var_3_14

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BRWarningIcon", BRWarningIcon)
LockTable(_M)
