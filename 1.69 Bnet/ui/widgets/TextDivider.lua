module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function TextDivider(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 315 * _1080p, 0, 30 * _1080p)

	var_2_0.id = "TextDivider"
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

	var_2_4.id = "LeftDivider"

	var_2_4:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_2_4:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 124, 0, _1080p * 1)
	var_2_0:addElement(var_2_4)

	var_2_0.LeftDivider = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "Label"

	var_2_6:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_2_6:setText(Engine.CBBHFCGDIC("LUA_MENU/AND"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Center)
	var_2_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -33.5, _1080p * 32.5, _1080p * -9, _1080p * 9)
	var_2_0:addElement(var_2_6)

	var_2_0.Label = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "RightDivider"

	var_2_8:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_2_8:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_2_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -125, _1080p * -1, 0, _1080p * 1)
	var_2_0:addElement(var_2_8)

	var_2_0.RightDivider = var_2_8

	local function var_2_9()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_9

	local var_2_10
	local var_2_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		}
	}

	var_2_4:RegisterAnimationSequence("WZWipSetup", var_2_11)

	local var_2_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_2_6:RegisterAnimationSequence("WZWipSetup", var_2_12)

	local var_2_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		}
	}

	var_2_8:RegisterAnimationSequence("WZWipSetup", var_2_13)

	local function var_2_14()
		var_2_4:AnimateSequence("WZWipSetup")
		var_2_6:AnimateSequence("WZWipSetup")
		var_2_8:AnimateSequence("WZWipSetup")
	end

	var_2_0._sequences.WZWipSetup = var_2_14

	local var_2_15
	local var_2_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -27
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 97
		}
	}

	var_2_4:RegisterAnimationSequence("JP", var_2_16)

	local var_2_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -58.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 58.5
		}
	}

	var_2_6:RegisterAnimationSequence("JP", var_2_17)

	local var_2_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -99
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 25
		}
	}

	var_2_8:RegisterAnimationSequence("JP", var_2_18)

	local function var_2_19()
		var_2_4:AnimateSequence("JP")
		var_2_6:AnimateSequence("JP")
		var_2_8:AnimateSequence("JP")
	end

	var_2_0._sequences.JP = var_2_19

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("TextDivider", TextDivider)
LockTable(_M)
