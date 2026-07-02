module(..., package.seeall)

function XB3StickLayout(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_1_0.id = "XB3StickLayout"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3

	if CONDITIONS.IsPCOrXB3(var_1_0) then
		var_1_3 = LUI.UIImage.new()
		var_1_3.id = "ControllerImage"

		var_1_3:setImage(RegisterMaterial("cont"), 0)
		var_1_3:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, _1080p * 26, _1080p * 538)
		var_1_0:addElement(var_1_3)

		var_1_0.ControllerImage = var_1_3
	end

	local var_1_4

	if CONDITIONS.IsPCOrXB3(var_1_0) then
		var_1_4 = LUI.UIImage.new()
		var_1_4.id = "Arrows"

		var_1_4:SetScale(-0.04, 0)
		var_1_4:setImage(RegisterMaterial("cont_lines_stick_xb3"), 0)
		var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -48, _1080p * 464, _1080p * 337, _1080p * 465)
		var_1_0:addElement(var_1_4)

		var_1_0.Arrows = var_1_4
	end

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("StickLayoutDirections", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "LeftStickLayoutDirections"

	var_1_6:SetDataSourceThroughElement(var_1_0, "left")
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -170, _1080p * 30, _1080p * 455, _1080p * 705)
	var_1_0:addElement(var_1_6)

	var_1_0.LeftStickLayoutDirections = var_1_6

	local var_1_7
	local var_1_8 = MenuBuilder.BuildRegisteredType("StickLayoutDirections", {
		controllerIndex = var_1_1
	})

	var_1_8.id = "RightStickLayoutDirections"

	var_1_8:SetDataSourceThroughElement(var_1_0, "right")
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 400, _1080p * 600, _1080p * 455, _1080p * 717)
	var_1_0:addElement(var_1_8)

	var_1_0.RightStickLayoutDirections = var_1_8

	local function var_1_9()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_9

	if CONDITIONS.IsPCOrXB3(var_1_0) then
		local var_1_10 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 44
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 50
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 468
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 474
			}
		}

		var_1_3:RegisterAnimationSequence("Splitscreen", var_1_10)
	end

	if CONDITIONS.IsPCOrXB3(var_1_0) then
		local var_1_11 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 307
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 417
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -14
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 431
			}
		}

		var_1_4:RegisterAnimationSequence("Splitscreen", var_1_11)
	end

	local var_1_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -159
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 384
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 634
		}
	}

	var_1_6:RegisterAnimationSequence("Splitscreen", var_1_12)

	local var_1_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 380
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 384
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 580
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 646
		}
	}

	var_1_8:RegisterAnimationSequence("Splitscreen", var_1_13)

	local function var_1_14()
		if CONDITIONS.IsPCOrXB3(var_1_0) then
			var_1_3:AnimateSequence("Splitscreen")
		end

		if CONDITIONS.IsPCOrXB3(var_1_0) then
			var_1_4:AnimateSequence("Splitscreen")
		end

		var_1_6:AnimateSequence("Splitscreen")
		var_1_8:AnimateSequence("Splitscreen")
	end

	var_1_0._sequences.Splitscreen = var_1_14

	var_1_6:SetDataSourceThroughElement(var_1_0, "left")
	var_1_8:SetDataSourceThroughElement(var_1_0, "right")
	ACTIONS.AnimateSequenceByElement(var_1_0, {
		elementPath = "LeftStickLayoutDirections",
		sequenceName = "ArrowsOnRight",
		elementName = "LeftStickLayoutDirections"
	})
	ACTIONS.AnimateSequenceByElement(var_1_0, {
		elementPath = "RightStickLayoutDirections",
		sequenceName = "ArrowsOnLeft",
		elementName = "RightStickLayoutDirections"
	})
	ACTIONS.AnimateSequenceByElement(var_1_0, {
		elementPath = "self.LeftStickLayoutDirections",
		sequenceName = "L3ButtonIcon",
		elementName = "LeftStickLayoutDirections"
	})
	ACTIONS.AnimateSequenceByElement(var_1_0, {
		elementPath = "self.RightStickLayoutDirections",
		sequenceName = "R3ButtonIcon",
		elementName = "RightStickLayoutDirections"
	})

	if CONDITIONS.IsSplitscreen(var_1_0) then
		ACTIONS.AnimateSequence(var_1_0, "Splitscreen")
	end

	return var_1_0
end

MenuBuilder.registerType("XB3StickLayout", XB3StickLayout)
LockTable(_M)
