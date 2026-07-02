module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = LUI.ButtonHelperTextTooltip.new({
		controllerIndex = arg_1_1
	})

	var_1_0.id = "ButtonHelperTextTooltip"

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 0, 0, 0, 0, 0)

	arg_1_0.ButtonHelperTextTooltip = var_1_0

	arg_1_0:addElement(var_1_0)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function ButtonHelperBarTooltip(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 30 * _1080p)

	var_2_0.id = "ButtonHelperBarTooltip"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Background"

	var_2_4:SetRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_2_4:SetAlpha(0.8, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	local var_2_5
	local var_2_6 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_2_7 = LUI.UIBorder.new(var_2_6)

	var_2_7.id = "Border"

	var_2_7:SetRGBFromTable(SWATCHES.CAC.accent, 0)
	var_2_7:SetAlpha(0.8, 0)
	var_2_0:addElement(var_2_7)

	var_2_0.Border = var_2_7

	local function var_2_8()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_8

	local var_2_9
	local var_2_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_2_4:RegisterAnimationSequence("WZWipSetup", var_2_10)

	local var_2_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_2_7:RegisterAnimationSequence("WZWipSetup", var_2_11)

	local function var_2_12()
		var_2_4:AnimateSequence("WZWipSetup")
		var_2_7:AnimateSequence("WZWipSetup")
	end

	var_2_0._sequences.WZWipSetup = var_2_12

	PostLoadFunc(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("ButtonHelperBarTooltip", ButtonHelperBarTooltip)
LockTable(_M)
