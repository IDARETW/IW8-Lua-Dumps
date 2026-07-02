module(..., package.seeall)

function FooterCursorIcon(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p)

	var_1_0.id = "FooterCursorIcon"
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

	var_1_4.id = "Icon"

	var_1_4:SetRGBFromTable(SWATCHES.CAC.yellowHighlight, 0)
	var_1_4:setImage(RegisterMaterial("ui_button_kbm_mouserightclick"), 0)
	var_1_4:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * 12, _1080p * -14, _1080p * 10)
	var_1_0:addElement(var_1_4)

	var_1_0.Icon = var_1_4

	local function var_1_5()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_5

	local var_1_6 = {
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonOver", var_1_6)

	local function var_1_7()
		var_1_4:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_7

	local var_1_8 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 10461855,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonUp", var_1_8)

	local function var_1_9()
		var_1_4:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_9

	return var_1_0
end

MenuBuilder.registerType("FooterCursorIcon", FooterCursorIcon)
LockTable(_M)
