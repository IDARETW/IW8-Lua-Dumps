module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2)
	arg_1_0.EditBox:AddEditBoxLogic(arg_1_1, arg_1_2)

	arg_1_0.EditBox.Text.req = arg_1_2.req
	arg_1_0.EditBox.Text.isEmail = arg_1_2.isEmail
	arg_1_0.EditBox.Text.isPassword = arg_1_2.isPassword
	arg_1_0.EditBox.Text.isUsername = arg_1_2.isUsername
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.EditBox.Text:SetTextEditCompleteCallbackFunc(arg_2_1)
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0.EditBox.Text:SetIsTypingCallbackFunc(arg_3_1)
end

local function var_0_3(arg_4_0)
	return arg_4_0.EditBox.Text
end

local function var_0_4(arg_5_0)
	return arg_5_0.EditBox.Text.textEdit:getText()
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.Setup = var_0_0
	arg_6_0.SetTextEditCompleteCallbackFunc = var_0_1
	arg_6_0.SetIsTypingCallbackFunc = var_0_2
	arg_6_0.GetTextElement = var_0_3
	arg_6_0.GetEditText = var_0_4
end

function CODAccountEditBox(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIButton.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 630 * _1080p, 0, 32 * _1080p)

	var_7_0.id = "CODAccountEditBox"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "BackgroundDarkener"

	var_7_4:SetRGBFromInt(0, 0)
	var_7_4:SetAlpha(0, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.BackgroundDarkener = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("GenericEditBox", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "EditBox"

	var_7_6.Text:setText("", 0)
	var_7_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_7_0:addElement(var_7_6)

	var_7_0.EditBox = var_7_6

	local var_7_7
	local var_7_8 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_7_9 = LUI.UIBorder.new(var_7_8)

	var_7_9.id = "Border"

	var_7_9:SetAlpha(0, 0)
	var_7_0:addElement(var_7_9)

	var_7_0.Border = var_7_9

	local function var_7_10()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_10

	local var_7_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Registration.pass
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_9:RegisterAnimationSequence("Valid", var_7_11)

	local function var_7_12()
		var_7_9:AnimateSequence("Valid")
	end

	var_7_0._sequences.Valid = var_7_12

	local var_7_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Registration.fail
		}
	}

	var_7_9:RegisterAnimationSequence("Invalid", var_7_13)

	local function var_7_14()
		var_7_9:AnimateSequence("Invalid")
	end

	var_7_0._sequences.Invalid = var_7_14

	local var_7_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_9:RegisterAnimationSequence("Off", var_7_15)

	local function var_7_16()
		var_7_9:AnimateSequence("Off")
	end

	var_7_0._sequences.Off = var_7_16

	var_7_0:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_7_1
		end

		ACTIONS.AnimateSequence(var_7_0, "Off")
	end)
	var_0_5(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("CODAccountEditBox", CODAccountEditBox)
LockTable(_M)
