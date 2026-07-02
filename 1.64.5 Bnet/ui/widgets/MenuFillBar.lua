module(..., package.seeall)

function MenuFillBar(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 225 * _1080p, 0, 18 * _1080p)

	var_1_0.id = "MenuFillBar"
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

	var_1_4.id = "Fill"

	var_1_4:SetRGBFromInt(8421504, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Fill = var_1_4

	local var_1_5
	local var_1_6 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_1_7 = LUI.UIBorder.new(var_1_6)

	var_1_7.id = "FillBorder"

	var_1_7:SetRGBFromInt(8421504, 0)
	var_1_7:SetAlpha(0.85, 0)
	var_1_7:SetBorderThicknessLeft(_1080p * 2, 0)
	var_1_7:SetBorderThicknessRight(_1080p * 2, 0)
	var_1_7:SetBorderThicknessTop(_1080p * 2, 0)
	var_1_7:SetBorderThicknessBottom(_1080p * 2, 0)
	var_1_0:addElement(var_1_7)

	var_1_0.FillBorder = var_1_7

	local var_1_8
	local var_1_9 = LUI.UIImage.new()

	var_1_9.id = "TickMarker"

	var_1_9:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_9:SetAlpha(0, 0)
	var_1_9:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 50, _1080p * 52, _1080p * -4, _1080p * 4)
	var_1_0:addElement(var_1_9)

	var_1_0.TickMarker = var_1_9

	local function var_1_10()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_10

	local var_1_11 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonOver", var_1_11)

	local var_1_12 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_7:RegisterAnimationSequence("ButtonOver", var_1_12)

	local var_1_13 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_9:RegisterAnimationSequence("ButtonOver", var_1_13)

	local function var_1_14()
		var_1_4:AnimateSequence("ButtonOver")
		var_1_7:AnimateSequence("ButtonOver")
		var_1_9:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_14

	local var_1_15 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonUp", var_1_15)

	local var_1_16 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			value = 0.85,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_7:RegisterAnimationSequence("ButtonUp", var_1_16)

	local var_1_17 = {
		{
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_9:RegisterAnimationSequence("ButtonUp", var_1_17)

	local function var_1_18()
		var_1_4:AnimateSequence("ButtonUp")
		var_1_7:AnimateSequence("ButtonUp")
		var_1_9:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_18

	local function var_1_19()
		return
	end

	var_1_0._sequences.Locked = var_1_19

	local function var_1_20()
		return
	end

	var_1_0._sequences.NewNotification = var_1_20

	local var_1_21 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonOverDisabled", var_1_21)

	local var_1_22 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_1_7:RegisterAnimationSequence("ButtonOverDisabled", var_1_22)

	local var_1_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_1_9:RegisterAnimationSequence("ButtonOverDisabled", var_1_23)

	local function var_1_24()
		var_1_4:AnimateSequence("ButtonOverDisabled")
		var_1_7:AnimateSequence("ButtonOverDisabled")
		var_1_9:AnimateSequence("ButtonOverDisabled")
	end

	var_1_0._sequences.ButtonOverDisabled = var_1_24

	local var_1_25 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonUpDisabled", var_1_25)

	local var_1_26 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_1_7:RegisterAnimationSequence("ButtonUpDisabled", var_1_26)

	local var_1_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_1_9:RegisterAnimationSequence("ButtonUpDisabled", var_1_27)

	local function var_1_28()
		var_1_4:AnimateSequence("ButtonUpDisabled")
		var_1_7:AnimateSequence("ButtonUpDisabled")
		var_1_9:AnimateSequence("ButtonUpDisabled")
	end

	var_1_0._sequences.ButtonUpDisabled = var_1_28

	return var_1_0
end

MenuBuilder.registerType("MenuFillBar", MenuFillBar)
LockTable(_M)
