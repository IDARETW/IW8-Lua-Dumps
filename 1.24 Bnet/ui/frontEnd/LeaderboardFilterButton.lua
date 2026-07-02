module(..., package.seeall)

local function var_0_0(arg_1_0)
	if arg_1_0._filtered then
		ACTIONS.AnimateSequence(arg_1_0, "Check")
	else
		ACTIONS.AnimateSequence(arg_1_0, "Uncheck")
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._filtered = arg_2_1

	var_0_0(arg_2_0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetFiltered = var_0_1

	local function var_3_0(arg_4_0, arg_4_1)
		if arg_3_0._filtered and arg_3_0._filtered == true then
			return
		end

		arg_3_0:SetFiltered(true)
		arg_3_0:dispatchEventToCurrentMenu({
			name = "leaderboard_on_filter_changed",
			child = arg_3_0
		})
	end

	arg_3_0:registerEventHandler("button_action", var_3_0)
end

function LeaderboardFilterButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 50 * _1080p)

	var_5_0.id = "LeaderboardFilterButton"
	var_5_0._animationSets = {}
	var_5_0._sequences = {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "GenericButtonBackground"

	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.GenericButtonBackground = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIText.new()

	var_5_6.id = "Text"

	var_5_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_6:setText("", 0)
	var_5_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_6:SetAlignment(LUI.Alignment.Left)
	var_5_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 26, _1080p * 418, _1080p * -14, _1080p * 14)
	var_5_0:addElement(var_5_6)

	var_5_0.Text = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "Fill"

	var_5_8:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_5_8:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_5_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -46, _1080p * -24, _1080p * -11, _1080p * 11)
	var_5_0:addElement(var_5_8)

	var_5_0.Fill = var_5_8

	local function var_5_9()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_9

	local var_5_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonOver", var_5_10)

	local function var_5_11()
		var_5_6:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_11

	local var_5_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonUp", var_5_12)

	local function var_5_13()
		var_5_6:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_13

	local var_5_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("Check", var_5_14)

	local function var_5_15()
		var_5_8:AnimateSequence("Check")
	end

	var_5_0._sequences.Check = var_5_15

	local var_5_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("Uncheck", var_5_16)

	local function var_5_17()
		var_5_8:AnimateSequence("Uncheck")
	end

	var_5_0._sequences.Uncheck = var_5_17

	var_5_0:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonOver")
	end)
	var_5_0:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonUp")
	end)
	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("LeaderboardFilterButton", LeaderboardFilterButton)
LockTable(_M)
