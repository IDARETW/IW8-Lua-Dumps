module(..., package.seeall)

local function var_0_0(arg_1_0)
	assert(arg_1_0._itemData and type(arg_1_0._itemData) == "table", "Item data must be assigned to the slot in order to set its display.")
	arg_1_0.Image:setImage(RegisterMaterial(arg_1_0._itemData.icon))

	if arg_1_0._isCurrentCategory then
		ACTIONS.AnimateSequence(arg_1_0, "Current")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	ACTIONS.AnimateSequence(arg_2_0, "Empty")

	arg_2_0.SetSlotDisplay = var_0_0
end

function LargeAttachment(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 50 * _1080p, 0, 50 * _1080p)

	var_3_0.id = "LargeAttachment"
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

	var_3_4.id = "Fill"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.attachmentEquipped, 0)
	var_3_4:SetAlpha(0, 0)
	var_3_4:setImage(RegisterMaterial("passive_circle_background"), 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 6, _1080p * -6, _1080p * 6, _1080p * -6)
	var_3_0:addElement(var_3_4)

	var_3_0.Fill = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Backer"

	var_3_6:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_3_6:setImage(RegisterMaterial("cac_large_attachment_ring"), 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7)
	var_3_0:addElement(var_3_6)

	var_3_0.Backer = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Image"

	var_3_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 9, _1080p * -9, _1080p * 9, _1080p * -9)
	var_3_0:addElement(var_3_8)

	var_3_0.Image = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_9

	local var_3_10
	local var_3_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Filled", var_3_11)

	local var_3_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Filled", var_3_12)

	local var_3_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Filled", var_3_13)

	local function var_3_14()
		var_3_4:AnimateSequence("Filled")
		var_3_6:AnimateSequence("Filled")
		var_3_8:AnimateSequence("Filled")
	end

	var_3_0._sequences.Filled = var_3_14

	local var_3_15
	local var_3_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Empty", var_3_16)

	local var_3_17 = {
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

	var_3_6:RegisterAnimationSequence("Empty", var_3_17)

	local var_3_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Empty", var_3_18)

	local function var_3_19()
		var_3_4:AnimateSequence("Empty")
		var_3_6:AnimateSequence("Empty")
		var_3_8:AnimateSequence("Empty")
	end

	var_3_0._sequences.Empty = var_3_19

	local var_3_20
	local var_3_21 = {
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_3_4:RegisterAnimationSequence("Current", var_3_21)

	local var_3_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_3_6:RegisterAnimationSequence("Current", var_3_22)

	local var_3_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Current", var_3_23)

	local function var_3_24()
		var_3_4:AnimateSequence("Current")
		var_3_6:AnimateSequence("Current")
		var_3_8:AnimateSequence("Current")
	end

	var_3_0._sequences.Current = var_3_24

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("LargeAttachment", LargeAttachment)
LockTable(_M)
