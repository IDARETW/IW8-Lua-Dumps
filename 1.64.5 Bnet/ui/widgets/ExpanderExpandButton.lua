module(..., package.seeall)

function ExpanderExpandButton(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 38 * _1080p, 0, 38 * _1080p)

	var_1_0.id = "ExpanderExpandButton"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Arrow"

	var_1_4:setImage(RegisterMaterial("wdg_selection_arrow_right_1"), 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 4, _1080p * -4, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Arrow = var_1_4

	local function var_1_5()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_5

	local function var_1_6()
		return
	end

	var_1_0._sequences.ButtonOver = var_1_6

	local var_1_7 = {
		{
			value = -90,
			duration = 200,
			property = TWEEN_PROPERTY.Z_Rotation,
			easing = LUI.EASING.outCubic
		}
	}

	var_1_4:RegisterAnimationSequence("Expanded", var_1_7)

	local function var_1_8()
		var_1_4:AnimateSequence("Expanded")
	end

	var_1_0._sequences.Expanded = var_1_8

	local var_1_9 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Z_Rotation,
			easing = LUI.EASING.outCubic
		}
	}

	var_1_4:RegisterAnimationSequence("Collapsed", var_1_9)

	local function var_1_10()
		var_1_4:AnimateSequence("Collapsed")
	end

	var_1_0._sequences.Collapsed = var_1_10

	return var_1_0
end

MenuBuilder.registerType("ExpanderExpandButton", ExpanderExpandButton)
LockTable(_M)
