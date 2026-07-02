module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.GenericCheckBox:SetValue(arg_1_1)

	arg_1_0._isChecked = arg_1_1
end

local function var_0_1(arg_2_0)
	arg_2_0:SetValue(not arg_2_0._isChecked)

	return arg_2_0._isChecked
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetValue = var_0_0
	arg_3_0.ToggleValue = var_0_1
	arg_3_0._isChecked = nil
end

function CheckboxButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 30 * _1080p)

	var_4_0.id = "CheckboxButton"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "LoadoutItemButtonBackground"

	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.LoadoutItemButtonBackground = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "GenericCheckBox"

	var_4_6:SetAlpha(0.5, 0)
	var_4_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -30, _1080p * -8, _1080p * -11, _1080p * 11)
	var_4_0:addElement(var_4_6)

	var_4_0.GenericCheckBox = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "Label"

	var_4_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_4_8:SetAlpha(0.5, 0)
	var_4_8:setText(Engine.CBBHFCGDIC("LUA_MENU/BLOCK_REGIMENT_INVITES"), 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 9, _1080p * -37, _1080p * -12, _1080p * 12)
	var_4_0:addElement(var_4_8)

	var_4_0.Label = var_4_8

	local function var_4_9()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_9

	local var_4_10 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonOver", var_4_10)

	local var_4_11 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonOver", var_4_11)

	local function var_4_12()
		var_4_6:AnimateSequence("ButtonOver")
		var_4_8:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_12

	local var_4_13 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUp", var_4_13)

	local var_4_14 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonUp", var_4_14)

	local function var_4_15()
		var_4_6:AnimateSequence("ButtonUp")
		var_4_8:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_15

	local function var_4_16()
		return
	end

	var_4_0._sequences.AR = var_4_16

	var_4_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonOver")
	end)
	var_4_0:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonUp")
	end)
	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CheckboxButton", CheckboxButton)
LockTable(_M)
