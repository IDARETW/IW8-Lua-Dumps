module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0:SetAlpha(arg_1_1 and 1 or 0)

	arg_1_0.enabled = arg_1_1
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.Text:setText(arg_2_1)

	local var_2_0 = LAYOUT.GetTextWidth(arg_2_0.Text)
	local var_2_1 = -80 * _1080p
	local var_2_2 = arg_2_0.Backer:GetCurrentAnchorsAndPositions()

	if not IsLanguageArabic() then
		arg_2_0.Backer:SetAnchorsAndPosition(var_2_2.leftAnchor, var_2_2.rightAnchor, var_2_2.topAnchor, var_2_2.bottomAnchor, var_2_2.left, var_2_0 + var_2_1, var_2_2.top, var_2_2.bottom)
	else
		arg_2_0.Backer:SetAnchorsAndPosition(var_2_2.leftAnchor, var_2_2.rightAnchor, var_2_2.topAnchor, var_2_2.bottomAnchor, -(var_2_0 + var_2_1), var_2_2.right, var_2_2.top, var_2_2.bottom)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.UpdateVisibility = var_0_0
	arg_3_0.InitializeText = var_0_1

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function CurrentLevelWidget(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 125 * _1080p, 0, 25 * _1080p)

	var_4_0.id = "CurrentLevelWidget"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Backer"

	var_4_4:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_4_4:SetAlpha(0.55, 0)
	var_4_4:SetPixelGridEnabled(true)
	var_4_4:SetPixelGridContrast(0.5, 0)
	var_4_4:SetPixelGridBlockWidth(2, 0)
	var_4_4:SetPixelGridBlockHeight(2, 0)
	var_4_4:SetPixelGridGutterWidth(1, 0)
	var_4_4:SetPixelGridGutterHeight(1, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 32, 0, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Backer = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Cap"

	var_4_6:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_4_6:SetAlpha(0.55, 0)
	var_4_6:SetPixelGridEnabled(true)
	var_4_6:SetPixelGridContrast(0.5, 0)
	var_4_6:SetPixelGridBlockWidth(2, 0)
	var_4_6:SetPixelGridBlockHeight(2, 0)
	var_4_6:SetPixelGridGutterWidth(1, 0)
	var_4_6:SetPixelGridGutterHeight(1, 0)
	var_4_6:setImage(RegisterMaterial("cac_equip_cap"), 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 7, _1080p * 32, 0, _1080p * 25)
	var_4_0:addElement(var_4_6)

	var_4_0.Cap = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Fill"

	var_4_8:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_4_8:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 25, 0, _1080p * 25)
	var_4_0:addElement(var_4_8)

	var_4_0.Fill = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIStyledText.new()

	var_4_10.id = "Text"

	var_4_10:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_4_10:SetAlpha(0.8, 0)
	var_4_10:setText("DEBUG", 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_10:SetWordWrap(false)
	var_4_10:SetAlignment(LUI.Alignment.Left)
	var_4_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 32, _1080p * -16, _1080p * 4, _1080p * 22)
	var_4_0:addElement(var_4_10)

	var_4_0.Text = var_4_10

	local function var_4_11()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_11

	local var_4_12 = {
		{
			value = 0.55,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("TurnOn", var_4_12)

	local var_4_13 = {
		{
			value = 0.55,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("TurnOn", var_4_13)

	local var_4_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("TurnOn", var_4_14)

	local var_4_15 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("TurnOn", var_4_15)

	local function var_4_16()
		var_4_4:AnimateSequence("TurnOn")
		var_4_6:AnimateSequence("TurnOn")
		var_4_8:AnimateSequence("TurnOn")
		var_4_10:AnimateSequence("TurnOn")
	end

	var_4_0._sequences.TurnOn = var_4_16

	local var_4_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -32
		}
	}

	var_4_4:RegisterAnimationSequence("AR", var_4_17)

	local var_4_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 118
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 93
		}
	}

	var_4_6:RegisterAnimationSequence("AR", var_4_18)

	local var_4_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 125
		}
	}

	var_4_8:RegisterAnimationSequence("AR", var_4_19)

	local var_4_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_4_10:RegisterAnimationSequence("AR", var_4_20)

	local function var_4_21()
		var_4_4:AnimateSequence("AR")
		var_4_6:AnimateSequence("AR")
		var_4_8:AnimateSequence("AR")
		var_4_10:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_21

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CurrentLevelWidget", CurrentLevelWidget)
LockTable(_M)
