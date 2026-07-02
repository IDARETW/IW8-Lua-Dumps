module(..., package.seeall)

function MiniAttachment(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p)

	var_1_0.id = "MiniAttachment"
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

	var_1_4.id = "Backer"

	var_1_4:SetRGBFromTable(SWATCHES.CAC.attachmentDefault, 0)
	var_1_4:setImage(RegisterMaterial("cac_mini_attachment_ring"), 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Backer = var_1_4

	local function var_1_5()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_5

	local function var_1_6()
		return
	end

	var_1_0._sequences.ButtonOver = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.ButtonUp = var_1_7

	local var_1_8 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.attachmentEquipped
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_mini_attachment_dot")
		}
	}

	var_1_4:RegisterAnimationSequence("Filled", var_1_8)

	local function var_1_9()
		var_1_4:AnimateSequence("Filled")
	end

	var_1_0._sequences.Filled = var_1_9

	local var_1_10 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.attachmentEmpty
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_mini_attachment_ring")
		}
	}

	var_1_4:RegisterAnimationSequence("Empty", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("Empty")
	end

	var_1_0._sequences.Empty = var_1_11

	return var_1_0
end

MenuBuilder.registerType("MiniAttachment", MiniAttachment)
LockTable(_M)
