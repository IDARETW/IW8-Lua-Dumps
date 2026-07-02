module(..., package.seeall)

local var_0_0 = 8 * _1080p

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0:SetAlpha(arg_1_1 and 1 or 0)

	arg_1_0.enabled = arg_1_1
end

local function var_0_2(arg_2_0, arg_2_1)
	arg_2_0.Text:setText(arg_2_1)

	local var_2_0 = LAYOUT.GetTextWidth(arg_2_0.Text) + arg_2_0.Text:GetCurrentAnchorsAndPositions().left + var_0_0

	arg_2_0.Backer:SetRight(var_2_0)

	return var_2_0
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.UpdateVisibility = var_0_1
	arg_3_0.InitializeText = var_0_2

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function EquippedWidget(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 136 * _1080p, 0, 30 * _1080p)

	var_4_0.id = "EquippedWidget"
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
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 38, _1080p * 136, 0, 0)
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
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 38, 0, _1080p * 30)
	var_4_0:addElement(var_4_6)

	var_4_0.Cap = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Fill"

	var_4_8:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_4_8:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 30, 0, _1080p * 30)
	var_4_0:addElement(var_4_8)

	var_4_0.Fill = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIStyledText.new()

	var_4_10.id = "Text"

	var_4_10:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_4_10:SetAlpha(0.8, 0)
	var_4_10:setText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"), 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_10:SetWordWrap(false)
	var_4_10:SetAlignment(LUI.Alignment.Left)
	var_4_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 38, _1080p * 126, _1080p * -12, _1080p * 12)
	var_4_0:addElement(var_4_10)

	var_4_0.Text = var_4_10

	local function var_4_11()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_11

	local var_4_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 333,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.55,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_4_4:RegisterAnimationSequence("TurnOn", var_4_12)

	local var_4_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 333,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.55,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_4_6:RegisterAnimationSequence("TurnOn", var_4_13)

	local var_4_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_4_8:RegisterAnimationSequence("TurnOn", var_4_14)

	local var_4_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.8,
			duration = 133,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
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
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		}
	}

	var_4_10:RegisterAnimationSequence("AR", var_4_17)

	local function var_4_18()
		var_4_10:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_18

	var_0_3(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("EquippedWidget", EquippedWidget)
LockTable(_M)
