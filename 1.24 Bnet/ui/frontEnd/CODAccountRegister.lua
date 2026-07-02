module(..., package.seeall)

local function var_0_0(arg_1_0)
	for iter_1_0, iter_1_1 in ipairs(arg_1_0._inputs) do
		local var_1_0 = iter_1_1:GetTextElement()

		if not var_1_0.isValid then
			if var_1_0.req.SetVisible then
				var_1_0.req:SetVisible(true)
			else
				ACTIONS.AnimateSequence(var_1_0.req, "On")
			end

			ACTIONS.AnimateSequence(iter_1_1, "Invalid")
		else
			ACTIONS.AnimateSequence(iter_1_1, "Valid")
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local function var_2_0()
		REGISTRATION.UpdatePassword(arg_2_1)
		arg_2_0:dispatchEventToCurrentMenu({
			name = "password_updated"
		})

		return REGISTRATION.CheckIsPassing(REGISTRATION.PasswordRules)
	end

	local function var_2_1()
		REGISTRATION.UpdateEmail(AccountRegistration.DIBHDDJHG(arg_2_1))

		local var_4_0, var_4_1 = REGISTRATION.CheckIsPassing(REGISTRATION.EmailRules)

		if not var_4_0 then
			arg_2_0.req.Text:setText(var_4_1)
		end

		return var_4_0
	end

	if arg_2_0.isPassword then
		arg_2_0.isValid = var_2_0()
	elseif arg_2_0.isEmail then
		arg_2_0.isValid = var_2_1()
	elseif #arg_2_1 > 0 then
		arg_2_0.isValid = true
	else
		arg_2_0.isValid = false
	end

	if arg_2_0.isValid and not arg_2_0.isPassword then
		ACTIONS.AnimateSequence(arg_2_0.req, "Off")
	end

	return arg_2_0.isValid
end

local function var_0_2(arg_5_0)
	local function var_5_0()
		for iter_6_0, iter_6_1 in ipairs(arg_5_0._inputs) do
			if not iter_6_1:GetTextElement().isValid then
				return false
			end
		end

		return true
	end

	arg_5_0.ButtonConfirm.isDisabled = not var_5_0()
end

local function var_0_3(arg_7_0)
	return function(arg_8_0, arg_8_1)
		local function var_8_0()
			local var_9_0 = arg_8_0:getParent()
			local var_9_1 = FocusType.MouseOver

			if Engine.HDGDBCJFG() and LUI.IsLastInputGamepad(arg_7_0._controllerIndex) then
				var_9_1 = FocusType.Gamepad
			end

			var_9_0:FocusNextElement(arg_8_0, "down", var_9_1, arg_8_1.qualifier, arg_7_0._controllerIndex)
		end

		if not arg_8_1.isDefault then
			if var_0_1(arg_8_0, arg_8_1.text) then
				var_8_0()
			end
		else
			arg_8_0.isValid = false

			arg_8_0.req:Reset()
		end

		var_0_2(arg_7_0)
	end
end

local function var_0_4(arg_10_0)
	local var_10_0 = CODACCOUNT.CountryCodes[arg_10_0._countryCodeIndex]

	if var_10_0 == "DE" or var_10_0 == "PT" then
		arg_10_0.EmailMessage:setText(Engine.CBBHFCGDIC("CODACCOUNT/MARKETING_OPT_IN_ALT_DE_PT"))
	else
		arg_10_0.EmailMessage:setText(Engine.CBBHFCGDIC("CODACCOUNT/MARKETING_OPT_IN"))
	end
end

local function var_0_5(arg_11_0)
	local var_11_0, var_11_1, var_11_2, var_11_3 = arg_11_0.InputRegion:getLocalRect()
	local var_11_4 = {
		type = "Dropdown",
		sliderDataName = "nil",
		id = "InputRegionDropdown",
		labels = CODACCOUNT.GetCountryLabels(),
		name = Engine.CBBHFCGDIC("CODACCOUNT/REGION"),
		buttonHeight = var_11_3 - var_11_1,
		parent = function(arg_12_0)
			return arg_12_0
		end,
		defaultOptionValue = function(arg_13_0)
			return arg_11_0._countryCodeIndex
		end,
		value = function(arg_14_0)
			return arg_11_0._countryCodeIndex
		end,
		action = function(arg_15_0, arg_15_1, arg_15_2)
			if arg_15_2 ~= nil then
				arg_11_0._countryCodeIndex = arg_15_2

				var_0_4(arg_11_0)
			end
		end
	}

	arg_11_0.InputRegionDropdown = OPTIONS.CreateOption(arg_11_0, arg_11_0._controllerIndex, var_11_4, nil)

	arg_11_0.InputRegionDropdown:SetAnchorsAndPosition(0, 1, 0, 1, var_11_0, var_11_2, var_11_1, var_11_3)
	arg_11_0.InputRegionDropdown:addElementAfter(arg_11_0.InputPassword)
	arg_11_0:SetActiveParentBehavior()
	arg_11_0.InputRegionDropdown:dispatchEventToParent({
		name = "request_active"
	})
	arg_11_0.InputRegionDropdown:addEventHandler("lose_focus", function(arg_16_0, arg_16_1)
		arg_16_0:dispatchEventToChildren({
			name = "button_up"
		})
	end)

	arg_11_0.BindButton = LUI.UIBindButton.new()
	arg_11_0.BindButton.id = "BindButton"

	arg_11_0:addElement(arg_11_0.BindButton)
	arg_11_0.BindButton:addEventHandler("button_secondary", function(arg_17_0, arg_17_1)
		if arg_11_0.dropdownButtonList then
			arg_11_0.dropdownButtonList:processEvent({
				name = "button_secondary"
			})

			return true
		end
	end)
	arg_11_0.BindButton:addEventHandler("gamepad_button", function(arg_18_0, arg_18_1)
		if arg_11_0.dropdownButtonList and (arg_18_1.button == "shoulderl" or arg_18_1.button == "shoulderr") then
			return true
		end
	end)
	arg_11_0.InputRegionDropdown:RemoveToolTipData()
end

local function var_0_6(arg_19_0)
	arg_19_0.InputEmail:Setup(arg_19_0._controllerIndex, {
		isEmail = true,
		req = arg_19_0.ReqEmail
	})
	arg_19_0.InputPassword:Setup(arg_19_0._controllerIndex, {
		isPassword = true,
		req = arg_19_0.ReqPassword,
		maxInputStringLength = REGISTRATION.PasswordRulesConstants.MAX_GLYPHS
	})
	arg_19_0.InputEmail:SetTextEditCompleteCallbackFunc(var_0_3(arg_19_0))
	arg_19_0.InputPassword:SetTextEditCompleteCallbackFunc(var_0_3(arg_19_0))
	arg_19_0.InputPassword:SetIsTypingCallbackFunc(function(arg_20_0)
		arg_19_0._isTyping = arg_20_0
		arg_19_0._previousText = ""

		local var_20_0

		local function var_20_1()
			arg_19_0:Wait(250).onComplete = function()
				if arg_19_0._isTyping then
					local var_22_0 = arg_19_0.InputPassword:GetTextElement()
					local var_22_1 = arg_19_0.InputPassword:GetEditText()

					if var_22_1 ~= arg_19_0._previousText then
						var_0_1(var_22_0, var_22_1)

						arg_19_0._previousText = var_22_1
					end

					var_20_1()
				end
			end
		end

		var_20_1()
	end)

	arg_19_0._inputs = {
		arg_19_0.InputEmail,
		arg_19_0.InputPassword
	}

	var_0_5(arg_19_0)
end

local function var_0_7(arg_23_0)
	return {
		controllerIndex = arg_23_0._controllerIndex,
		username = Engine.DHCFHGIABE(arg_23_0._controllerIndex),
		email = AccountRegistration.DIBHDDJHG(arg_23_0.InputEmail:GetEditText()),
		password = arg_23_0.InputPassword:GetEditText(),
		countryCode = CODACCOUNT.CountryCodes[arg_23_0._countryCodeIndex],
		marketingOptIn = arg_23_0.MarketingOptIn.isChecked,
		isAnonymousAccount = arg_23_0.isAnonymousAccount
	}
end

local function var_0_8(arg_24_0)
	local var_24_0 = AccountRegistration.DDIDDAGHJF(arg_24_0._controllerIndex)

	if var_24_0.countryCode then
		local var_24_1 = CODACCOUNT.GetCountryCodeIndex(var_24_0.countryCode)

		arg_24_0._countryCodeIndex = var_24_1 and var_24_1 or arg_24_0._countryCodeIndex
	end

	arg_24_0._autoFillEmail = var_24_0.email
end

local function var_0_9(arg_25_0, arg_25_1, arg_25_2)
	if IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_25_0, "JP")
	elseif IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_25_0, "AR")
	end

	arg_25_0.isAnonymousAccount = arg_25_2.isAnonymousAccount
	arg_25_0._countryCodeIndex = 1
	arg_25_0._controllerIndex = arg_25_1

	arg_25_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CODACCOUNT/REGISTER_TITLE"))
	var_0_8(arg_25_0)

	if arg_25_2.accountCredentials then
		arg_25_0._autoFillEmail = arg_25_2.accountCredentials.email
		arg_25_0._countryCodeIndex = CODACCOUNT.GetCountryCodeIndex(arg_25_2.accountCredentials.countryCode)
		arg_25_0.MarketingOptIn.isChecked = arg_25_2.accountCredentials.marketingOptIn

		arg_25_0.MarketingOptIn.CheckBox:SetValue(arg_25_2.accountCredentials.marketingOptIn)
	end

	var_0_6(arg_25_0)
	var_0_2(arg_25_0)

	if arg_25_0._autoFillEmail and #arg_25_0._autoFillEmail > 0 then
		local var_25_0 = arg_25_0.InputEmail:GetTextElement()

		var_25_0.textEdit:registerEventHandler("menu_create", function(arg_26_0, arg_26_1)
			var_25_0.isDefault = false
			var_25_0._firstInteraction = false

			var_25_0.textEdit:setTextEditText(arg_25_0._autoFillEmail)
			var_0_1(var_25_0, arg_25_0._autoFillEmail)
		end)
	end

	arg_25_0.InputPassword:addEventHandler("button_over", function(arg_27_0, arg_27_1)
		if arg_27_0:GetTextElement().req.SetVisible then
			arg_27_0:GetTextElement().req:SetVisible(true)
		end
	end)
	arg_25_0.InputPassword:addEventHandler("button_up", function(arg_28_0, arg_28_1)
		if arg_28_0:GetTextElement().req.SetVisible and not arg_28_0._isTyping then
			arg_28_0:GetTextElement().req:SetVisible(false)
		end
	end)
	arg_25_0:registerEventHandler("menu_create", function(arg_29_0, arg_29_1)
		arg_29_0:GetCurrentMenu().ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end)
	arg_25_0.ButtonConfirm:addEventHandler("button_action", function(arg_30_0, arg_30_1)
		if arg_30_0.isDisabled then
			var_0_0(arg_25_0)
		else
			arg_25_2.accountCredentials = var_0_7(arg_25_0)

			LUI.FlowManager.RequestPopupMenu(unused, "CODAccountEULAPopupA", true, arg_30_1.controller, true, arg_25_2, nil, true, true)
		end
	end)
	arg_25_0.ButtonCancel:addEventHandler("button_action", function(arg_31_0, arg_31_1)
		arg_25_0:getParent():getParent():processEvent({
			name = "button_secondary"
		})

		if arg_25_2.onCancelRegister then
			arg_25_2.onCancelRegister()
		end
	end)
	arg_25_0:addEventHandler("restore_focus", function(arg_32_0, arg_32_1)
		return arg_25_0.InputEmail:isInFocus() or arg_25_0.InputPassword:isInFocus()
	end)
end

function CODAccountRegister(arg_33_0, arg_33_1)
	local var_33_0 = LUI.UIVerticalNavigator.new()

	var_33_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 825 * _1080p, 0, 1080 * _1080p)

	var_33_0.id = "CODAccountRegister"
	var_33_0._animationSets = var_33_0._animationSets or {}
	var_33_0._sequences = var_33_0._sequences or {}

	local var_33_1 = arg_33_1 and arg_33_1.controllerIndex

	if not var_33_1 and not Engine.DDJFBBJAIG() then
		var_33_1 = var_33_0:getRootController()
	end

	assert(var_33_1)

	local var_33_2 = var_33_0
	local var_33_3
	local var_33_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_33_1
	})

	var_33_4.id = "MenuTitle"

	var_33_4.MenuTitle:setText(Engine.CBBHFCGDIC("CODACCOUNT/REGISTER_TITLE"), 0)
	var_33_4.Line:SetLeft(0, 0)
	var_33_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 825, 0, _1080p * 100)
	var_33_0:addElement(var_33_4)

	var_33_0.MenuTitle = var_33_4

	local var_33_5

	if CONDITIONS.IsConsoleGame(var_33_0) then
		var_33_5 = LUI.UIText.new()
		var_33_5.id = "Recommendation"

		var_33_5:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
		var_33_5:setText(Engine.CBBHFCGDIC("CODACCOUNT/USE_KEYBOARD"), 0)
		var_33_5:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_33_5:SetAlignment(LUI.Alignment.Left)
		var_33_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 741, _1080p * 153, _1080p * 173)
		var_33_0:addElement(var_33_5)

		var_33_0.Recommendation = var_33_5
	end

	local var_33_6
	local var_33_7 = LUI.UIText.new()

	var_33_7.id = "BasicInfo"

	var_33_7:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_33_7:setText(Engine.CBBHFCGDIC("CODACCOUNT/BASIC_INFO"), 0)
	var_33_7:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_33_7:SetAlignment(LUI.Alignment.Left)
	var_33_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 726, _1080p * 233, _1080p * 255)
	var_33_0:addElement(var_33_7)

	var_33_0.BasicInfo = var_33_7

	local var_33_8
	local var_33_9 = LUI.UIImage.new()

	var_33_9.id = "Line1"

	var_33_9:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_33_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 727, _1080p * 261, _1080p * 262)
	var_33_0:addElement(var_33_9)

	var_33_0.Line1 = var_33_9

	local var_33_10
	local var_33_11 = LUI.UIText.new()

	var_33_11.id = "GameDetails"

	var_33_11:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_33_11:setText(Engine.CBBHFCGDIC("CODACCOUNT/GAME_DETAILS"), 0)
	var_33_11:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_33_11:SetAlignment(LUI.Alignment.Left)
	var_33_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 726, _1080p * 401, _1080p * 423)
	var_33_0:addElement(var_33_11)

	var_33_0.GameDetails = var_33_11

	local var_33_12
	local var_33_13 = LUI.UIImage.new()

	var_33_13.id = "Line2"

	var_33_13:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_33_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 727, _1080p * 429, _1080p * 430)
	var_33_0:addElement(var_33_13)

	var_33_0.Line2 = var_33_13

	local var_33_14
	local var_33_15 = MenuBuilder.BuildRegisteredType("CODAccountEditBox", {
		controllerIndex = var_33_1
	})

	var_33_15.id = "InputEmail"

	var_33_15.EditBox.Text:setText(Engine.CBBHFCGDIC("CODACCOUNT/EMAIL"), 0)
	var_33_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 726, _1080p * 282, _1080p * 316)
	var_33_0:addElement(var_33_15)

	var_33_0.InputEmail = var_33_15

	local var_33_16
	local var_33_17 = MenuBuilder.BuildRegisteredType("CODAccountInputRequired", {
		controllerIndex = var_33_1
	})

	var_33_17.id = "ReqEmail"

	var_33_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 857, _1080p * 1199, _1080p * 280, _1080p * 324)
	var_33_0:addElement(var_33_17)

	var_33_0.ReqEmail = var_33_17

	local var_33_18
	local var_33_19 = MenuBuilder.BuildRegisteredType("CODAccountEditBox", {
		controllerIndex = var_33_1
	})

	var_33_19.id = "InputPassword"

	var_33_19.EditBox.Text:setText(Engine.CBBHFCGDIC("CODACCOUNT/PASSWORD"), 0)
	var_33_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 726, _1080p * 327, _1080p * 361)
	var_33_0:addElement(var_33_19)

	var_33_0.InputPassword = var_33_19

	local var_33_20
	local var_33_21 = MenuBuilder.BuildRegisteredType("CODAccountPasswordReqs", {
		controllerIndex = var_33_1
	})

	var_33_21.id = "ReqPassword"

	var_33_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 857, _1080p * 1199, _1080p * 327, _1080p * 617)
	var_33_0:addElement(var_33_21)

	var_33_0.ReqPassword = var_33_21

	local var_33_22
	local var_33_23 = LUI.UIText.new()

	var_33_23.id = "InputRegion"

	var_33_23:setText("", 0)
	var_33_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_33_23:SetAlignment(LUI.Alignment.Left)
	var_33_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 725, _1080p * 450, _1080p * 486)
	var_33_0:addElement(var_33_23)

	var_33_0.InputRegion = var_33_23

	local var_33_24
	local var_33_25 = MenuBuilder.BuildRegisteredType("CODAccountMarketingOptIn", {
		controllerIndex = var_33_1
	})

	var_33_25.id = "MarketingOptIn"

	var_33_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 726, _1080p * 817, _1080p * 855)
	var_33_0:addElement(var_33_25)

	var_33_0.MarketingOptIn = var_33_25

	local var_33_26
	local var_33_27 = LUI.UIText.new()

	var_33_27.id = "EmailDetails"

	var_33_27:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_33_27:setText(Engine.CBBHFCGDIC("CODACCOUNT/EMAIL_SIGNUP"), 0)
	var_33_27:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_33_27:SetAlignment(LUI.Alignment.Left)
	var_33_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 726, _1080p * 526, _1080p * 548)
	var_33_0:addElement(var_33_27)

	var_33_0.EmailDetails = var_33_27

	local var_33_28
	local var_33_29 = LUI.UIImage.new()

	var_33_29.id = "Line3"

	var_33_29:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_33_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 727, _1080p * 554, _1080p * 555)
	var_33_0:addElement(var_33_29)

	var_33_0.Line3 = var_33_29

	local var_33_30
	local var_33_31 = LUI.UIText.new()

	var_33_31.id = "EmailMessage"

	var_33_31:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_33_31:setText(Engine.CBBHFCGDIC("CODACCOUNT/MARKETING_OPT_IN"), 0)
	var_33_31:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_33_31:SetAlignment(LUI.Alignment.Left)
	var_33_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 741, _1080p * 569, _1080p * 589)
	var_33_0:addElement(var_33_31)

	var_33_0.EmailMessage = var_33_31

	local var_33_32
	local var_33_33 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_33_1
	})

	var_33_33.id = "ButtonConfirm"

	var_33_33.Text:SetLeft(_1080p * 20, 0)
	var_33_33.Text:setText(Engine.CBBHFCGDIC("CODACCOUNT/CONFIRM"), 0)
	var_33_33.Text:SetAlignment(LUI.Alignment.Left)
	var_33_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 471, _1080p * 882, _1080p * 920)
	var_33_0:addElement(var_33_33)

	var_33_0.ButtonConfirm = var_33_33

	local var_33_34
	local var_33_35 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_33_1
	})

	var_33_35.id = "ButtonCancel"

	var_33_35.Text:SetLeft(_1080p * 20, 0)
	var_33_35.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CANCEL"), 0)
	var_33_35.Text:SetAlignment(LUI.Alignment.Left)
	var_33_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 471, _1080p * 930, _1080p * 968)
	var_33_0:addElement(var_33_35)

	var_33_0.ButtonCancel = var_33_35

	local var_33_36

	if CONDITIONS.IsKoreanAccount(var_33_0) then
		local var_33_37 = LUI.UIText.new()

		var_33_37.id = "KRPrivacyRegulation"

		var_33_37:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
		var_33_37:setText(Engine.CBBHFCGDIC("CODACCOUNT/KR_PRIVACY_REGULATION"), 0)
		var_33_37:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_33_37:SetAlignment(LUI.Alignment.Left)
		var_33_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 818, _1080p * 121, _1080p * 141)
		var_33_0:addElement(var_33_37)

		var_33_0.KRPrivacyRegulation = var_33_37
	end

	local function var_33_38()
		return
	end

	var_33_0._sequences.DefaultSequence = var_33_38

	if CONDITIONS.IsConsoleGame(var_33_0) then
		local var_33_39 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 185
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 153
			}
		}

		var_33_5:RegisterAnimationSequence("AR", var_33_39)
	end

	local var_33_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 224
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 726
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		}
	}

	var_33_7:RegisterAnimationSequence("AR", var_33_40)

	local var_33_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 424
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 392
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 735
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		}
	}

	var_33_11:RegisterAnimationSequence("AR", var_33_41)

	local var_33_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 827
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 865
		}
	}

	var_33_25:RegisterAnimationSequence("AR", var_33_42)

	local var_33_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 517
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 549
		}
	}

	var_33_27:RegisterAnimationSequence("AR", var_33_43)

	local var_33_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 601
		}
	}

	var_33_31:RegisterAnimationSequence("AR", var_33_44)

	local function var_33_45()
		if CONDITIONS.IsConsoleGame(var_33_0) then
			var_33_5:AnimateSequence("AR")
		end

		var_33_7:AnimateSequence("AR")
		var_33_11:AnimateSequence("AR")
		var_33_25:AnimateSequence("AR")
		var_33_27:AnimateSequence("AR")
		var_33_31:AnimateSequence("AR")
	end

	var_33_0._sequences.AR = var_33_45

	local var_33_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 446
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 495
		}
	}

	var_33_23:RegisterAnimationSequence("JP", var_33_46)

	local function var_33_47()
		var_33_23:AnimateSequence("JP")
	end

	var_33_0._sequences.JP = var_33_47

	var_0_9(var_33_0, var_33_1, arg_33_1)

	return var_33_0
end

MenuBuilder.registerType("CODAccountRegister", CODAccountRegister)
LockTable(_M)
