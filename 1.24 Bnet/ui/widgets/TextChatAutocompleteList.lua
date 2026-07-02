module(..., package.seeall)

function TextChatAutocompleteList(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 492 * _1080p, 0, 250 * _1080p)

	var_1_0.id = "TextChatAutocompleteList"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0

	var_1_0:setUseStencil(true)

	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "background"

	var_1_4:SetRGBFromTable(SWATCHES.genericButton.textFocusAlt, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.background = var_1_4

	local var_1_5
	local var_1_6 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_1_7 = LUI.UIBorder.new(var_1_6)

	var_1_7.id = "Border"

	var_1_7:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_7:SetBorderThicknessBottom(_1080p * 0, 0)
	var_1_0:addElement(var_1_7)

	var_1_0.Border = var_1_7

	local var_1_8 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_7:RegisterAnimationSequence("DefaultSequence", var_1_8)

	local function var_1_9()
		var_1_7:AnimateSequence("DefaultSequence")
	end

	var_1_0._sequences.DefaultSequence = var_1_9

	ACTIONS.AnimateSequence(var_1_0, "DefaultSequence")

	return var_1_0
end

MenuBuilder.registerType("TextChatAutocompleteList", TextChatAutocompleteList)
LockTable(_M)
