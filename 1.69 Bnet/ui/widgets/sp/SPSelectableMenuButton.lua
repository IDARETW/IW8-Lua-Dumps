module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 then
		ACTIONS.AnimateSequence(arg_1_0, "Check")
	else
		ACTIONS.AnimateSequence(arg_1_0, "UnCheck")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetCheck = var_0_0

	local function var_2_0(arg_3_0)
		arg_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 100 * _1080p, 150)
	end

	local function var_2_1(arg_4_0)
		arg_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 50 * _1080p, 150)
	end

	arg_2_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		if not LUI.IsLastInputMouseNavigation(arg_2_1) then
			var_2_0(arg_5_0)
		end
	end)
	arg_2_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		var_2_1(arg_6_0)
	end)
	arg_2_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		var_2_1(arg_7_0)
	end)
end

function SPSelectableMenuButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 100 * _1080p)

	var_8_0.id = "SPSelectableMenuButton"
	var_8_0._animationSets = {}
	var_8_0._sequences = {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("SPMenuButton", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "SPMenuButton"

	var_8_4.Text:setText("", 0)
	var_8_4.Description:setText("", 0)
	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.SPMenuButton = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "EquipIcon"

	var_8_6:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_8_6:SetAlpha(0, 0)
	var_8_6:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_8_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -49, _1080p * -17, _1080p * -16, _1080p * 16)
	var_8_0:addElement(var_8_6)

	var_8_0.EquipIcon = var_8_6

	local function var_8_7()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_7

	local var_8_8 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Check", var_8_8)

	local function var_8_9()
		var_8_6:AnimateSequence("Check")
	end

	var_8_0._sequences.Check = var_8_9

	local var_8_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("UnCheck", var_8_10)

	local function var_8_11()
		var_8_6:AnimateSequence("UnCheck")
	end

	var_8_0._sequences.UnCheck = var_8_11

	var_0_1(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("SPSelectableMenuButton", SPSelectableMenuButton)
LockTable(_M)
