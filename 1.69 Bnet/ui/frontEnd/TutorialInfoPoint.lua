module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._infoPointText:setText(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateText = var_0_0
	arg_2_0._controllerIndex = arg_2_1

	assert(arg_2_0.TutorialInfoPointText.Text)

	arg_2_0._infoPointText = arg_2_0.TutorialInfoPointText.Text
end

function TutorialInfoPoint(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 50 * _1080p)

	var_3_0.id = "TutorialInfoPoint"
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

	var_3_4:setImage(RegisterMaterial("ui_gesture_crush"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -63, _1080p * -13, 0, _1080p * 50)
	var_3_0:addElement(var_3_4)

	var_3_0.Icon = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("TutorialInfoPointText", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "TutorialInfoPointText"

	var_3_6.Text:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 50)
	var_3_0:addElement(var_3_6)

	var_3_0.TutorialInfoPointText = var_3_6

	local function var_3_7()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	local var_3_8
	local var_3_9 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("TextOnly", var_3_9)

	local var_3_10 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("TextOnly", var_3_10)

	local function var_3_11()
		var_3_4:AnimateSequence("TextOnly")
		var_3_6:AnimateSequence("TextOnly")
	end

	var_3_0._sequences.TextOnly = var_3_11

	local var_3_12
	local var_3_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("IconAndText", var_3_13)

	local var_3_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("IconAndText", var_3_14)

	local function var_3_15()
		var_3_4:AnimateSequence("IconAndText")
		var_3_6:AnimateSequence("IconAndText")
	end

	var_3_0._sequences.IconAndText = var_3_15

	local var_3_16
	local var_3_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("IconOnly", var_3_17)

	local var_3_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("IconOnly", var_3_18)

	local function var_3_19()
		var_3_4:AnimateSequence("IconOnly")
		var_3_6:AnimateSequence("IconOnly")
	end

	var_3_0._sequences.IconOnly = var_3_19

	local var_3_20
	local var_3_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -13
		}
	}

	var_3_4:RegisterAnimationSequence("ShowIconBacker", var_3_21)

	local function var_3_22()
		var_3_4:AnimateSequence("ShowIconBacker")
	end

	var_3_0._sequences.ShowIconBacker = var_3_22

	local var_3_23
	local var_3_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -63
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -13
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 50
		}
	}

	var_3_4:RegisterAnimationSequence("HideIconBacker", var_3_24)

	local function var_3_25()
		var_3_4:AnimateSequence("HideIconBacker")
	end

	var_3_0._sequences.HideIconBacker = var_3_25

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TutorialInfoPoint", TutorialInfoPoint)
LockTable(_M)
