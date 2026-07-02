module(..., package.seeall)

local function var_0_0(arg_1_0)
	local function var_1_0(arg_2_0, arg_2_1)
		arg_1_0.PlaceholderText:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_1_0.InputCodeBox, "Off")
	end

	local function var_1_1(arg_3_0, arg_3_1)
		if not arg_3_1.isDefault then
			arg_1_0._otpPassword = arg_3_1.text

			var_1_0()
			arg_1_0.InputCodeBox:processEvent({
				name = "lose_focus"
			})
			arg_1_0.ButtonConfirm:processEvent({
				name = "gain_focus"
			})
		end
	end

	arg_1_0.InputCodeBox:Setup(arg_1_0._controllerIndex, {
		min = 0,
		isNumeric = true,
		isPassword = false,
		max = REGISTRATION.OTPPasswordMaxValue,
		maxInputStringLength = REGISTRATION.CountUTF8Glyphs(tostring(REGISTRATION.OTPPasswordMaxValue))
	})
	arg_1_0.InputCodeBox:SetTextEditCompleteCallbackFunc(var_1_1)
	arg_1_0.InputCodeBox:SetIsTypingCallbackFunc(var_1_0)
end

local function var_0_1(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._controllerIndex = arg_4_1
	arg_4_0._otpPassword = ""
	arg_4_0._screenOpenedTime = Engine.DEIDGHDBHD()

	var_0_0(arg_4_0)

	local function var_4_0()
		if not arg_4_2.isGiftingPopup then
			return
		end

		local var_5_0 = Engine.DEIDGHDBHD() - arg_4_0._screenOpenedTime

		GIFT.LogGiftingScreenInteraction(arg_4_1, "GiftingTFAPopup", arg_4_2.originMenu, var_5_0, "button_alt2")
	end

	arg_4_0.ButtonConfirm:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		if REGISTRATION.CountUTF8Glyphs(arg_4_0._otpPassword) == REGISTRATION.CountUTF8Glyphs(tostring(REGISTRATION.OTPPasswordMaxValue)) then
			TwoFactorAuth.BJDFEDIAHD(arg_4_1, arg_4_0._otpPassword, true)
		else
			ACTIONS.AnimateSequence(arg_4_0.InputCodeBox, "Invalid")
			ACTIONS.AnimateSequence(arg_4_0, "Error")
		end
	end)
	arg_4_0:addEventHandler("otp_proof_token_fetch_complete", function(arg_7_0, arg_7_1)
		if arg_7_1.success then
			if arg_4_2.onSuccess then
				arg_4_2.onSuccess(arg_7_0)
				var_4_0()
				ACTIONS.LeaveMenu(arg_4_0)
			end
		elseif arg_4_2.onError then
			ACTIONS.AnimateSequence(arg_4_0, "Error")
			arg_4_2.onError(arg_7_0)
		end
	end)
	arg_4_0.ButtonHelp:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		Engine.BHECIAHGC(arg_4_1, WebBrowserType.FULLSCREEN, CODACCOUNT.AccountSettingsURL)
	end)
	arg_4_0.bindButton:addEventHandler("button_secondary", function(arg_9_0, arg_9_1)
		if arg_4_2.onCancel then
			arg_4_2.onCancel()
		end

		ACTIONS.LeaveMenu(arg_4_0)
	end)
end

function GiftingTFAPopup(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0.id = "GiftingTFAPopup"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	var_10_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_10_1
	})
	var_10_0.HelperBar.id = "HelperBar"

	var_10_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_10_0.HelperBar:setPriority(10)
	var_10_0:addElement(var_10_0.HelperBar)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "Darkener"

	var_10_4:SetRGBFromInt(0, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.Darkener = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "Window"

	var_10_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -610, _1080p * 610, _1080p * -350, _1080p * 350)
	var_10_0:addElement(var_10_6)

	var_10_0.Window = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIStyledText.new()

	var_10_8.id = "Header"

	var_10_8:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_10_8:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_HEADING"), 0)
	var_10_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_10_8:SetAlignment(LUI.Alignment.Center)
	var_10_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_10_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -610, _1080p * 610, _1080p * -326, _1080p * -266)
	var_10_0:addElement(var_10_8)

	var_10_0.Header = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIImage.new()

	var_10_10.id = "Line"

	var_10_10:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_10_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * -269, _1080p * -268)
	var_10_0:addElement(var_10_10)

	var_10_0.Line = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIStyledText.new()

	var_10_12.id = "Body"

	var_10_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_10_12:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_ACCOUNT"), 0)
	var_10_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_12:SetAlignment(LUI.Alignment.Center)
	var_10_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * -245, _1080p * -221)
	var_10_0:addElement(var_10_12)

	var_10_0.Body = var_10_12

	local var_10_13
	local var_10_14 = LUI.UIStyledText.new()

	var_10_14.id = "Instructions"

	var_10_14:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_10_14:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_ENTER_CONFIRM"), 0)
	var_10_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_10_14:SetAlignment(LUI.Alignment.Center)
	var_10_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * -172, _1080p * -148)
	var_10_0:addElement(var_10_14)

	var_10_0.Instructions = var_10_14

	local var_10_15
	local var_10_16 = LUI.UIStyledText.new()

	var_10_16.id = "HelpText"

	var_10_16:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_10_16:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_INFO"), 0)
	var_10_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_16:SetAlignment(LUI.Alignment.Left)
	var_10_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * 90, _1080p * 114)
	var_10_0:addElement(var_10_16)

	var_10_0.HelpText = var_10_16

	local var_10_17
	local var_10_18 = LUI.UIStyledText.new()

	var_10_18.id = "HelpTextHeader"

	var_10_18:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_10_18:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_HAVING_ISSUES"), 0)
	var_10_18:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_10_18:SetAlignment(LUI.Alignment.Left)
	var_10_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * 47, _1080p * 87)
	var_10_0:addElement(var_10_18)

	var_10_0.HelpTextHeader = var_10_18

	local var_10_19
	local var_10_20 = LUI.UIImage.new()

	var_10_20.id = "HorzRule"

	var_10_20:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_10_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * 21, _1080p * 22)
	var_10_0:addElement(var_10_20)

	var_10_0.HorzRule = var_10_20

	local var_10_21
	local var_10_22 = MenuBuilder.BuildRegisteredType("CODAccountEditBox", {
		controllerIndex = var_10_1
	})

	var_10_22.id = "InputCodeBox"

	var_10_22.EditBox.Text:setText("", 0)
	var_10_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -350, _1080p * 350, _1080p * -134, _1080p * -90)
	var_10_0:addElement(var_10_22)

	var_10_0.InputCodeBox = var_10_22

	local var_10_23
	local var_10_24 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_10_1
	})

	var_10_24.id = "ButtonConfirm"

	var_10_24.Text:SetLeft(_1080p * 20, 0)
	var_10_24.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CODACCOUNT/TFA_BTN_CONFIRM")), 0)
	var_10_24.Text:SetAlignment(LUI.Alignment.Center)
	var_10_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -460, _1080p * -10, _1080p * 230, _1080p * 290)
	var_10_0:addElement(var_10_24)

	var_10_0.ButtonConfirm = var_10_24

	local var_10_25
	local var_10_26 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_10_1
	})

	var_10_26.id = "ButtonHelp"

	var_10_26.Text:SetLeft(_1080p * 20, 0)
	var_10_26.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CODACCOUNT/TFA_BTN_HELP")), 0)
	var_10_26.Text:SetAlignment(LUI.Alignment.Center)
	var_10_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 10, _1080p * 460, _1080p * 230, _1080p * 290)
	var_10_0:addElement(var_10_26)

	var_10_0.ButtonHelp = var_10_26

	local var_10_27
	local var_10_28 = LUI.UIImage.new()

	var_10_28.id = "InputCodeLock"

	var_10_28:setImage(RegisterMaterial("icon_lock"), 0)
	var_10_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 301, _1080p * 345, _1080p * -134, _1080p * -90)
	var_10_0:addElement(var_10_28)

	var_10_0.InputCodeLock = var_10_28

	local var_10_29
	local var_10_30 = LUI.UIStyledText.new()

	var_10_30.id = "PlaceholderText"

	var_10_30:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_10_30:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_TF_ENTER_CODE"), 0)
	var_10_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_30:SetAlignment(LUI.Alignment.Left)
	var_10_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -331, _1080p * 337, _1080p * -125, _1080p * -97)
	var_10_0:addElement(var_10_30)

	var_10_0.PlaceholderText = var_10_30

	local var_10_31
	local var_10_32 = LUI.UIStyledText.new()

	var_10_32.id = "ErrorMessage"

	var_10_32:SetRGBFromTable(SWATCHES.Popups.warning, 0)
	var_10_32:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_ERROR_MESSAGE"), 0)
	var_10_32:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_10_32:SetAlignment(LUI.Alignment.Center)
	var_10_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * -70, _1080p * -46)
	var_10_0:addElement(var_10_32)

	var_10_0.ErrorMessage = var_10_32

	local var_10_33
	local var_10_34 = LUI.UIStyledText.new()

	var_10_34.id = "ErrorTimeToWait"

	var_10_34:SetRGBFromTable(SWATCHES.Popups.warning, 0)
	var_10_34:setText(Engine.CBBHFCGDIC("CODACCOUNT/TFA_TIME_LEFT"), 0)
	var_10_34:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_10_34:SetAlignment(LUI.Alignment.Right)
	var_10_34:SetVerticalAlignment(LUI.Alignment.Center)
	var_10_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -500, _1080p * -10, _1080p * -18, _1080p * 6)
	var_10_0:addElement(var_10_34)

	var_10_0.ErrorTimeToWait = var_10_34

	local var_10_35
	local var_10_36 = MenuBuilder.BuildRegisteredType("UICountdown", {
		controllerIndex = var_10_1
	})

	var_10_36.id = "ErrorTimer"

	var_10_36:SetRGBFromTable(SWATCHES.Popups.warning, 0)
	var_10_36:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_10_36:SetAlignment(LUI.Alignment.Left)
	var_10_36:SetVerticalAlignment(LUI.Alignment.Center)
	var_10_36:setEndTime(0)
	var_10_36:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 10, _1080p * 500, _1080p * -22, _1080p * 8)
	var_10_0:addElement(var_10_36)

	var_10_0.ErrorTimer = var_10_36

	local var_10_37
	local var_10_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_28:RegisterAnimationSequence("DefaultSequence", var_10_38)

	local var_10_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_32:RegisterAnimationSequence("DefaultSequence", var_10_39)

	local var_10_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_34:RegisterAnimationSequence("DefaultSequence", var_10_40)

	local var_10_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_36:RegisterAnimationSequence("DefaultSequence", var_10_41)

	local function var_10_42()
		var_10_28:AnimateSequence("DefaultSequence")
		var_10_32:AnimateSequence("DefaultSequence")
		var_10_34:AnimateSequence("DefaultSequence")
		var_10_36:AnimateSequence("DefaultSequence")
	end

	var_10_0._sequences.DefaultSequence = var_10_42

	local var_10_43
	local var_10_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_28:RegisterAnimationSequence("Error", var_10_44)

	local var_10_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_32:RegisterAnimationSequence("Error", var_10_45)

	local var_10_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_34:RegisterAnimationSequence("Error", var_10_46)

	local var_10_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_36:RegisterAnimationSequence("Error", var_10_47)

	local function var_10_48()
		var_10_28:AnimateSequence("Error")
		var_10_32:AnimateSequence("Error")
		var_10_34:AnimateSequence("Error")
		var_10_36:AnimateSequence("Error")
	end

	var_10_0._sequences.Error = var_10_48

	local var_10_49
	local var_10_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_28:RegisterAnimationSequence("ErrorLocked", var_10_50)

	local var_10_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_32:RegisterAnimationSequence("ErrorLocked", var_10_51)

	local var_10_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_34:RegisterAnimationSequence("ErrorLocked", var_10_52)

	local var_10_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_36:RegisterAnimationSequence("ErrorLocked", var_10_53)

	local function var_10_54()
		var_10_28:AnimateSequence("ErrorLocked")
		var_10_32:AnimateSequence("ErrorLocked")
		var_10_34:AnimateSequence("ErrorLocked")
		var_10_36:AnimateSequence("ErrorLocked")
	end

	var_10_0._sequences.ErrorLocked = var_10_54
	var_10_22.navigation = {
		down = {
			var_10_24,
			var_10_26
		}
	}
	var_10_24.navigation = {
		up = var_10_22,
		right = var_10_26
	}
	var_10_26.navigation = {
		left = var_10_24,
		up = var_10_22
	}

	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 10,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = -10,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_10_55 = LUI.UIBindButton.new()

	var_10_55.id = "selfBindButton"

	var_10_0:addElement(var_10_55)

	var_10_0.bindButton = var_10_55

	var_0_1(var_10_0, var_10_1, arg_10_1)
	ACTIONS.AnimateSequence(var_10_0, "DefaultSequence")

	return var_10_0
end

MenuBuilder.registerType("GiftingTFAPopup", GiftingTFAPopup)
LockTable(_M)
