module(..., package.seeall)

function GenericEInkBackground(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 10 * _1080p, 0, 10 * _1080p)

	var_1_0.id = "GenericEInkBackground"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIBlur.new()

	var_1_4.id = "Blur"

	var_1_4:SetRGBFromTable(SWATCHES.HUD.eInkBack, 0)
	var_1_4:SetBlurStrength(2.5, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Blur = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Overlay"

	var_1_6:SetAlpha(0.25, 0)
	var_1_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_1_6:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_1_0:addElement(var_1_6)

	var_1_0.Overlay = var_1_6

	local var_1_7
	local var_1_8 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_9 = LUI.UIBorder.new(var_1_8)

	var_1_9.id = "Border"

	var_1_9:SetRGBFromInt(0, 0)
	var_1_9:SetAlpha(0.6, 0)
	var_1_0:addElement(var_1_9)

	var_1_0.Border = var_1_9

	local function var_1_10()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_10

	local var_1_11 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_9:RegisterAnimationSequence("Unavailable", var_1_11)

	local function var_1_12()
		var_1_9:AnimateSequence("Unavailable")
	end

	var_1_0._sequences.Unavailable = var_1_12

	local var_1_13 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_9:RegisterAnimationSequence("Selected", var_1_13)

	local function var_1_14()
		var_1_9:AnimateSequence("Selected")
	end

	var_1_0._sequences.Selected = var_1_14

	local function var_1_15()
		return
	end

	var_1_0._sequences.Unselected = var_1_15

	return var_1_0
end

MenuBuilder.registerType("GenericEInkBackground", GenericEInkBackground)
LockTable(_M)
