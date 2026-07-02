module(..., package.seeall)

function ProgressionNumeral(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 30 * _1080p, 0, 30 * _1080p)

	var_1_0.id = "ProgressionNumeral"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "NumeralBacking"

	var_1_4:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_1_4:SetAlpha(0.95, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 30, 0, _1080p * 30)
	var_1_0:addElement(var_1_4)

	var_1_0.NumeralBacking = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "ActiveTierBacking"

	var_1_6:SetRGBFromTable(SWATCHES.CH2.CH2RankCareer, 0)
	var_1_6:SetAlpha(0, 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 28, _1080p * 2, _1080p * 28)
	var_1_0:addElement(var_1_6)

	var_1_0.ActiveTierBacking = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Numeral"

	var_1_8:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_1_8:SetAlpha(0.8, 0)
	var_1_8:setImage(RegisterMaterial("ui_t9_menu_frontend_RomanNumeral_5"), 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -2, _1080p * 32, _1080p * -2, _1080p * 32)
	var_1_0:addElement(var_1_8)

	var_1_0.Numeral = var_1_8

	local function var_1_9()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_9

	local var_1_10
	local var_1_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Hide", var_1_11)

	local var_1_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Hide", var_1_12)

	local var_1_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Hide", var_1_13)

	local function var_1_14()
		var_1_4:AnimateSequence("Hide")
		var_1_6:AnimateSequence("Hide")
		var_1_8:AnimateSequence("Hide")
	end

	var_1_0._sequences.Hide = var_1_14

	local var_1_15
	local var_1_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Pending", var_1_16)

	local var_1_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Pending", var_1_17)

	local var_1_18 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Pending", var_1_18)

	local function var_1_19()
		var_1_4:AnimateSequence("Pending")
		var_1_6:AnimateSequence("Pending")
		var_1_8:AnimateSequence("Pending")
	end

	var_1_0._sequences.Pending = var_1_19

	local var_1_20
	local var_1_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Active", var_1_21)

	local var_1_22 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Active", var_1_22)

	local var_1_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Active", var_1_23)

	local function var_1_24()
		var_1_4:AnimateSequence("Active")
		var_1_6:AnimateSequence("Active")
		var_1_8:AnimateSequence("Active")
	end

	var_1_0._sequences.Active = var_1_24

	local var_1_25
	local var_1_26 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Completed", var_1_26)

	local var_1_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Completed", var_1_27)

	local var_1_28 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Completed", var_1_28)

	local function var_1_29()
		var_1_4:AnimateSequence("Completed")
		var_1_6:AnimateSequence("Completed")
		var_1_8:AnimateSequence("Completed")
	end

	var_1_0._sequences.Completed = var_1_29

	return var_1_0
end

MenuBuilder.registerType("ProgressionNumeral", ProgressionNumeral)
LockTable(_M)
