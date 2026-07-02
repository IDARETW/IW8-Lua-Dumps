module(..., package.seeall)

local var_0_0 = CoD.GameDVRDisable
local var_0_1 = CoD.GameDVREnable

local function var_0_2(arg_1_0, arg_1_1, arg_1_2)
	arg_1_1.isValid = (function()
		REGISTRATION.UpdateUserName(arg_1_2)

		local var_2_0, var_2_1 = REGISTRATION.CheckIsPassing(REGISTRATION.UserNameRules)

		if arg_1_1.isDefault then
			var_2_1 = "CODACCOUNT/PLEASE_COMPLETE"
		end

		if var_2_1 ~= nil then
			arg_1_0.ErrorMessage:setText(Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_LOCALIZED", var_2_1))
		end

		return var_2_0 and not arg_1_1.isDefault
	end)()

	return arg_1_1.isValid
end

local function var_0_3(arg_3_0)
	assert(arg_3_0.ErrorMessage)

	local var_3_0 = arg_3_0.Input:GetTextElement()
	local var_3_1 = arg_3_0.Input:GetEditText()

	if not var_0_2(arg_3_0, var_3_0, var_3_1) then
		ACTIONS.AnimateSequence(arg_3_0.Input, "Invalid")
		arg_3_0.ErrorMessage:SetAlpha(1)

		return false
	else
		ACTIONS.AnimateSequence(arg_3_0.Input, "Valid")
		arg_3_0.ErrorMessage:SetAlpha(0)
	end

	return true
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_2.confirmAction)
	arg_4_0.ButtonConfirm:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		if var_0_3(arg_4_0) then
			arg_4_2.confirmAction(arg_4_1, arg_4_0.Input:GetEditText())
		end
	end)

	local var_4_0 = AccountRegistration.ECFGACAABI(arg_4_1)

	if var_4_0.success then
		arg_4_0.CurrentName:setText(CODACCOUNT.FilterDisplayName(var_4_0.username))
	else
		arg_4_0.CurrentName:SetAlpha(0)
	end

	arg_4_0:addEventHandler("AccountRenameFailure", function(arg_6_0, arg_6_1)
		local var_6_0 = {
			title = Engine.CBBHFCGDIC("MENU/ERROR"),
			message = Engine.CBBHFCGDIC(CODACCOUNT.GetErrorString(arg_6_1.options.errorCode), arg_6_1.options.detailErrorCode)
		}

		LUI.FlowManager.RequestPopupMenu(nil, "CODAccountErrorPopup", true, arg_4_1, false, var_6_0, nil, true, true)
	end)

	local var_4_1 = {
		autoSetActiveOnCreation = true,
		alwaysSendTypingEvents = true,
		maxInputStringLength = REGISTRATION.UserNameRulesConstants.MAX_GLYPHS
	}

	arg_4_0.Input:Setup(arg_4_1, var_4_1)
end

function CODAccountForceRenamePopup(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIVerticalNavigator.new()

	var_7_0.id = "CODAccountForceRenamePopup"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	var_7_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_7_1
	})
	var_7_0.HelperBar.id = "HelperBar"

	var_7_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_7_0.HelperBar:setPriority(10)
	var_7_0:addElement(var_7_0.HelperBar)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("GenericPopupFrame", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "GenericPopupFrame"

	var_7_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.GenericPopupFrame = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "Image"

	var_7_6:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_7_6:SetAlpha(0.25, 0)
	var_7_6:setImage(RegisterMaterial("mm_COD_account_icon"), 0)
	var_7_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -658, _1080p * -376, _1080p * -124, _1080p * 204)
	var_7_0:addElement(var_7_6)

	var_7_0.Image = var_7_6

	local var_7_7
	local var_7_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_7_1
	})

	var_7_8.id = "MenuTitle"

	var_7_8.MenuTitle:setText("", 0)
	var_7_8.Line:SetLeft(0, 0)
	var_7_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 169, _1080p * -225, _1080p * -121)
	var_7_0:addElement(var_7_8)

	var_7_0.MenuTitle = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIImage.new()

	var_7_10.id = "Line"

	var_7_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_7_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * -300, _1080p * -124, _1080p * -124)
	var_7_0:addElement(var_7_10)

	var_7_0.Line = var_7_10

	local var_7_11
	local var_7_12 = MenuBuilder.BuildRegisteredType("CODAccountEditBox", {
		controllerIndex = var_7_1
	})

	var_7_12.id = "Input"

	var_7_12.BackgroundDarkener:SetAlpha(0.5, 0)
	var_7_12.EditBox.Text:setText(Engine.CBBHFCGDIC("MENU/NEW_NAME"), 0)
	var_7_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 412, _1080p * -62, _1080p * -34)
	var_7_0:addElement(var_7_12)

	var_7_0.Input = var_7_12

	local var_7_13
	local var_7_14 = LUI.UIText.new()

	var_7_14.id = "ErrorMessage"

	var_7_14:SetRGBFromTable(SWATCHES.Registration.fail, 0)
	var_7_14:setText("", 0)
	var_7_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_14:SetAlignment(LUI.Alignment.Left)
	var_7_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 412, _1080p * -46, _1080p * -28)
	var_7_0:addElement(var_7_14)

	var_7_0.ErrorMessage = var_7_14

	local var_7_15
	local var_7_16 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_16.id = "ButtonConfirm"

	var_7_16.BackgroundDarkener:SetAlpha(0.5, 0)
	var_7_16.Text:SetLeft(_1080p * 20, 0)
	var_7_16.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CODACCOUNT/CONFIRM")), 0)
	var_7_16.Text:SetAlignment(LUI.Alignment.Left)
	var_7_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 202, _1080p * 124, _1080p * 162)
	var_7_0:addElement(var_7_16)

	var_7_0.ButtonConfirm = var_7_16

	local var_7_17
	local var_7_18 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_7_1
	})

	var_7_18.id = "Prompts"

	if CONDITIONS.AlwaysFalse() then
		var_7_18.Label:setText("Prompts", 0)
	end

	var_7_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -663, _1080p * 246, _1080p * 277)
	var_7_0:addElement(var_7_18)

	var_7_0.Prompts = var_7_18

	local var_7_19
	local var_7_20 = LUI.UIText.new()

	var_7_20.id = "CurrentName"

	var_7_20:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_7_20:setText("", 0)
	var_7_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_20:SetAlignment(LUI.Alignment.Left)
	var_7_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -214, _1080p * 206, _1080p * 5, _1080p * 23)
	var_7_0:addElement(var_7_20)

	var_7_0.CurrentName = var_7_20

	local var_7_21
	local var_7_22 = LUI.UIText.new()

	var_7_22.id = "WarningMessage"

	var_7_22:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_7_22:setText(Engine.CBBHFCGDIC("CODACCOUNT/USERNAME_PROFANITY"), 0)
	var_7_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_22:SetAlignment(LUI.Alignment.Left)
	var_7_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 202, _1080p * 48, _1080p * 66)
	var_7_0:addElement(var_7_22)

	var_7_0.WarningMessage = var_7_22

	local var_7_23
	local var_7_24 = LUI.UIImage.new()

	var_7_24.id = "WarningIcon"

	var_7_24:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_7_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 206, _1080p * 244, _1080p * 129, _1080p * 167)
	var_7_0:addElement(var_7_24)

	var_7_0.WarningIcon = var_7_24

	local var_7_25
	local var_7_26 = LUI.UIText.new()

	var_7_26.id = "WarningLabel"

	var_7_26:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_7_26:setText(Engine.CBBHFCGDIC("CODACCOUNT/RESTART_WARNING"), 0)
	var_7_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_26:SetAlignment(LUI.Alignment.Left)
	var_7_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 244, _1080p * 826, _1080p * 139, _1080p * 157)
	var_7_0:addElement(var_7_26)

	var_7_0.WarningLabel = var_7_26

	local var_7_27
	local var_7_28 = LUI.UIText.new()

	var_7_28.id = "DisplayName"

	var_7_28:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_7_28:setText(Engine.CBBHFCGDIC("CODACCOUNT/DISPLAY_NAME"), 0)
	var_7_28:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_28:SetAlignment(LUI.Alignment.Left)
	var_7_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 202, _1080p * -22, _1080p * -4)
	var_7_0:addElement(var_7_28)

	var_7_0.DisplayName = var_7_28

	local var_7_29
	local var_7_30 = LUI.UIText.new()

	var_7_30.id = "Title"

	var_7_30:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_7_30:setText(Engine.CBBHFCGDIC("CODACCOUNT/CHANGE_NAME"), 0)
	var_7_30:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_30:SetAlignment(LUI.Alignment.Left)
	var_7_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, 0, _1080p * -109, _1080p * -85)
	var_7_0:addElement(var_7_30)

	var_7_0.Title = var_7_30

	local function var_7_31()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_31

	local var_7_32
	local var_7_33 = {
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

	var_7_14:RegisterAnimationSequence("AR", var_7_33)

	local var_7_34 = {
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

	var_7_20:RegisterAnimationSequence("AR", var_7_34)

	local var_7_35 = {
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

	var_7_22:RegisterAnimationSequence("AR", var_7_35)

	local var_7_36 = {
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

	var_7_26:RegisterAnimationSequence("AR", var_7_36)

	local function var_7_37()
		var_7_14:AnimateSequence("AR")
		var_7_20:AnimateSequence("AR")
		var_7_22:AnimateSequence("AR")
		var_7_26:AnimateSequence("AR")
	end

	var_7_0._sequences.AR = var_7_37

	local var_7_38
	local var_7_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("MENU/NEW_EMAIL"),
			child = var_7_0.Input.EditBox.Text
		}
	}

	var_7_12:RegisterAnimationSequence("Email", var_7_39)

	local var_7_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_20:RegisterAnimationSequence("Email", var_7_40)

	local var_7_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_22:RegisterAnimationSequence("Email", var_7_41)

	local var_7_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("Email", var_7_42)

	local var_7_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_26:RegisterAnimationSequence("Email", var_7_43)

	local function var_7_44()
		var_7_12:AnimateSequence("Email")
		var_7_20:AnimateSequence("Email")
		var_7_22:AnimateSequence("Email")
		var_7_24:AnimateSequence("Email")
		var_7_26:AnimateSequence("Email")
	end

	var_7_0._sequences.Email = var_7_44

	local var_7_45
	local var_7_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("MENU/NEW_EMAIL"),
			child = var_7_0.Input.EditBox.Text
		}
	}

	var_7_12:RegisterAnimationSequence("AREmail", var_7_46)

	local var_7_47 = {
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

	var_7_14:RegisterAnimationSequence("AREmail", var_7_47)

	local var_7_48 = {
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

	var_7_20:RegisterAnimationSequence("AREmail", var_7_48)

	local var_7_49 = {
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

	var_7_22:RegisterAnimationSequence("AREmail", var_7_49)

	local var_7_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("AREmail", var_7_50)

	local var_7_51 = {
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

	var_7_26:RegisterAnimationSequence("AREmail", var_7_51)

	local function var_7_52()
		var_7_12:AnimateSequence("AREmail")
		var_7_14:AnimateSequence("AREmail")
		var_7_20:AnimateSequence("AREmail")
		var_7_22:AnimateSequence("AREmail")
		var_7_24:AnimateSequence("AREmail")
		var_7_26:AnimateSequence("AREmail")
	end

	var_7_0._sequences.AREmail = var_7_52

	var_7_4:addEventHandler("menu_create", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_7_1
		end

		ACTIONS.ScaleFullscreen(var_7_0)
	end)
	var_0_4(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("CODAccountForceRenamePopup", CODAccountForceRenamePopup)
LUI.FlowManager.RegisterStackPushBehaviour("CODAccountForceRenamePopup", var_0_0)
LUI.FlowManager.RegisterStackPopBehaviour("CODAccountForceRenamePopup", var_0_1)
LockTable(_M)
