module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = AccountRegistration.EBABCJIAEE(arg_1_0._controllerIndex) * 1000

	if var_1_0 > 0 then
		ACTIONS.AnimateSequence(arg_1_0, "ErrorLocked")
		arg_1_0.ButtonConfirm:SetButtonDisabled(true)

		local var_1_1 = Engine.BFBIDEGDFB() + var_1_0

		arg_1_0.ErrorTimer:setEndTime(var_1_1)

		if not arg_1_0._errorTimer then
			local var_1_2 = LUI.UITimer.new({
				event = "update_error_timer",
				interval = var_1_0
			})

			var_1_2.id = "errorTimer"

			arg_1_0:addElement(var_1_2)

			arg_1_0._errorTimer = var_1_2

			arg_1_0._errorTimer:registerEventHandler("update_error_timer", function()
				ACTIONS.AnimateSequence(arg_1_0, "Error")
				arg_1_0.ButtonConfirm:SetButtonDisabled(false)

				if arg_1_0._errorTimer then
					arg_1_0:RemoveElement(arg_1_0._errorTimer)
					arg_1_0._errorTimer:closeTree()

					arg_1_0._errorTimer = nil
				end
			end)
		end
	end
end

local function var_0_1(arg_3_0)
	local function var_3_0(arg_4_0, arg_4_1)
		arg_3_0.PlaceholderText:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_3_0.InputCodeBox, "Off")
	end

	local function var_3_1(arg_5_0, arg_5_1)
		if not arg_5_1.isDefault then
			arg_3_0._otpPassword = arg_5_1.text

			var_3_0()
			arg_3_0.InputCodeBox:processEvent({
				name = "lose_focus"
			})
			arg_3_0.ButtonConfirm:processEvent({
				name = "gain_focus"
			})
		end
	end

	arg_3_0.InputCodeBox:Setup(arg_3_0._controllerIndex, {
		min = 0,
		isNumeric = true,
		isPassword = true,
		max = REGISTRATION.OTPPasswordMaxValue,
		maxInputStringLength = REGISTRATION.CountUTF8Glyphs(tostring(REGISTRATION.OTPPasswordMaxValue))
	})
	arg_3_0.InputCodeBox:SetTextEditCompleteCallbackFunc(var_3_1)
	arg_3_0.InputCodeBox:SetIsTypingCallbackFunc(var_3_0)
end

local function var_0_2(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0._controllerIndex = arg_6_1
	arg_6_0._otpPassword = ""

	var_0_1(arg_6_0)
	var_0_0(arg_6_0)
	arg_6_0.ButtonConfirm:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		if REGISTRATION.CountUTF8Glyphs(arg_6_0._otpPassword) == REGISTRATION.CountUTF8Glyphs(tostring(REGISTRATION.OTPPasswordMaxValue)) then
			AccountRegistration.EBDAFDIHAE(arg_6_0._controllerIndex, arg_6_0._otpPassword)
		else
			ACTIONS.AnimateSequence(arg_6_0.InputCodeBox, "Invalid")
			ACTIONS.AnimateSequence(arg_6_0, "Error")
		end
	end)
	arg_6_0.ButtonHelp:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		Engine.BHECIAHGC(arg_6_1, WebBrowserType.FULLSCREEN, CODACCOUNT.AccountSettingsURL)
	end)
	arg_6_0:registerEventHandler("AccountRegistrationSuccess", function(arg_9_0, arg_9_1)
		assert(arg_6_1 == arg_9_1.options.controllerIndex)
		LUI.FlowManager.RequestLeaveMenu(arg_9_0:GetCurrentMenu())
	end)
	arg_6_0:registerEventHandler("AccountRegistrationFailure", function(arg_10_0, arg_10_1)
		if arg_6_2.onError then
			arg_6_2.onError()
		end

		assert(arg_6_1 == arg_10_1.options.controllerIndex)
		LUI.FlowManager.RequestLeaveMenu(arg_10_0:GetCurrentMenu())
	end)
	arg_6_0:registerEventHandler("AccountRegistrationNeedsOTP", function(arg_11_0, arg_11_1)
		assert(arg_6_1 == arg_11_1.options.controllerIndex)
		ACTIONS.AnimateSequence(arg_11_0, "Error")
	end)
	arg_6_0:registerEventHandler("AccountRegistrationOTPThrottled", function(arg_12_0, arg_12_1)
		assert(arg_6_1 == arg_12_1.options.controllerIndex)
		var_0_0(arg_12_0)
	end)
	arg_6_0:addEventHandler("menu_close", function(arg_13_0, arg_13_1)
		AccountRegistration.BFEJCEDEJE(arg_6_0._controllerIndex)
	end)
	arg_6_0.bindButton:addEventHandler("button_secondary", function(arg_14_0, arg_14_1)
		if arg_6_2.onCancel then
			arg_6_2.onCancel()
		end

		ACTIONS.LeaveMenu(arg_6_0)
	end)

	arg_6_0.isQuickAccessShortcutsDisabled = true
end

function CODAccountAuthentication(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIElement.new()

	var_15_0.id = "CODAccountAuthentication"
	var_15_0._animationSets = var_15_0._animationSets or {}
	var_15_0._sequences = var_15_0._sequences or {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	var_15_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_15_1
	})
	var_15_0.HelperBar.id = "HelperBar"

	var_15_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_15_0.HelperBar:setPriority(10)
	var_15_0:addElement(var_15_0.HelperBar)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = LUI.UIImage.new()

	var_15_4.id = "Darkener"

	var_15_4:SetRGBFromInt(0, 0)
	var_15_0:addElement(var_15_4)

	var_15_0.Darkener = var_15_4

	local var_15_5
	local var_15_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_15_1
	})

	var_15_6.id = "Window"

	var_15_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -610, _1080p * 610, _1080p * -350, _1080p * 350)
	var_15_0:addElement(var_15_6)

	var_15_0.Window = var_15_6

	local var_15_7
	local var_15_8 = LUI.UIStyledText.new()

	var_15_8.id = "Header"

	var_15_8:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_15_8:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_HEADING"), 0)
	var_15_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_15_8:SetAlignment(LUI.Alignment.Center)
	var_15_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_15_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -610, _1080p * 610, _1080p * -326, _1080p * -266)
	var_15_0:addElement(var_15_8)

	var_15_0.Header = var_15_8

	local var_15_9
	local var_15_10 = LUI.UIImage.new()

	var_15_10.id = "Line"

	var_15_10:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_15_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * -269, _1080p * -268)
	var_15_0:addElement(var_15_10)

	var_15_0.Line = var_15_10

	local var_15_11
	local var_15_12 = LUI.UIStyledText.new()

	var_15_12.id = "Body"

	var_15_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_15_12:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_ACCOUNT"), 0)
	var_15_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_12:SetAlignment(LUI.Alignment.Center)
	var_15_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * -245, _1080p * -221)
	var_15_0:addElement(var_15_12)

	var_15_0.Body = var_15_12

	local var_15_13
	local var_15_14 = LUI.UIStyledText.new()

	var_15_14.id = "Instructions"

	var_15_14:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_15_14:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_ENTER_CONFIRM"), 0)
	var_15_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_15_14:SetAlignment(LUI.Alignment.Center)
	var_15_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * -172, _1080p * -148)
	var_15_0:addElement(var_15_14)

	var_15_0.Instructions = var_15_14

	local var_15_15
	local var_15_16 = LUI.UIStyledText.new()

	var_15_16.id = "HelpText"

	var_15_16:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_15_16:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_INFO"), 0)
	var_15_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_16:SetAlignment(LUI.Alignment.Left)
	var_15_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * 90, _1080p * 114)
	var_15_0:addElement(var_15_16)

	var_15_0.HelpText = var_15_16

	local var_15_17
	local var_15_18 = LUI.UIStyledText.new()

	var_15_18.id = "HelpTextHeader"

	var_15_18:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_15_18:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_HAVING_ISSUES"), 0)
	var_15_18:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_15_18:SetAlignment(LUI.Alignment.Left)
	var_15_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * 47, _1080p * 87)
	var_15_0:addElement(var_15_18)

	var_15_0.HelpTextHeader = var_15_18

	local var_15_19
	local var_15_20 = LUI.UIImage.new()

	var_15_20.id = "HorzRule"

	var_15_20:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_15_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * 21, _1080p * 22)
	var_15_0:addElement(var_15_20)

	var_15_0.HorzRule = var_15_20

	local var_15_21
	local var_15_22 = MenuBuilder.BuildRegisteredType("CODAccountEditBox", {
		controllerIndex = var_15_1
	})

	var_15_22.id = "InputCodeBox"

	var_15_22.EditBox.Text:setText("", 0)
	var_15_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -350, _1080p * 350, _1080p * -134, _1080p * -90)
	var_15_0:addElement(var_15_22)

	var_15_0.InputCodeBox = var_15_22

	local var_15_23
	local var_15_24 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_15_1
	})

	var_15_24.id = "ButtonConfirm"

	var_15_24.Text:SetLeft(_1080p * 20, 0)
	var_15_24.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CODACCOUNT/TFA_BTN_CONFIRM")), 0)
	var_15_24.Text:SetAlignment(LUI.Alignment.Center)
	var_15_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -460, _1080p * -10, _1080p * 230, _1080p * 290)
	var_15_0:addElement(var_15_24)

	var_15_0.ButtonConfirm = var_15_24

	local var_15_25
	local var_15_26 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_15_1
	})

	var_15_26.id = "ButtonHelp"

	var_15_26.Text:SetLeft(_1080p * 20, 0)
	var_15_26.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CODACCOUNT/TFA_BTN_HELP")), 0)
	var_15_26.Text:SetAlignment(LUI.Alignment.Center)
	var_15_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 10, _1080p * 460, _1080p * 230, _1080p * 290)
	var_15_0:addElement(var_15_26)

	var_15_0.ButtonHelp = var_15_26

	local var_15_27
	local var_15_28 = LUI.UIImage.new()

	var_15_28.id = "InputCodeLock"

	var_15_28:setImage(RegisterMaterial("icon_lock"), 0)
	var_15_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 301, _1080p * 345, _1080p * -134, _1080p * -90)
	var_15_0:addElement(var_15_28)

	var_15_0.InputCodeLock = var_15_28

	local var_15_29
	local var_15_30 = LUI.UIStyledText.new()

	var_15_30.id = "PlaceholderText"

	var_15_30:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_15_30:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_TF_ENTER_CODE"), 0)
	var_15_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_30:SetAlignment(LUI.Alignment.Left)
	var_15_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -331, _1080p * 337, _1080p * -125, _1080p * -97)
	var_15_0:addElement(var_15_30)

	var_15_0.PlaceholderText = var_15_30

	local var_15_31
	local var_15_32 = LUI.UIStyledText.new()

	var_15_32.id = "ErrorMessage"

	var_15_32:SetRGBFromTable(SWATCHES.Popups.warning, 0)
	var_15_32:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_ERROR_MESSAGE"), 0)
	var_15_32:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_15_32:SetAlignment(LUI.Alignment.Center)
	var_15_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * -70, _1080p * -46)
	var_15_0:addElement(var_15_32)

	var_15_0.ErrorMessage = var_15_32

	local var_15_33
	local var_15_34 = LUI.UIStyledText.new()

	var_15_34.id = "ErrorTimeToWait"

	var_15_34:SetRGBFromTable(SWATCHES.Popups.warning, 0)
	var_15_34:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_TIME_LEFT"), 0)
	var_15_34:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_15_34:SetAlignment(LUI.Alignment.Right)
	var_15_34:SetVerticalAlignment(LUI.Alignment.Center)
	var_15_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -500, _1080p * -10, _1080p * -18, _1080p * 6)
	var_15_0:addElement(var_15_34)

	var_15_0.ErrorTimeToWait = var_15_34

	local var_15_35
	local var_15_36 = MenuBuilder.BuildRegisteredType("UICountdown", {
		controllerIndex = var_15_1
	})

	var_15_36.id = "ErrorTimer"

	var_15_36:SetRGBFromTable(SWATCHES.Popups.warning, 0)
	var_15_36:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_15_36:SetAlignment(LUI.Alignment.Left)
	var_15_36:SetVerticalAlignment(LUI.Alignment.Center)
	var_15_36:setEndTime(0)
	var_15_36:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 10, _1080p * 500, _1080p * -22, _1080p * 8)
	var_15_0:addElement(var_15_36)

	var_15_0.ErrorTimer = var_15_36

	local var_15_37
	local var_15_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_28:RegisterAnimationSequence("DefaultSequence", var_15_38)

	local var_15_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_32:RegisterAnimationSequence("DefaultSequence", var_15_39)

	local var_15_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_34:RegisterAnimationSequence("DefaultSequence", var_15_40)

	local var_15_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_36:RegisterAnimationSequence("DefaultSequence", var_15_41)

	local function var_15_42()
		var_15_28:AnimateSequence("DefaultSequence")
		var_15_32:AnimateSequence("DefaultSequence")
		var_15_34:AnimateSequence("DefaultSequence")
		var_15_36:AnimateSequence("DefaultSequence")
	end

	var_15_0._sequences.DefaultSequence = var_15_42

	local var_15_43
	local var_15_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_28:RegisterAnimationSequence("Error", var_15_44)

	local var_15_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_32:RegisterAnimationSequence("Error", var_15_45)

	local var_15_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_34:RegisterAnimationSequence("Error", var_15_46)

	local var_15_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_36:RegisterAnimationSequence("Error", var_15_47)

	local function var_15_48()
		var_15_28:AnimateSequence("Error")
		var_15_32:AnimateSequence("Error")
		var_15_34:AnimateSequence("Error")
		var_15_36:AnimateSequence("Error")
	end

	var_15_0._sequences.Error = var_15_48

	local var_15_49
	local var_15_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_28:RegisterAnimationSequence("ErrorLocked", var_15_50)

	local var_15_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_32:RegisterAnimationSequence("ErrorLocked", var_15_51)

	local var_15_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_34:RegisterAnimationSequence("ErrorLocked", var_15_52)

	local var_15_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_36:RegisterAnimationSequence("ErrorLocked", var_15_53)

	local function var_15_54()
		var_15_28:AnimateSequence("ErrorLocked")
		var_15_32:AnimateSequence("ErrorLocked")
		var_15_34:AnimateSequence("ErrorLocked")
		var_15_36:AnimateSequence("ErrorLocked")
	end

	var_15_0._sequences.ErrorLocked = var_15_54
	var_15_22.navigation = {
		down = {
			var_15_24,
			var_15_26
		}
	}
	var_15_24.navigation = {
		up = var_15_22,
		right = var_15_26
	}
	var_15_26.navigation = {
		left = var_15_24,
		up = var_15_22
	}

	var_15_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 10,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_15_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = -10,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_15_55 = LUI.UIBindButton.new()

	var_15_55.id = "selfBindButton"

	var_15_0:addElement(var_15_55)

	var_15_0.bindButton = var_15_55

	var_0_2(var_15_0, var_15_1, arg_15_1)
	ACTIONS.AnimateSequence(var_15_0, "DefaultSequence")

	return var_15_0
end

MenuBuilder.registerType("CODAccountAuthentication", CODAccountAuthentication)
LockTable(_M)
