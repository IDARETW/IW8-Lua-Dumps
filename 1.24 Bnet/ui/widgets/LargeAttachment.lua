module(..., package.seeall)

function LargeAttachment(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 50 * _1080p, 0, 50 * _1080p)

	var_1_0.id = "LargeAttachment"
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

	var_1_4.id = "Fill"

	var_1_4:SetRGBFromTable(SWATCHES.CAC.attachmentEquipped, 0)
	var_1_4:SetAlpha(0, 0)
	var_1_4:setImage(RegisterMaterial("passive_circle_background"), 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 6, _1080p * -6, _1080p * 6, _1080p * -6)
	var_1_0:addElement(var_1_4)

	var_1_0.Fill = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Backer"

	var_1_6:SetRGBFromTable(SWATCHES.CAC.attachmentEquipped, 0)
	var_1_6:setImage(RegisterMaterial("cac_large_attachment_ring"), 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7)
	var_1_0:addElement(var_1_6)

	var_1_0.Backer = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Image"

	var_1_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 9, _1080p * -9, _1080p * 9, _1080p * -9)
	var_1_0:addElement(var_1_8)

	var_1_0.Image = var_1_8

	local function var_1_9()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_9

	local var_1_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Filled", var_1_10)

	local var_1_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.attachmentEquipped
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Filled", var_1_11)

	local var_1_12 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Filled", var_1_12)

	local function var_1_13()
		var_1_4:AnimateSequence("Filled")
		var_1_6:AnimateSequence("Filled")
		var_1_8:AnimateSequence("Filled")
	end

	var_1_0._sequences.Filled = var_1_13

	local var_1_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Empty", var_1_14)

	local var_1_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.attachmentEmpty
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Empty", var_1_15)

	local var_1_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Empty", var_1_16)

	local function var_1_17()
		var_1_4:AnimateSequence("Empty")
		var_1_6:AnimateSequence("Empty")
		var_1_8:AnimateSequence("Empty")
	end

	var_1_0._sequences.Empty = var_1_17

	local var_1_18 = {
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Current", var_1_18)

	local var_1_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.attachmentEquipped
		}
	}

	var_1_6:RegisterAnimationSequence("Current", var_1_19)

	local var_1_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Current", var_1_20)

	local function var_1_21()
		var_1_4:AnimateSequence("Current")
		var_1_6:AnimateSequence("Current")
		var_1_8:AnimateSequence("Current")
	end

	var_1_0._sequences.Current = var_1_21

	return var_1_0
end

MenuBuilder.registerType("LargeAttachment", LargeAttachment)
LockTable(_M)
