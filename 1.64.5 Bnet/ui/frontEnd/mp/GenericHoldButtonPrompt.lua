module(..., package.seeall)

local var_0_0 = {
	HOLD_DURATION = 1000,
	BACKGROUND_ALPHA = 0.75,
	BUTTON_REF = "button_primary"
}

local function var_0_1(arg_1_0)
	local var_1_0 = 0
	local var_1_1 = math.ceil(LAYOUT.GetElementWidth(arg_1_0.HoldButtonPromptLayout) / _1080p) / 2

	if arg_1_0._isGamepadInput then
		var_1_0 = arg_1_0.HoldButtonPromptLayout:GetCenterOffset() / _1080p
	end

	arg_1_0.HoldButtonPromptLayout:SetLeft(_1080p * math.ceil(-var_1_1 + var_1_0))
	arg_1_0.HoldButtonPromptLayout:SetRight(_1080p * math.ceil(var_1_1 + var_1_0))
end

local function var_0_2(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1 and arg_2_1.element or nil

	if var_2_0 then
		var_2_0:processEvent({
			name = "button_hold_complete"
		})
	end
end

local function var_0_3(arg_3_0, arg_3_1)
	arg_3_0._isGamepadInput = LUI.IsLastInputGamepad(arg_3_0._controllerIndex)

	arg_3_0.HoldButtonPromptLayout:UpdateInputType(arg_3_0._isGamepadInput)

	if arg_3_0._buttonOptions.isCentered then
		var_0_1(arg_3_0)
	end
end

local function var_0_4(arg_4_0, arg_4_1)
	if arg_4_1 == nil then
		arg_4_1 = {}
	end

	if arg_4_1.buttons == nil then
		arg_4_1.buttons = {
			primary = true
		}
	end

	if arg_4_1.buttonRef == nil then
		arg_4_1.buttonRef = var_0_0.BUTTON_REF
	end

	if arg_4_1.duration == nil then
		arg_4_1.duration = var_0_0.HOLD_DURATION
	end

	arg_4_1.requireFocus = arg_4_1.requireFocus or false
	arg_4_1.clickKeyboardAndMouse = arg_4_1.clickKBM or true
	arg_4_1.isCentered = arg_4_1.isCentered or false
	arg_4_1.isBackgroundEnabled = arg_4_1.isBackgroundEnabled or false
	arg_4_1.onFill = var_0_2
	arg_4_1.onFillParams = {
		element = arg_4_0
	}

	return arg_4_1
end

local function var_0_5(arg_5_0, arg_5_1)
	arg_5_0.Background:SetAlpha(arg_5_1 and var_0_0.BACKGROUND_ALPHA or 0)
end

local function var_0_6(arg_6_0)
	arg_6_0:registerAndCallEventHandler("update_input_type", var_0_3, {
		controllerIndex = arg_6_0._controllerIndex
	})
end

local function var_0_7(arg_7_0, arg_7_1)
	arg_7_0._buttonOptions = var_0_4(arg_7_0, arg_7_1)

	arg_7_0.HoldButtonPromptLayout:SetupPrompt(arg_7_0._buttonOptions)
	var_0_5(arg_7_0, arg_7_0._buttonOptions.isBackgroundEnabled)
	var_0_6(arg_7_0)
end

local function var_0_8(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0._controllerIndex = arg_8_1
	arg_8_0.SetupPrompt = var_0_7
end

function GenericHoldButtonPrompt(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 304 * _1080p, 0, 44 * _1080p)

	var_9_0.id = "GenericHoldButtonPrompt"

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "Background"

	var_9_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_9_4:SetAlpha(0.75, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.Background = var_9_4

	local var_9_5
	local var_9_6 = MenuBuilder.BuildRegisteredType("GenericHoldButtonPromptLayout", {
		controllerIndex = var_9_1
	})

	var_9_6.id = "HoldButtonPromptLayout"

	var_9_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -144, _1080p * 144, _1080p * -16, _1080p * 16)
	var_9_0:addElement(var_9_6)

	var_9_0.HoldButtonPromptLayout = var_9_6

	var_0_8(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("GenericHoldButtonPrompt", GenericHoldButtonPrompt)
LockTable(_M)
