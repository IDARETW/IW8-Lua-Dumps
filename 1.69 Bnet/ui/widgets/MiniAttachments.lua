module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local var_1_0 = 0

	for iter_1_0 = 1, ATTACHMENT.GetMaxAttachmentCount(arg_1_2) do
		local var_1_1 = arg_1_3[iter_1_0]

		if type(arg_1_3[iter_1_0]) == "table" then
			var_1_1 = arg_1_3[iter_1_0].ref
		end

		if var_1_1 and var_1_1 ~= "none" then
			var_1_0 = var_1_0 + 1
		end
	end

	arg_1_0.currentAttachmentCount = var_1_0

	if var_1_0 == 0 then
		ACTIONS.AnimateSequence(arg_1_0, "Empty")

		return
	end

	ACTIONS.AnimateSequence(arg_1_0, "Fill" .. var_1_0)
end

local function var_0_1(arg_2_0)
	return arg_2_0.currentAttachmentCount
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.Setup = var_0_0
	arg_3_0.GetCurrentNumOfAttachments = var_0_1
	arg_3_0.currentAttachmentCount = 0
end

function MiniAttachments(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 98 * _1080p, 0, 16 * _1080p)

	var_4_0.id = "MiniAttachments"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0

	var_4_0:setUseStencil(true)

	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Rings"

	var_4_4:SetAlpha(0.3, 0)
	var_4_4:setImage(RegisterMaterial("cac_mini_attachment_rings"), 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 98, 0, _1080p * 16)
	var_4_0:addElement(var_4_4)

	var_4_0.Rings = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Dots"

	var_4_6:SetRGBFromTable(SWATCHES.CAC.attachmentEquipped, 0)
	var_4_6:setImage(RegisterMaterial("cac_mini_attachment_dots"), 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -96, 0, 0, _1080p * 16)
	var_4_0:addElement(var_4_6)

	var_4_0.Dots = var_4_6

	local function var_4_7()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_7

	local var_4_8 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 118
		}
	}

	var_4_4:RegisterAnimationSequence("Fill1", var_4_8)

	local var_4_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 18
		}
	}

	var_4_6:RegisterAnimationSequence("Fill1", var_4_9)

	local function var_4_10()
		var_4_4:AnimateSequence("Fill1")
		var_4_6:AnimateSequence("Fill1")
	end

	var_4_0._sequences.Fill1 = var_4_10

	local var_4_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 138
		}
	}

	var_4_4:RegisterAnimationSequence("Fill2", var_4_11)

	local var_4_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 38
		}
	}

	var_4_6:RegisterAnimationSequence("Fill2", var_4_12)

	local function var_4_13()
		var_4_4:AnimateSequence("Fill2")
		var_4_6:AnimateSequence("Fill2")
	end

	var_4_0._sequences.Fill2 = var_4_13

	local var_4_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 158
		}
	}

	var_4_4:RegisterAnimationSequence("Fill3", var_4_14)

	local var_4_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 58
		}
	}

	var_4_6:RegisterAnimationSequence("Fill3", var_4_15)

	local function var_4_16()
		var_4_4:AnimateSequence("Fill3")
		var_4_6:AnimateSequence("Fill3")
	end

	var_4_0._sequences.Fill3 = var_4_16

	local var_4_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 82
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 178
		}
	}

	var_4_4:RegisterAnimationSequence("Fill4", var_4_17)

	local var_4_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 78
		}
	}

	var_4_6:RegisterAnimationSequence("Fill4", var_4_18)

	local function var_4_19()
		var_4_4:AnimateSequence("Fill4")
		var_4_6:AnimateSequence("Fill4")
	end

	var_4_0._sequences.Fill4 = var_4_19

	local var_4_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 196
		}
	}

	var_4_4:RegisterAnimationSequence("Fill5", var_4_20)

	local var_4_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 98
		}
	}

	var_4_6:RegisterAnimationSequence("Fill5", var_4_21)

	local function var_4_22()
		var_4_4:AnimateSequence("Fill5")
		var_4_6:AnimateSequence("Fill5")
	end

	var_4_0._sequences.Fill5 = var_4_22

	local var_4_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 98
		}
	}

	var_4_4:RegisterAnimationSequence("Empty", var_4_23)

	local var_4_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -96
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_4_6:RegisterAnimationSequence("Empty", var_4_24)

	local function var_4_25()
		var_4_4:AnimateSequence("Empty")
		var_4_6:AnimateSequence("Empty")
	end

	var_4_0._sequences.Empty = var_4_25

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("MiniAttachments", MiniAttachments)
LockTable(_M)
