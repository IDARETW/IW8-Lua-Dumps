module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.data.ref

	for iter_1_0, iter_1_1 in ddlpairs(arg_1_1) do
		if var_1_0 == iter_1_1.munition:get() then
			return true
		end
	end

	return false
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.selected = arg_2_1

	arg_2_0.Selected:SetAlpha(arg_2_1 and 1 or 0)
end

local function var_0_2(arg_3_0, arg_3_1)
	if not arg_3_0.selected and MUNITION.AreAllSlotsFilled(arg_3_1) then
		arg_3_0:SetButtonDisabled(true)
	else
		arg_3_0:SetButtonDisabled(false)
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.Image:setImage(RegisterMaterial(arg_4_1.icon))
	arg_4_0.Kills:setText(arg_4_1.coolDown)

	arg_4_0.data = arg_4_1

	arg_4_0:SetSelected(var_0_0(arg_4_0, arg_4_2))
	arg_4_0:ToggleDisabled(arg_4_2)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.Selected)

	arg_5_0.SetSelected = var_0_1
	arg_5_0.Setup = var_0_3
	arg_5_0.ToggleDisabled = var_0_2
end

function CPMunitionButton(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 150 * _1080p)

	var_6_0.id = "CPMunitionButton"
	var_6_0._animationSets = {}
	var_6_0._sequences = {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "GenericButtonBackground"

	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.GenericButtonBackground = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "Image"

	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -44, _1080p * 44, _1080p * -44, _1080p * 44)
	var_6_0:addElement(var_6_6)

	var_6_0.Image = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIText.new()

	var_6_8.id = "Kills"

	var_6_8:setText("", 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_8:SetAlignment(LUI.Alignment.Left)
	var_6_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 7, _1080p * 123, _1080p * -25, _1080p * -3)
	var_6_0:addElement(var_6_8)

	var_6_0.Kills = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "Selected"

	var_6_10:SetAlpha(0, 0)
	var_6_10:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -27, _1080p * -7, _1080p * -30, _1080p * -10)
	var_6_0:addElement(var_6_10)

	var_6_0.Selected = var_6_10

	local function var_6_11()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_11

	local var_6_12 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonUp", var_6_12)

	local function var_6_13()
		var_6_8:AnimateSequence("ButtonUp")
	end

	var_6_0._sequences.ButtonUp = var_6_13

	local var_6_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonOver", var_6_14)

	local function var_6_15()
		var_6_8:AnimateSequence("ButtonOver")
	end

	var_6_0._sequences.ButtonOver = var_6_15

	local var_6_16 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Disable", var_6_16)

	local var_6_17 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Disable", var_6_17)

	local function var_6_18()
		var_6_6:AnimateSequence("Disable")
		var_6_8:AnimateSequence("Disable")
	end

	var_6_0._sequences.Disable = var_6_18

	local var_6_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Enable", var_6_19)

	local var_6_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Enable", var_6_20)

	local function var_6_21()
		var_6_6:AnimateSequence("Enable")
		var_6_8:AnimateSequence("Enable")
	end

	var_6_0._sequences.Enable = var_6_21

	var_6_0:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonOver")
	end)
	var_6_0:addEventHandler("button_up", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonUp")
	end)
	var_6_0:addEventHandler("disable", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "Disable")
	end)
	var_6_0:addEventHandler("enable", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "Enable")
	end)
	var_0_4(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("CPMunitionButton", CPMunitionButton)
LockTable(_M)
