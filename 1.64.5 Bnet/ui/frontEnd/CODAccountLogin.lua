module(..., package.seeall)

local function var_0_0(arg_1_0)
	assert(arg_1_0.ButtonLogin)

	local function var_1_0()
		for iter_2_0, iter_2_1 in ipairs(arg_1_0._inputs) do
			if not iter_2_1:GetTextElement().isValid then
				return false
			end
		end

		return true
	end

	arg_1_0.ButtonLogin.isDisabled = not var_1_0()
end

local function var_0_1(arg_3_0)
	arg_3_0.BindButton = LUI.UIBindButton.new()
	arg_3_0.BindButton.id = "selfBindButton"

	arg_3_0:addElement(arg_3_0.BindButton)
	arg_3_0.BindButton:addEventHandler("button_alt1", function(arg_4_0, arg_4_1)
		local var_4_0 = Engine.DCIAEHEJGH(Engine.CBBHFCGDIC("CODACCOUNT/FORGOT_PASSWORD_URL"))

		Engine.BHECIAHGC(arg_3_0._controllerIndex, 0, var_4_0)
	end)
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	local function var_5_0()
		REGISTRATION.UpdatePasswordLogin(arg_5_2)

		local var_6_0, var_6_1 = REGISTRATION.CheckIsPassing(REGISTRATION.PasswordRulesLogin)

		if arg_5_1.isDefault then
			var_6_1 = "CODACCOUNT/PLEASE_COMPLETE"
		end

		if var_6_1 ~= nil then
			arg_5_0.ErrorMessage:setText(Engine.CBBHFCGDIC("CODACCOUNT/PASSWORD_ERROR_X", var_6_1))
		end

		return var_6_0 and not arg_5_1.isDefault
	end

	local function var_5_1()
		REGISTRATION.UpdateEmail(AccountRegistration.DIBHDDJHG(arg_5_2))

		local var_7_0, var_7_1 = REGISTRATION.CheckIsPassing(REGISTRATION.EmailRules)

		if arg_5_1.isDefault then
			var_7_1 = "CODACCOUNT/PLEASE_COMPLETE"
		end

		if var_7_1 ~= nil then
			arg_5_0.ErrorMessage:setText(Engine.CBBHFCGDIC("CODACCOUNT/EMAIL_ERROR_X", var_7_1))
		end

		return var_7_0 and not arg_5_1.isDefault
	end

	if arg_5_1.isPassword then
		arg_5_1.isValid = var_5_0()
	elseif arg_5_1.isEmail then
		arg_5_1.isValid = var_5_1()
	else
		assert(false, "CODAccountLogin requires email and password inputs")
	end

	return arg_5_1.isValid
end

local function var_0_3(arg_8_0)
	assert(arg_8_0.ErrorMessage)

	local var_8_0 = false

	for iter_8_0, iter_8_1 in ipairs(arg_8_0._inputs) do
		local var_8_1 = iter_8_1:GetTextElement()
		local var_8_2 = iter_8_1:GetEditText()

		if not var_0_2(arg_8_0, var_8_1, var_8_2) then
			ACTIONS.AnimateSequence(iter_8_1, "Invalid")

			var_8_0 = true
		else
			ACTIONS.AnimateSequence(iter_8_1, "Valid")
		end
	end

	arg_8_0.ErrorMessage:SetAlpha(var_8_0 and 1 or 0)
end

local function var_0_4(arg_9_0)
	local function var_9_0(arg_10_0, arg_10_1)
		local function var_10_0()
			local var_11_0 = arg_10_0:getParent()
			local var_11_1 = FocusType.MouseOver

			if Engine.HDGDBCJFG() and LUI.IsLastInputGamepad(arg_9_0._controllerIndex) then
				var_11_1 = FocusType.Gamepad
			end

			var_11_0:FocusNextElement(arg_10_0, "down", var_11_1, arg_10_1.qualifier, arg_9_0._controllerIndex)
		end

		if not arg_10_1.isDefault then
			if var_0_2(arg_9_0, arg_10_0, arg_10_1.text) then
				arg_9_0.ErrorMessage:SetAlpha(0)
				var_10_0()
			end
		else
			arg_10_0.isValid = false
		end

		var_0_0(arg_9_0)
	end

	arg_9_0.InputEmail:Setup(arg_9_0._controllerIndex, {
		isEmail = true
	})
	arg_9_0.InputPassword:Setup(arg_9_0._controllerIndex, {
		isPassword = true,
		maxInputStringLength = REGISTRATION.PasswordRulesConstants.MAX_GLYPHS
	})
	arg_9_0.InputEmail:SetTextEditCompleteCallbackFunc(var_9_0)
	arg_9_0.InputPassword:SetTextEditCompleteCallbackFunc(var_9_0)

	arg_9_0._inputs = {
		arg_9_0.InputEmail,
		arg_9_0.InputPassword
	}
end

local function var_0_5(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0._controllerIndex
	local var_12_1 = AccountRegistration.DIBHDDJHG(arg_12_0.InputEmail:GetEditText())
	local var_12_2 = ""
	local var_12_3 = arg_12_0.InputPassword:GetEditText()

	if arg_12_1 then
		AccountRegistration.EGAIABAAG(var_12_0, var_12_1, var_12_3)
	else
		AccountRegistration.CIJBBHJIBH(var_12_0, var_12_1, var_12_2, var_12_3)
	end
end

local function var_0_6(arg_13_0, arg_13_1, arg_13_2)
	assert(arg_13_0.HelperBar)

	arg_13_0._autoConnectionFailedIgnored = false

	arg_13_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 81, 0, _1080p * -373, _1080p * -240)

	arg_13_0._controllerIndex = arg_13_1

	arg_13_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CODACCOUNT/LOGIN_TITLE"))
	var_0_1(arg_13_0)
	var_0_4(arg_13_0)
	var_0_0(arg_13_0)
	arg_13_0.ButtonLogin:addEventHandler("button_action", function(arg_14_0, arg_14_1)
		if arg_14_0.isDisabled then
			var_0_3(arg_13_0)
		else
			var_0_5(arg_13_0, arg_13_2.isAnonymousAccount)
		end
	end)
	arg_13_0.ButtonCancel:addEventHandler("button_action", function(arg_15_0, arg_15_1)
		LUI.FlowManager.RequestLeaveMenu(arg_13_0)
	end)
	arg_13_0:registerEventHandler("AccountRegistrationSuccess", function(arg_16_0, arg_16_1)
		assert(arg_13_1 == arg_16_1.options.controllerIndex)
		LUI.FlowManager.RequestLeaveMenu(arg_16_0:GetCurrentMenu())

		if arg_13_2.isAnonymousAccount then
			LUI.FlowManager.RequestPopupMenu(nil, "CODAccountRestartingPopup", true, arg_13_0._controllerIndex, false, {}, nil, true, true)
		end
	end)
	arg_13_0:registerEventHandler("AccountRegistrationFailure", function(arg_17_0, arg_17_1)
		assert(arg_13_1 == arg_17_1.options.controllerIndex)

		if AccountRegistration.BAADBIECDG() and AccountRegistration.BEJFHBHICG() ~= 0 and not arg_13_0._autoConnectionFailedIgnored then
			arg_13_0._autoConnectionFailedIgnored = true
		else
			local var_17_0 = {
				title = Engine.CBBHFCGDIC("CODACCOUNT/LOGIN_ERROR_TITLE"),
				message = Engine.CBBHFCGDIC(CODACCOUNT.GetErrorString(arg_17_1.options.errorCode), arg_17_1.options.detailErrorCode),
				controllerIndex = arg_13_1
			}

			LUI.FlowManager.RequestPopupMenu(nil, "CODAccountErrorPopup", true, arg_13_0._controllerIndex, false, var_17_0, nil, true, true)
		end
	end)

	arg_13_0.isQuickAccessShortcutsDisabled = true
end

function CODAccountLogin(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIVerticalNavigator.new()

	var_18_0.id = "CODAccountLogin"

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	var_18_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_18_1
	})
	var_18_0.HelperBar.id = "HelperBar"

	var_18_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_18_0.HelperBar:setPriority(10)
	var_18_0:addElement(var_18_0.HelperBar)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = LUI.UIImage.new()

	var_18_4.id = "Darkener"

	var_18_4:SetRGBFromInt(0, 0)
	var_18_0:addElement(var_18_4)

	var_18_0.Darkener = var_18_4

	local var_18_5
	local var_18_6 = MenuBuilder.BuildRegisteredType("GenericPopupFrame", {
		controllerIndex = var_18_1
	})

	var_18_6.id = "GenericPopupFrame"

	var_18_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_18_0:addElement(var_18_6)

	var_18_0.GenericPopupFrame = var_18_6

	local var_18_7
	local var_18_8 = LUI.UIImage.new()

	var_18_8.id = "Image"

	var_18_8:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_18_8:SetAlpha(0.25, 0)
	var_18_8:setImage(RegisterMaterial("mm_COD_account_icon"), 0)
	var_18_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 377, _1080p * 658, _1080p * -170, _1080p * 158)
	var_18_0:addElement(var_18_8)

	var_18_0.Image = var_18_8

	local var_18_9
	local var_18_10 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_18_1
	})

	var_18_10.id = "MenuTitle"

	var_18_10.MenuTitle:setText(Engine.CBBHFCGDIC("CODACCOUNT/LOGIN_TITLE"), 0)
	var_18_10.Line:SetLeft(0, 0)
	var_18_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 169, _1080p * -225, _1080p * -121)
	var_18_0:addElement(var_18_10)

	var_18_0.MenuTitle = var_18_10

	local var_18_11
	local var_18_12 = LUI.UIImage.new()

	var_18_12.id = "Line"

	var_18_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_18_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * -300, _1080p * -124, _1080p * -124)
	var_18_0:addElement(var_18_12)

	var_18_0.Line = var_18_12

	local var_18_13
	local var_18_14 = MenuBuilder.BuildRegisteredType("CODAccountEditBox", {
		controllerIndex = var_18_1
	})

	var_18_14.id = "InputEmail"

	var_18_14.BackgroundDarkener:SetAlpha(0.5, 0)
	var_18_14.EditBox.Text:setText(Engine.CBBHFCGDIC("CODACCOUNT/EMAIL"), 0)
	var_18_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 197, _1080p * 617, _1080p * 484, _1080p * 518)
	var_18_0:addElement(var_18_14)

	var_18_0.InputEmail = var_18_14

	local var_18_15
	local var_18_16 = MenuBuilder.BuildRegisteredType("CODAccountEditBox", {
		controllerIndex = var_18_1
	})

	var_18_16.id = "InputPassword"

	var_18_16.BackgroundDarkener:SetAlpha(0.5, 0)
	var_18_16.EditBox.Text:setText(Engine.CBBHFCGDIC("CODACCOUNT/PASSWORD"), 0)
	var_18_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 197, _1080p * 617, _1080p * 529, _1080p * 564)
	var_18_0:addElement(var_18_16)

	var_18_0.InputPassword = var_18_16

	local var_18_17
	local var_18_18 = LUI.UIText.new()

	var_18_18.id = "ErrorMessage"

	var_18_18:SetRGBFromTable(SWATCHES.Registration.fail, 0)
	var_18_18:setText("", 0)
	var_18_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_18:SetAlignment(LUI.Alignment.Left)
	var_18_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 197, _1080p * 697, _1080p * 580, _1080p * 598)
	var_18_0:addElement(var_18_18)

	var_18_0.ErrorMessage = var_18_18

	local var_18_19
	local var_18_20 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_18_1
	})

	var_18_20.id = "ButtonLogin"

	var_18_20.BackgroundDarkener:SetAlpha(0.5, 0)
	var_18_20.Text:SetLeft(_1080p * 20, 0)
	var_18_20.Text:setText(Engine.CBBHFCGDIC("CODACCOUNT/LOGIN"), 0)
	var_18_20.Text:SetAlignment(LUI.Alignment.Left)
	var_18_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 197, _1080p * 617, _1080p * 638, _1080p * 676)
	var_18_0:addElement(var_18_20)

	var_18_0.ButtonLogin = var_18_20

	local var_18_21
	local var_18_22 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_18_1
	})

	var_18_22.id = "ButtonCancel"

	var_18_22.BackgroundDarkener:SetAlpha(0.5, 0)
	var_18_22.Text:SetLeft(_1080p * 20, 0)
	var_18_22.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CANCEL"), 0)
	var_18_22.Text:SetAlignment(LUI.Alignment.Left)
	var_18_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 197, _1080p * 617, _1080p * 688, _1080p * 726)
	var_18_0:addElement(var_18_22)

	var_18_0.ButtonCancel = var_18_22

	var_18_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_18_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_alt1",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("CODACCOUNT/FORGOT_PASSWORD")
	})
	var_18_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_18_23 = LUI.UIBindButton.new()

	var_18_23.id = "selfBindButton"

	var_18_0:addElement(var_18_23)

	var_18_0.bindButton = var_18_23

	var_18_0.bindButton:addEventHandler("button_secondary", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_18_1
		end

		ACTIONS.LeaveMenu(var_18_0)
	end)
	var_0_6(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("CODAccountLogin", CODAccountLogin)
LockTable(_M)
