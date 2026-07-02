module(..., package.seeall)

function PriceButton(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 80 * _1080p)

	var_1_0.id = "PriceButton"
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

	var_1_4.id = "BG"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAlpha(0.6, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.BG = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Currency"

	var_1_6:setImage(RegisterMaterial("currency_cod_points_icon"), 0)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -86, _1080p * -22, _1080p * -32, _1080p * 32)
	var_1_0:addElement(var_1_6)

	var_1_0.Currency = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "Amount"

	var_1_8:setText("", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 189, _1080p * 400, _1080p * -15, _1080p * 15)
	var_1_0:addElement(var_1_8)

	var_1_0.Amount = var_1_8

	local var_1_9
	local var_1_10 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_1_11 = LUI.UIBorder.new(var_1_10)

	var_1_11.id = "Border"

	var_1_11:SetAlpha(0, 0)
	var_1_11:SetBorderThicknessLeft(_1080p * 2, 0)
	var_1_11:SetBorderThicknessRight(_1080p * 2, 0)
	var_1_11:SetBorderThicknessTop(_1080p * 2, 0)
	var_1_11:SetBorderThicknessBottom(_1080p * 2, 0)
	var_1_0:addElement(var_1_11)

	var_1_0.Border = var_1_11

	local function var_1_12()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_12

	local var_1_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_11:RegisterAnimationSequence("ButtonOver", var_1_13)

	local function var_1_14()
		var_1_11:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_14

	local var_1_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_11:RegisterAnimationSequence("ButtonUp", var_1_15)

	local function var_1_16()
		var_1_11:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_16

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

	return var_1_0
end

MenuBuilder.registerType("PriceButton", PriceButton)
LockTable(_M)
