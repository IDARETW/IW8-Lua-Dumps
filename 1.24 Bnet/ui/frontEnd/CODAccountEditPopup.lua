module(..., package.seeall)

local var_0_0 = CoD.GameDVRDisable
local var_0_1 = CoD.GameDVREnable

local function var_0_2(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0()
		REGISTRATION.UpdateUserName(arg_1_2)

		local var_2_0, var_2_1 = REGISTRATION.CheckIsPassing(REGISTRATION.UserNameRules)

		if arg_1_1.isDefault then
			var_2_1 = "CODACCOUNT/PLEASE_COMPLETE"
		end

		if var_2_1 ~= nil then
			arg_1_0.ErrorMessage:setText(Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_LOCALIZED", var_2_1))
		end

		return var_2_0 and not arg_1_1.isDefault
	end

	local function var_1_1()
		REGISTRATION.UpdateEmail(arg_1_2)

		local var_3_0, var_3_1 = REGISTRATION.CheckIsPassing(REGISTRATION.EmailRules)

		if arg_1_1.isDefault then
			var_3_1 = "CODACCOUNT/PLEASE_COMPLETE"
		end

		if var_3_1 ~= nil then
			arg_1_0.ErrorMessage:setText(Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_LOCALIZED", var_3_1))
		end

		return var_3_0 and not arg_1_1.isDefault
	end

	if arg_1_1.isUsername then
		arg_1_1.isValid = var_1_0()
	elseif arg_1_1.isEmail then
		arg_1_1.isValid = var_1_1()
	else
		assert(false, "CODAccountEditPopup only supports username and email inputs")
	end

	return arg_1_1.isValid
end

local function var_0_3(arg_4_0)
	assert(arg_4_0.ErrorMessage)

	local var_4_0 = arg_4_0.Input:GetTextElement()
	local var_4_1 = arg_4_0.Input:GetEditText()

	if not var_0_2(arg_4_0, var_4_0, var_4_1) then
		ACTIONS.AnimateSequence(arg_4_0.Input, "Invalid")
		arg_4_0.ErrorMessage:SetAlpha(1)

		return false
	else
		ACTIONS.AnimateSequence(arg_4_0.Input, "Valid")
		arg_4_0.ErrorMessage:SetAlpha(0)
	end

	return true
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_2.title)
	assert(arg_5_2.confirmAction)
	assert(arg_5_2.isEmail or arg_5_2.isUsername)
	arg_5_0.MenuTitle:SetTitle(arg_5_2.title)

	arg_5_0.BindButton = LUI.UIBindButton.new()
	arg_5_0.BindButton.id = "selfBindButton"

	arg_5_0:addElement(arg_5_0.BindButton)
	arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT"),
		container = arg_5_0.Prompts
	})
	arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		button_ref = "button_secondary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK"),
		container = arg_5_0.Prompts
	})

	local function var_5_0(arg_6_0, arg_6_1)
		LUI.FlowManager.RequestLeaveMenu(arg_5_0)
	end

	arg_5_0.ButtonCancel:addEventHandler("button_action", var_5_0)
	arg_5_0.BindButton:addEventHandler("button_secondary", var_5_0)
	arg_5_0.ButtonConfirm:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		if var_0_3(arg_5_0) then
			arg_5_2.confirmAction(arg_5_0.Input:GetEditText())
		end
	end)

	local var_5_1 = 0

	if arg_5_2.isUsername then
		local var_5_2 = Loot.DEBEIFJEEG(arg_5_1, Dvar.CFHDGABACF("LMOKPMKQRR"))

		if Dvar.IBEGCHEFE("OLPQTNNSPT") then
			var_5_2 = Commerce.CEDDCGHIGA(arg_5_1, Dvar.CFHDGABACF("NLNTRLTMQL"))
		end

		if var_5_2 then
			if var_5_2 <= 0 then
				arg_5_0.ButtonConfirm:SetButtonDisabled(true)
			end

			arg_5_0.TokensRemaining:setText(Engine.CBBHFCGDIC("CODACCOUNT/TOKENS_REMAINING", var_5_2))
		end

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_5_0, "AR")
		end
	elseif arg_5_2.isEmail then
		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_5_0, "AREmail")
		else
			ACTIONS.AnimateSequence(arg_5_0, "Email")
		end
	end

	local var_5_3 = {
		isEmail = arg_5_2.isEmail,
		isUsername = arg_5_2.isUsername,
		maxInputStringLength = arg_5_2.isUsername and REGISTRATION.UserNameRulesConstants.MAX_GLYPHS or REGISTRATION.EmailRulesConstants.MAX_LENGTH
	}

	arg_5_0.Input:Setup(arg_5_1, var_5_3)
end

function CODAccountEditPopup(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIVerticalNavigator.new()

	var_8_0.id = "CODAccountEditPopup"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	var_8_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_8_1
	})
	var_8_0.HelperBar.id = "HelperBar"

	var_8_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_8_0.HelperBar:setPriority(10)
	var_8_0:addElement(var_8_0.HelperBar)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("GenericPopupFrame", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "GenericPopupFrame"

	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.GenericPopupFrame = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "Image"

	var_8_6:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_8_6:SetAlpha(0.25, 0)
	var_8_6:setImage(RegisterMaterial("mm_COD_account_icon"), 0)
	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -658, _1080p * -376, _1080p * -124, _1080p * 204)
	var_8_0:addElement(var_8_6)

	var_8_0.Image = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "MenuTitle"

	var_8_8.MenuTitle:setText("", 0)
	var_8_8.Line:SetLeft(0, 0)
	var_8_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 169, _1080p * -225, _1080p * -121)
	var_8_0:addElement(var_8_8)

	var_8_0.MenuTitle = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIImage.new()

	var_8_10.id = "Line"

	var_8_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_8_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * -300, _1080p * -124, _1080p * -124)
	var_8_0:addElement(var_8_10)

	var_8_0.Line = var_8_10

	local var_8_11
	local var_8_12 = MenuBuilder.BuildRegisteredType("CODAccountEditBox", {
		controllerIndex = var_8_1
	})

	var_8_12.id = "Input"

	var_8_12.BackgroundDarkener:SetAlpha(0.5, 0)
	var_8_12.EditBox.Text:setText(Engine.CBBHFCGDIC("MENU/NEW_NAME"), 0)
	var_8_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 412, _1080p * -78, _1080p * -50)
	var_8_0:addElement(var_8_12)

	var_8_0.Input = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIText.new()

	var_8_14.id = "ErrorMessage"

	var_8_14:SetRGBFromTable(SWATCHES.Registration.fail, 0)
	var_8_14:setText("", 0)
	var_8_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_14:SetAlignment(LUI.Alignment.Left)
	var_8_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 412, _1080p * -46, _1080p * -28)
	var_8_0:addElement(var_8_14)

	var_8_0.ErrorMessage = var_8_14

	local var_8_15
	local var_8_16 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_8_1
	})

	var_8_16.id = "ButtonConfirm"

	var_8_16.BackgroundDarkener:SetAlpha(0.5, 0)
	var_8_16.Text:SetLeft(_1080p * 20, 0)
	var_8_16.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CODACCOUNT/CONFIRM")), 0)
	var_8_16.Text:SetAlignment(LUI.Alignment.Left)
	var_8_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 202, _1080p * 103, _1080p * 141)
	var_8_0:addElement(var_8_16)

	var_8_0.ButtonConfirm = var_8_16

	local var_8_17
	local var_8_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_8_1
	})

	var_8_18.id = "ButtonCancel"

	var_8_18.BackgroundDarkener:SetAlpha(0.5, 0)
	var_8_18.Text:SetLeft(_1080p * 20, 0)
	var_8_18.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CANCEL")), 0)
	var_8_18.Text:SetAlignment(LUI.Alignment.Left)
	var_8_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 202, _1080p * 151, _1080p * 189)
	var_8_0:addElement(var_8_18)

	var_8_0.ButtonCancel = var_8_18

	local var_8_19
	local var_8_20 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_8_1
	})

	var_8_20.id = "Prompts"

	if CONDITIONS.AlwaysFalse(var_8_0) then
		var_8_20.Label:setText("Prompts", 0)
	end

	var_8_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -663, _1080p * 246, _1080p * 277)
	var_8_0:addElement(var_8_20)

	var_8_0.Prompts = var_8_20

	local var_8_21
	local var_8_22 = LUI.UIText.new()

	var_8_22.id = "TokensRemaining"

	var_8_22:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_8_22:setText("", 0)
	var_8_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_22:SetAlignment(LUI.Alignment.Left)
	var_8_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 202, _1080p * 58, _1080p * 76)
	var_8_0:addElement(var_8_22)

	var_8_0.TokensRemaining = var_8_22

	local var_8_23
	local var_8_24 = LUI.UIText.new()

	var_8_24.id = "TokensDesc"

	var_8_24:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_8_24:setText(Engine.CBBHFCGDIC("CODACCOUNT/RENAME_TOKEN_DESC"), 0)
	var_8_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_24:SetAlignment(LUI.Alignment.Left)
	var_8_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 202, _1080p * 20, _1080p * 38)
	var_8_0:addElement(var_8_24)

	var_8_0.TokensDesc = var_8_24

	local var_8_25
	local var_8_26 = LUI.UIImage.new()

	var_8_26.id = "WarningIcon"

	var_8_26:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_8_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 210, _1080p * 248, _1080p * 103, _1080p * 141)
	var_8_0:addElement(var_8_26)

	var_8_0.WarningIcon = var_8_26

	local var_8_27
	local var_8_28 = LUI.UIText.new()

	var_8_28.id = "WarningLabel"

	var_8_28:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_8_28:setText(Engine.CBBHFCGDIC("CODACCOUNT/RESTART_WARNING"), 0)
	var_8_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_28:SetAlignment(LUI.Alignment.Left)
	var_8_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 248, _1080p * 830, _1080p * 113, _1080p * 131)
	var_8_0:addElement(var_8_28)

	var_8_0.WarningLabel = var_8_28

	local function var_8_29()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_29

	local var_8_30
	local var_8_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -16
		}
	}

	var_8_14:RegisterAnimationSequence("AR", var_8_31)

	local var_8_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_8_22:RegisterAnimationSequence("AR", var_8_32)

	local var_8_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_8_24:RegisterAnimationSequence("AR", var_8_33)

	local var_8_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 107
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 137
		}
	}

	var_8_28:RegisterAnimationSequence("AR", var_8_34)

	local function var_8_35()
		var_8_14:AnimateSequence("AR")
		var_8_22:AnimateSequence("AR")
		var_8_24:AnimateSequence("AR")
		var_8_28:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_35

	local var_8_36
	local var_8_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("MENU/NEW_EMAIL"),
			child = var_8_0.Input.EditBox.Text
		}
	}

	var_8_12:RegisterAnimationSequence("Email", var_8_37)

	local var_8_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_22:RegisterAnimationSequence("Email", var_8_38)

	local var_8_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_24:RegisterAnimationSequence("Email", var_8_39)

	local var_8_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_26:RegisterAnimationSequence("Email", var_8_40)

	local var_8_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_28:RegisterAnimationSequence("Email", var_8_41)

	local function var_8_42()
		var_8_12:AnimateSequence("Email")
		var_8_22:AnimateSequence("Email")
		var_8_24:AnimateSequence("Email")
		var_8_26:AnimateSequence("Email")
		var_8_28:AnimateSequence("Email")
	end

	var_8_0._sequences.Email = var_8_42

	local var_8_43
	local var_8_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("MENU/NEW_EMAIL"),
			child = var_8_0.Input.EditBox.Text
		}
	}

	var_8_12:RegisterAnimationSequence("AREmail", var_8_44)

	local var_8_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -16
		}
	}

	var_8_14:RegisterAnimationSequence("AREmail", var_8_45)

	local var_8_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_22:RegisterAnimationSequence("AREmail", var_8_46)

	local var_8_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_24:RegisterAnimationSequence("AREmail", var_8_47)

	local var_8_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_26:RegisterAnimationSequence("AREmail", var_8_48)

	local var_8_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 107
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 137
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_28:RegisterAnimationSequence("AREmail", var_8_49)

	local function var_8_50()
		var_8_12:AnimateSequence("AREmail")
		var_8_14:AnimateSequence("AREmail")
		var_8_22:AnimateSequence("AREmail")
		var_8_24:AnimateSequence("AREmail")
		var_8_26:AnimateSequence("AREmail")
		var_8_28:AnimateSequence("AREmail")
	end

	var_8_0._sequences.AREmail = var_8_50

	var_8_4:addEventHandler("menu_create", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_8_1
		end

		ACTIONS.ScaleFullscreen(var_8_0)
	end)
	var_0_4(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("CODAccountEditPopup", CODAccountEditPopup)
LUI.FlowManager.RegisterStackPushBehaviour("CODAccountEditPopup", var_0_0)
LUI.FlowManager.RegisterStackPopBehaviour("CODAccountEditPopup", var_0_1)
LockTable(_M)
