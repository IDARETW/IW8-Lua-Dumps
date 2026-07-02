module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = Dvar.BJJCJHDBII("NNLRMRKOTM")
	local var_1_1 = Dvar.BJJCJHDBII("MKOOLLQRPS")

	if arg_1_0.oldHorizontalMargin ~= var_1_0 then
		ACTIONS.AnimateSequence(arg_1_0, "Horizontal")

		arg_1_0.oldHorizontalMargin = var_1_0
	end

	if arg_1_0.oldVerticalMargin ~= var_1_1 then
		ACTIONS.AnimateSequence(arg_1_0, "Vertical")

		arg_1_0.oldVerticalMargin = var_1_1
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:SetupSafeArea()

	arg_2_0.AnimateMarginArrows = var_0_0
end

function MarginsGuide(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "MarginsGuide"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "DimBG"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAlpha(0.5, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.DimBG = var_3_4

	local var_3_5
	local var_3_6 = {
		borderThicknessLeft = _1080p * 37.5,
		borderThicknessRight = _1080p * 37.5,
		borderThicknessTop = _1080p * 37.5,
		borderThicknessBottom = _1080p * 37.5
	}
	local var_3_7 = LUI.UIBorder.new(var_3_6)

	var_3_7.id = "OuterTint"

	var_3_7:SetRGBFromInt(10, 0)
	var_3_7:SetAlpha(0.85, 0)
	var_3_7:SetBorderThicknessLeft(_1080p * 37.5, 0)
	var_3_7:SetBorderThicknessRight(_1080p * 37.5, 0)
	var_3_7:SetBorderThicknessTop(_1080p * 37.5, 0)
	var_3_7:SetBorderThicknessBottom(_1080p * 37.5, 0)
	var_3_0:addElement(var_3_7)

	var_3_0.OuterTint = var_3_7

	local var_3_8
	local var_3_9 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_3_10 = LUI.UIBorder.new(var_3_9)

	var_3_10.id = "WhiteBorder"

	var_3_10:SetBorderThicknessLeft(_1080p * 2, 0)
	var_3_10:SetBorderThicknessRight(_1080p * 2, 0)
	var_3_10:SetBorderThicknessTop(_1080p * 2, 0)
	var_3_10:SetBorderThicknessBottom(_1080p * 2, 0)
	var_3_0:addElement(var_3_10)

	var_3_0.WhiteBorder = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "ArrowLeft"

	var_3_12:setImage(RegisterMaterial("wdg_selection_arrow_left_1"), 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -10, _1080p * 54, _1080p * -64, _1080p * 64)
	var_3_0:addElement(var_3_12)

	var_3_0.ArrowLeft = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "ArrowRight"

	var_3_14:setImage(RegisterMaterial("wdg_selection_arrow_right_1"), 0)
	var_3_14:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -51, _1080p * 13, _1080p * -64, _1080p * 64)
	var_3_0:addElement(var_3_14)

	var_3_0.ArrowRight = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "ArrowTop"

	var_3_16:SetZRotation(90, 0)
	var_3_16:setImage(RegisterMaterial("wdg_selection_arrow_right_1"), 0)
	var_3_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -32, _1080p * 32, _1080p * -45, _1080p * 83)
	var_3_0:addElement(var_3_16)

	var_3_0.ArrowTop = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIImage.new()

	var_3_18.id = "ArrowBottom"

	var_3_18:SetZRotation(-90, 0)
	var_3_18:setImage(RegisterMaterial("wdg_selection_arrow_right_1"), 0)
	var_3_18:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -32, _1080p * 32, _1080p * -83, _1080p * 45)
	var_3_0:addElement(var_3_18)

	var_3_0.ArrowBottom = var_3_18

	local function var_3_19()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_19

	local var_3_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Horizontal", var_3_20)

	local var_3_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Horizontal", var_3_21)

	local function var_3_22()
		var_3_12:AnimateSequence("Horizontal")
		var_3_14:AnimateSequence("Horizontal")
	end

	var_3_0._sequences.Horizontal = var_3_22

	local var_3_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Vertical", var_3_23)

	local var_3_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("Vertical", var_3_24)

	local function var_3_25()
		var_3_16:AnimateSequence("Vertical")
		var_3_18:AnimateSequence("Vertical")
	end

	var_3_0._sequences.Vertical = var_3_25

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("MarginsGuide", MarginsGuide)
LockTable(_M)
