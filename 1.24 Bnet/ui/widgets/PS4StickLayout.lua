module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function PS4StickLayout(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_2_0.id = "PS4StickLayout"
	var_2_0._animationSets = {}
	var_2_0._sequences = {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3

	if CONDITIONS.IsPCOrPS4(var_2_0) then
		var_2_3 = LUI.UIImage.new()
		var_2_3.id = "ControllerImage"

		var_2_3:setImage(RegisterMaterial("cont_ps4"), 0)
		var_2_3:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 512)
		var_2_0:addElement(var_2_3)

		var_2_0.ControllerImage = var_2_3
	end

	local var_2_4

	if CONDITIONS.IsPCOrPS4(var_2_0) then
		var_2_4 = LUI.UIImage.new()
		var_2_4.id = "Arrows"

		var_2_4:setImage(RegisterMaterial("cont_lines_stick_ps4"), 0)
		var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 518, _1080p * 347, _1080p * 475)
		var_2_0:addElement(var_2_4)

		var_2_0.Arrows = var_2_4
	end

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("StickLayoutDirections", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "LeftStickLayoutDirections"

	var_2_6:SetDataSourceThroughElement(var_2_0, "left")
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -226, _1080p * -25, _1080p * 411, _1080p * 661)
	var_2_0:addElement(var_2_6)

	var_2_0.LeftStickLayoutDirections = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("StickLayoutDirections", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "RightStickLayoutDirections"

	var_2_8:SetDataSourceThroughElement(var_2_0, "right")
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 537, _1080p * 738, _1080p * 411, _1080p * 663)
	var_2_0:addElement(var_2_8)

	var_2_0.RightStickLayoutDirections = var_2_8

	local function var_2_9()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_9

	local var_2_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -220
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 319
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 569
		}
	}

	var_2_6:RegisterAnimationSequence("AR", var_2_10)

	local var_2_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 531
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 319
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 732
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 569
		}
	}

	var_2_8:RegisterAnimationSequence("AR", var_2_11)

	local function var_2_12()
		var_2_6:AnimateSequence("AR")
		var_2_8:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_12

	if CONDITIONS.IsPCOrPS4(var_2_0) then
		local var_2_13 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 26
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 26
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 486
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 486
			}
		}

		var_2_3:RegisterAnimationSequence("Splitscreen", var_2_13)
	end

	if CONDITIONS.IsPCOrPS4(var_2_0) then
		local var_2_14 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 26
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 335
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 486
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 411
			}
		}

		var_2_4:RegisterAnimationSequence("Splitscreen", var_2_14)
	end

	local var_2_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 313
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 563
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -201
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_2_6:RegisterAnimationSequence("Splitscreen", var_2_15)

	local var_2_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 313
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 565
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 713
		}
	}

	var_2_8:RegisterAnimationSequence("Splitscreen", var_2_16)

	local function var_2_17()
		if CONDITIONS.IsPCOrPS4(var_2_0) then
			var_2_3:AnimateSequence("Splitscreen")
		end

		if CONDITIONS.IsPCOrPS4(var_2_0) then
			var_2_4:AnimateSequence("Splitscreen")
		end

		var_2_6:AnimateSequence("Splitscreen")
		var_2_8:AnimateSequence("Splitscreen")
	end

	var_2_0._sequences.Splitscreen = var_2_17

	ACTIONS.AnimateSequenceByElement(var_2_0, {
		elementPath = "RightStickLayoutDirections",
		sequenceName = "ArrowsOnLeft",
		elementName = "RightStickLayoutDirections"
	})
	ACTIONS.AnimateSequenceByElement(var_2_0, {
		elementPath = "LeftStickLayoutDirections",
		sequenceName = "ArrowsOnRight",
		elementName = "LeftStickLayoutDirections"
	})
	ACTIONS.AnimateSequenceByElement(var_2_0, {
		elementPath = "LeftStickLayoutDirections",
		sequenceName = "L3ButtonIcon",
		elementName = "LeftStickLayoutDirections"
	})
	ACTIONS.AnimateSequenceByElement(var_2_0, {
		elementPath = "RightStickLayoutDirections",
		sequenceName = "R3ButtonIcon",
		elementName = "RightStickLayoutDirections"
	})
	var_2_6:SetDataSourceThroughElement(var_2_0, "left")
	var_2_8:SetDataSourceThroughElement(var_2_0, "right")
	var_0_0(var_2_0, var_2_1, arg_2_1)

	if CONDITIONS.IsSplitscreen(var_2_0) then
		ACTIONS.AnimateSequence(var_2_0, "Splitscreen")
	end

	return var_2_0
end

MenuBuilder.registerType("PS4StickLayout", PS4StickLayout)
LockTable(_M)
