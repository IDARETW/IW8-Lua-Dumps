module(..., package.seeall)

function BattlenetStoreEditionImage(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 146 * _1080p, 0, 80 * _1080p)

	var_1_0.id = "BattlenetStoreEditionImage"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0

	var_1_0:setUseStencil(true)

	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "EditionImage"

	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -73, _1080p * 73, _1080p * -40, _1080p * 40)
	var_1_0:addElement(var_1_4)

	var_1_0.EditionImage = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Blocker"

	var_1_6:SetRGBFromInt(0, 0)
	var_1_6:SetAlpha(0.56, 0)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -92, _1080p * 92, _1080p * -51, _1080p * 51)
	var_1_0:addElement(var_1_6)

	var_1_0.Blocker = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -81,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -45,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 81,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 45,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonOver", var_1_8)

	local var_1_9 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonOver", var_1_9)

	local function var_1_10()
		var_1_4:AnimateSequence("ButtonOver")
		var_1_6:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_10

	local var_1_11 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -73,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 73,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -40,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonUp", var_1_11)

	local var_1_12 = {
		{
			value = 0.56,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonUp", var_1_12)

	local function var_1_13()
		var_1_4:AnimateSequence("ButtonUp")
		var_1_6:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_13

	var_1_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)
	var_1_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
	end)

	return var_1_0
end

MenuBuilder.registerType("BattlenetStoreEditionImage", BattlenetStoreEditionImage)
LockTable(_M)
