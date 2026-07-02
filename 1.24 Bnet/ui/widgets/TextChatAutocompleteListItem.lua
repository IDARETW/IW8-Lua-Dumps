module(..., package.seeall)

function TextChatAutocompleteListItem(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 492 * _1080p, 0, 24 * _1080p)

	var_1_0.id = "TextChatAutocompleteListItem"
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

	var_1_4.id = "BackgroundElementOver"

	var_1_4:SetAlpha(0, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 493, 0, _1080p * 24)
	var_1_0:addElement(var_1_4)

	var_1_0.BackgroundElementOver = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "name"

	var_1_6:setText("", 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 11, 0, _1080p * -11, _1080p * 9)
	var_1_0:addElement(var_1_6)

	var_1_0.name = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "StrokeLeft"

	var_1_8:SetRGBFromTable(SWATCHES.window.borderColor, 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1, 0, 0)
	var_1_0:addElement(var_1_8)

	var_1_0.StrokeLeft = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "TextureLayerActiveLeft"

	var_1_10:SetRGBFromInt(7985663, 0)
	var_1_10:SetAlpha(0, 0)
	var_1_10:SetPixelGridEnabled(true)
	var_1_10:SetPixelGridContrast(0.8, 0)
	var_1_10:SetPixelGridBlockWidth(0, 0)
	var_1_10:SetPixelGridBlockHeight(0, 0)
	var_1_10:SetPixelGridGutterWidth(0, 0)
	var_1_10:SetPixelGridGutterHeight(0, 0)
	var_1_10:setImage(RegisterMaterial("button_gradient_active"), 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 70, 0, 0)
	var_1_0:addElement(var_1_10)

	var_1_0.TextureLayerActiveLeft = var_1_10

	local var_1_11 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_6:RegisterAnimationSequence("DefaultSequence", var_1_11)

	local var_1_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.window.borderColor
		}
	}

	var_1_8:RegisterAnimationSequence("DefaultSequence", var_1_12)

	local function var_1_13()
		var_1_6:AnimateSequence("DefaultSequence")
		var_1_8:AnimateSequence("DefaultSequence")
	end

	var_1_0._sequences.DefaultSequence = var_1_13

	local var_1_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 492
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonOver", var_1_14)

	local var_1_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonOver", var_1_15)

	local var_1_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonOver", var_1_16)

	local var_1_17 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonOver", var_1_17)

	local function var_1_18()
		var_1_4:AnimateSequence("ButtonOver")
		var_1_6:AnimateSequence("ButtonOver")
		var_1_8:AnimateSequence("ButtonOver")
		var_1_10:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_18

	local var_1_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonUp", var_1_19)

	local var_1_20 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonUp", var_1_20)

	local var_1_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.window.borderColor
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonUp", var_1_21)

	local var_1_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonUp", var_1_22)

	local function var_1_23()
		var_1_4:AnimateSequence("ButtonUp")
		var_1_6:AnimateSequence("ButtonUp")
		var_1_8:AnimateSequence("ButtonUp")
		var_1_10:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_23

	var_1_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)
	var_1_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
	end)
	ACTIONS.AnimateSequence(var_1_0, "DefaultSequence")

	return var_1_0
end

MenuBuilder.registerType("TextChatAutocompleteListItem", TextChatAutocompleteListItem)
LockTable(_M)
