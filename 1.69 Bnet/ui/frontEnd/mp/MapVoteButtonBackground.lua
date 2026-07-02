module(..., package.seeall)

function MapVoteButtonBackground(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 504 * _1080p, 0, 80 * _1080p)

	var_1_0.id = "MapVoteButtonBackground"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("GenericBackgroundGlow", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "Dropshadow"

	var_1_4:SetRGBFromTable(SWATCHES.genericButton.backgroundFocus, 0)
	var_1_4:SetAlpha(0, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -3, 0, 0, _1080p * 6)
	var_1_0:addElement(var_1_4)

	var_1_0.Dropshadow = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "MapBackground"

	var_1_6:SetVMax(0.5, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.MapBackground = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "GamepadIcon"

	var_1_8:SetAlpha(0, 0)
	var_1_8:setImage(RegisterMaterial("button_primary"), 0)
	var_1_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -42, _1080p * -10, _1080p * -16, _1080p * 16)
	var_1_0:addElement(var_1_8)

	var_1_0.GamepadIcon = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "GradientTopDown"

	var_1_10:SetRGBFromInt(0, 0)
	var_1_10:SetAlpha(0.2, 0)
	var_1_10:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_1_0:addElement(var_1_10)

	var_1_0.GradientTopDown = var_1_10

	local var_1_11
	local var_1_12 = MenuBuilder.BuildRegisteredType("GenericButtonSelection", {
		controllerIndex = var_1_1
	})

	var_1_12.id = "GenericButtonSelection"

	var_1_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 80)
	var_1_0:addElement(var_1_12)

	var_1_0.GenericButtonSelection = var_1_12

	local function var_1_13()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_13

	local var_1_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -104
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonOver", var_1_14)

	local function var_1_15()
		var_1_6:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_15

	local var_1_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -104
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonUp", var_1_16)

	local function var_1_17()
		var_1_6:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_17

	local var_1_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Locked", var_1_18)

	local function var_1_19()
		var_1_8:AnimateSequence("Locked")
	end

	var_1_0._sequences.Locked = var_1_19

	local function var_1_20()
		return
	end

	var_1_0._sequences.ButtonOverDisabled = var_1_20

	local function var_1_21()
		return
	end

	var_1_0._sequences.ButtonUpDisabled = var_1_21

	local function var_1_22()
		return
	end

	var_1_0._sequences.ButtonSelected = var_1_22

	var_1_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)
	var_1_0:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
	end)
	var_1_0:addEventHandler("button_disable", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUpDisabled")
	end)
	var_1_0:addEventHandler("button_over_disable", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOverDisabled")
	end)

	return var_1_0
end

MenuBuilder.registerType("MapVoteButtonBackground", MapVoteButtonBackground)
LockTable(_M)
