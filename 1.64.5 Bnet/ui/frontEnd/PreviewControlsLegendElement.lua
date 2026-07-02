module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function PreviewControlsLegendElement(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 46 * _1080p)

	var_2_0.id = "PreviewControlsLegendElement"
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

	var_2_4.id = "Mouse"

	var_2_4:setImage(RegisterMaterial("ui_button_kbm_mouseleftclick"), 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 40, _1080p * -20, _1080p * 20)
	var_2_0:addElement(var_2_4)

	var_2_0.Mouse = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "Label"

	var_2_6:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_2_6:setText(ToUpperCase("ButtonPrompt"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 59, 0, _1080p * -9, _1080p * 9)
	var_2_0:addElement(var_2_6)

	var_2_0.Label = var_2_6

	local function var_2_7()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_7

	local var_2_8
	local var_2_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -46
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_9)

	local var_2_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -56
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -17
		}
	}

	var_2_6:RegisterAnimationSequence("AR", var_2_10)

	local function var_2_11()
		var_2_4:AnimateSequence("AR")
		var_2_6:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_11

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("PreviewControlsLegendElement", PreviewControlsLegendElement)
LockTable(_M)
