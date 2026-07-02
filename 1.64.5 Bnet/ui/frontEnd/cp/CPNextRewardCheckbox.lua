module(..., package.seeall)

function CPNextRewardCheckbox(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 20 * _1080p, 0, 20 * _1080p)

	var_1_0.id = "CPNextRewardCheckbox"
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

	var_1_4.id = "CheckBoxBacking"

	var_1_4:SetRGBFromTable(SWATCHES.HUD.TextGlow, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 20, 0, _1080p * 20)
	var_1_0:addElement(var_1_4)

	var_1_0.CheckBoxBacking = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "CheckBox"

	var_1_6:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_6:SetScale(0.27, 0)
	var_1_6:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1, _1080p * 19, _1080p * 1, _1080p * 19)
	var_1_0:addElement(var_1_6)

	var_1_0.CheckBox = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8
	local var_1_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 206
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 226
		}
	}

	var_1_4:RegisterAnimationSequence("Rewardx2", var_1_9)

	local var_1_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 207
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 225
		}
	}

	var_1_6:RegisterAnimationSequence("Rewardx2", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("Rewardx2")
		var_1_6:AnimateSequence("Rewardx2")
	end

	var_1_0._sequences.Rewardx2 = var_1_11

	local var_1_12
	local var_1_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 231
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 251
		}
	}

	var_1_4:RegisterAnimationSequence("Rewardx1", var_1_13)

	local var_1_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 232
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 250
		}
	}

	var_1_6:RegisterAnimationSequence("Rewardx1", var_1_14)

	local function var_1_15()
		var_1_4:AnimateSequence("Rewardx1")
		var_1_6:AnimateSequence("Rewardx1")
	end

	var_1_0._sequences.Rewardx1 = var_1_15

	return var_1_0
end

MenuBuilder.registerType("CPNextRewardCheckbox", CPNextRewardCheckbox)
LockTable(_M)
