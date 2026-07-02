module(..., package.seeall)

local var_0_0 = CoD.GameDVRDisable
local var_0_1 = CoD.GameDVREnable

local function var_0_2(arg_1_0, arg_1_1)
	assert(arg_1_0.ButtonName)

	local var_1_0 = arg_1_0.ButtonName.Text:getText()

	arg_1_0.ButtonName:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		local var_2_0 = {
			isUsername = true,
			title = var_1_0,
			confirmAction = function(arg_3_0)
				AccountRegistration.BDBAJHGFE(arg_1_1, arg_3_0)
			end
		}

		LUI.FlowManager.RequestPopupMenu(nil, "CODAccountEditPopup", true, arg_1_1, false, var_2_0, nil, true, true)
	end)
	arg_1_0:addEventHandler("AccountRenameFailure", function(arg_4_0, arg_4_1)
		local var_4_0 = {
			title = var_1_0,
			message = Engine.CBBHFCGDIC(CODACCOUNT.GetErrorString(arg_4_1.options.errorCode), arg_4_1.options.detailErrorCode)
		}

		LUI.FlowManager.RequestPopupMenu(nil, "CODAccountErrorPopup", true, arg_1_1, false, var_4_0, nil, true, true)
	end)
end

local function var_0_3(arg_5_0, arg_5_1)
	assert(arg_5_0.ButtonEmail)

	local var_5_0 = arg_5_0.ButtonEmail.Text:getText()

	arg_5_0.ButtonEmail:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		local var_6_0 = {
			isEmail = true,
			title = var_5_0,
			confirmAction = function(arg_7_0)
				AccountRegistration.CJDEJAEFGB(arg_5_1, arg_7_0)
			end
		}

		LUI.FlowManager.RequestPopupMenu(nil, "CODAccountEditPopup", true, arg_5_1, false, var_6_0, nil, true, true)
	end)
	arg_5_0:addEventHandler("ChangeEmailSuccess", function(arg_8_0, arg_8_1)
		LUI.FlowManager.RequestLeaveMenuByName("CODAccountEditPopup", true, true)

		local var_8_0 = {
			title = Engine.CBBHFCGDIC("MENU/EMAIL_CHANGE_SUCCESS_TITLE"),
			message = Engine.CBBHFCGDIC("MENU/EMAIL_CHANGE_SUCCESS_DESC")
		}

		LUI.FlowManager.RequestPopupMenu(nil, "CODAccountSuccessPopup", true, arg_5_1, false, var_8_0, nil, true, true)
	end)
	arg_5_0:addEventHandler("ChangeEmailFailure", function(arg_9_0, arg_9_1)
		local var_9_0 = {
			title = var_5_0,
			message = Engine.CBBHFCGDIC(CODACCOUNT.GetErrorString(arg_9_1.options.errorCode), arg_9_1.options.detailErrorCode)
		}

		LUI.FlowManager.RequestPopupMenu(nil, "CODAccountErrorPopup", true, arg_5_1, false, var_9_0, nil, true, true)
	end)
end

local function var_0_4(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = AccountRegistration.ECFGACAABI(arg_10_1)

	if var_10_0.success then
		arg_10_0.DisplayName:setText(CODACCOUNT.FilterDisplayName(var_10_0.username))
		arg_10_0.ActivisionID:setText(var_10_0.username)

		if var_10_0.email and #var_10_0.email > 0 then
			arg_10_0.Email:setText(var_10_0.email)
		else
			arg_10_0.EmailHeader:SetAlpha(0)
			arg_10_0.Email:SetAlpha(0)
		end
	end

	var_0_2(arg_10_0, arg_10_1)
	var_0_3(arg_10_0, arg_10_1)

	if CODACCOUNT.ForceAnonymousAccount() then
		ACTIONS.AnimateSequence(arg_10_0, "Anonymous")
		arg_10_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CODACCOUNT/ANONYMOUS_ACCOUNT_SETTINGS"))
	else
		arg_10_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CODACCOUNT/SETTINGS"))
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_10_0, "Arabic")
	end

	if CONDITIONS.IsPS4() then
		arg_10_0.Unlink:setText(Engine.CBBHFCGDIC("CODACCOUNT/UNLINK_PSN"))
	elseif CONDITIONS.IsXboxOne() then
		arg_10_0.Unlink:setText(Engine.CBBHFCGDIC("CODACCOUNT/UNLINK_XBOX"))
	elseif CONDITIONS.IsBattleNet() then
		arg_10_0.Unlink:setText(Engine.CBBHFCGDIC("CODACCOUNT/UNLINK_BATTLENET"))
	end

	arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT"),
		container = arg_10_0.Prompts
	})
	arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		button_ref = "button_secondary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK"),
		container = arg_10_0.Prompts
	})
end

function CODAccountSettings(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIVerticalNavigator.new()

	var_11_0.id = "CODAccountSettings"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	var_11_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_11_1
	})
	var_11_0.HelperBar.id = "HelperBar"

	var_11_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_11_0.HelperBar:setPriority(10)
	var_11_0:addElement(var_11_0.HelperBar)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("GenericPopupFrame", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "GenericPopupFrame"

	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.GenericPopupFrame = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "Image"

	var_11_6:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_11_6:SetAlpha(0.25, 0)
	var_11_6:setImage(RegisterMaterial("mm_COD_account_icon"), 0)
	var_11_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -658, _1080p * -376, _1080p * -124, _1080p * 204)
	var_11_0:addElement(var_11_6)

	var_11_0.Image = var_11_6

	local var_11_7
	local var_11_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_11_1
	})

	var_11_8.id = "MenuTitle"

	var_11_8.MenuTitle:setText(Engine.CBBHFCGDIC("CODACCOUNT/SETTINGS"), 0)
	var_11_8.Line:SetLeft(0, 0)
	var_11_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 169, _1080p * -225, _1080p * -121)
	var_11_0:addElement(var_11_8)

	var_11_0.MenuTitle = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIImage.new()

	var_11_10.id = "Line"

	var_11_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_11_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * -300, _1080p * -124, _1080p * -124)
	var_11_0:addElement(var_11_10)

	var_11_0.Line = var_11_10

	local var_11_11
	local var_11_12 = LUI.UIText.new()

	var_11_12.id = "DisplayNameHeader"

	var_11_12:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_11_12:setText(Engine.CBBHFCGDIC("CODACCOUNT/MW_DISPLAY_NAME"), 0)
	var_11_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_12:SetAlignment(LUI.Alignment.Left)
	var_11_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 282, _1080p * -56, _1080p * -38)
	var_11_0:addElement(var_11_12)

	var_11_0.DisplayNameHeader = var_11_12

	local var_11_13
	local var_11_14 = LUI.UIText.new()

	var_11_14.id = "DisplayName"

	var_11_14:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_11_14:setText("", 0)
	var_11_14:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_11_14:SetAlignment(LUI.Alignment.Left)
	var_11_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 282, _1080p * -28, _1080p * -12)
	var_11_0:addElement(var_11_14)

	var_11_0.DisplayName = var_11_14

	local var_11_15
	local var_11_16 = LUI.UIText.new()

	var_11_16.id = "ActivisionIDHeader"

	var_11_16:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_11_16:setText(Engine.CBBHFCGDIC("CODACCOUNT/ACTIVISION_ID"), 0)
	var_11_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_16:SetAlignment(LUI.Alignment.Left)
	var_11_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 282, _1080p * -4, _1080p * 14)
	var_11_0:addElement(var_11_16)

	var_11_0.ActivisionIDHeader = var_11_16

	local var_11_17
	local var_11_18 = LUI.UIText.new()

	var_11_18.id = "ActivisionID"

	var_11_18:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_11_18:setText("", 0)
	var_11_18:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_11_18:SetAlignment(LUI.Alignment.Left)
	var_11_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 282, _1080p * 24, _1080p * 40)
	var_11_0:addElement(var_11_18)

	var_11_0.ActivisionID = var_11_18

	local var_11_19
	local var_11_20 = LUI.UIText.new()

	var_11_20.id = "EmailHeader"

	var_11_20:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_11_20:setText(Engine.CBBHFCGDIC("CODACCOUNT/ASSOCIATED_EMAIL"), 0)
	var_11_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_20:SetAlignment(LUI.Alignment.Left)
	var_11_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 282, _1080p * 48, _1080p * 66)
	var_11_0:addElement(var_11_20)

	var_11_0.EmailHeader = var_11_20

	local var_11_21
	local var_11_22 = LUI.UIText.new()

	var_11_22.id = "Email"

	var_11_22:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_11_22:setText("", 0)
	var_11_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_22:SetAlignment(LUI.Alignment.Left)
	var_11_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 282, _1080p * 74, _1080p * 92)
	var_11_0:addElement(var_11_22)

	var_11_0.Email = var_11_22

	local var_11_23
	local var_11_24 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_11_1
	})

	var_11_24.id = "ButtonName"

	var_11_24.Text:SetLeft(_1080p * 20, 0)
	var_11_24.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CODACCOUNT/CHANGE_NAME")), 0)
	var_11_24.Text:SetAlignment(LUI.Alignment.Left)
	var_11_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 202, _1080p * 104, _1080p * 142)
	var_11_0:addElement(var_11_24)

	var_11_0.ButtonName = var_11_24

	local var_11_25
	local var_11_26 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_11_1
	})

	var_11_26.id = "ButtonEmail"

	var_11_26.Text:SetLeft(_1080p * 20, 0)
	var_11_26.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("CODACCOUNT/CHANGE_EMAIL")), 0)
	var_11_26.Text:SetAlignment(LUI.Alignment.Left)
	var_11_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -218, _1080p * 202, _1080p * 148, _1080p * 186)
	var_11_0:addElement(var_11_26)

	var_11_0.ButtonEmail = var_11_26

	local var_11_27
	local var_11_28 = LUI.UIText.new()

	var_11_28.id = "TermsOfUse"

	var_11_28:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_11_28:setText(Engine.CBBHFCGDIC("CODACCOUNT/TERMS_OF_USE_LINK"), 0)
	var_11_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_28:SetAlignment(LUI.Alignment.Left)
	var_11_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 302, _1080p * 830, _1080p * 104, _1080p * 122)
	var_11_0:addElement(var_11_28)

	var_11_0.TermsOfUse = var_11_28

	local var_11_29
	local var_11_30 = LUI.UIText.new()

	var_11_30.id = "PrivacyPolicy"

	var_11_30:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_11_30:setText(Engine.CBBHFCGDIC("CODACCOUNT/PRIVACY_POLICY_LINK"), 0)
	var_11_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_30:SetAlignment(LUI.Alignment.Left)
	var_11_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 302, _1080p * 830, _1080p * 127, _1080p * 145)
	var_11_0:addElement(var_11_30)

	var_11_0.PrivacyPolicy = var_11_30

	local var_11_31
	local var_11_32 = LUI.UIText.new()

	var_11_32.id = "Unlink"

	var_11_32:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_11_32:setText(Engine.CBBHFCGDIC("CODACCOUNT/UNLINK_LINK"), 0)
	var_11_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_32:SetAlignment(LUI.Alignment.Left)
	var_11_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 302, _1080p * 830, _1080p * -56, _1080p * -38)
	var_11_0:addElement(var_11_32)

	var_11_0.Unlink = var_11_32

	local var_11_33
	local var_11_34 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_11_1
	})

	var_11_34.id = "Prompts"

	if CONDITIONS.AlwaysFalse(var_11_0) then
		var_11_34.Label:setText("Prompts", 0)
	end

	var_11_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -663, _1080p * 246, _1080p * 277)
	var_11_0:addElement(var_11_34)

	var_11_0.Prompts = var_11_34

	local function var_11_35()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_35

	local var_11_36
	local var_11_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_11_12:RegisterAnimationSequence("Arabic", var_11_37)

	local var_11_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_11_14:RegisterAnimationSequence("Arabic", var_11_38)

	local var_11_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_11_16:RegisterAnimationSequence("Arabic", var_11_39)

	local var_11_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_11_18:RegisterAnimationSequence("Arabic", var_11_40)

	local var_11_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_11_20:RegisterAnimationSequence("Arabic", var_11_41)

	local var_11_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 62
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_11_22:RegisterAnimationSequence("Arabic", var_11_42)

	local var_11_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 115
		}
	}

	var_11_28:RegisterAnimationSequence("Arabic", var_11_43)

	local var_11_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 115
		}
	}

	var_11_30:RegisterAnimationSequence("Arabic", var_11_44)

	local var_11_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -26
		}
	}

	var_11_32:RegisterAnimationSequence("Arabic", var_11_45)

	local function var_11_46()
		var_11_12:AnimateSequence("Arabic")
		var_11_14:AnimateSequence("Arabic")
		var_11_16:AnimateSequence("Arabic")
		var_11_18:AnimateSequence("Arabic")
		var_11_20:AnimateSequence("Arabic")
		var_11_22:AnimateSequence("Arabic")
		var_11_28:AnimateSequence("Arabic")
		var_11_30:AnimateSequence("Arabic")
		var_11_32:AnimateSequence("Arabic")
	end

	var_11_0._sequences.Arabic = var_11_46

	local var_11_47
	local var_11_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("CODACCOUNT/ANONYMOUS_ACCOUNT_SETTINGS"),
			child = var_11_0.MenuTitle.MenuTitle
		}
	}

	var_11_8:RegisterAnimationSequence("Anonymous", var_11_48)

	local var_11_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("Anonymous", var_11_49)

	local var_11_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("Anonymous", var_11_50)

	local var_11_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_20:RegisterAnimationSequence("Anonymous", var_11_51)

	local var_11_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_22:RegisterAnimationSequence("Anonymous", var_11_52)

	local var_11_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_26:RegisterAnimationSequence("Anonymous", var_11_53)

	local var_11_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_28:RegisterAnimationSequence("Anonymous", var_11_54)

	local var_11_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_30:RegisterAnimationSequence("Anonymous", var_11_55)

	local var_11_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_32:RegisterAnimationSequence("Anonymous", var_11_56)

	local function var_11_57()
		var_11_8:AnimateSequence("Anonymous")
		var_11_16:AnimateSequence("Anonymous")
		var_11_18:AnimateSequence("Anonymous")
		var_11_20:AnimateSequence("Anonymous")
		var_11_22:AnimateSequence("Anonymous")
		var_11_26:AnimateSequence("Anonymous")
		var_11_28:AnimateSequence("Anonymous")
		var_11_30:AnimateSequence("Anonymous")
		var_11_32:AnimateSequence("Anonymous")
	end

	var_11_0._sequences.Anonymous = var_11_57

	var_11_4:addEventHandler("menu_create", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_11_1
		end

		ACTIONS.ScaleFullscreen(var_11_0)
	end)

	local var_11_58 = LUI.UIBindButton.new()

	var_11_58.id = "selfBindButton"

	var_11_0:addElement(var_11_58)

	var_11_0.bindButton = var_11_58

	var_11_0.bindButton:addEventHandler("button_secondary", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_11_1
		end

		ACTIONS.LeaveMenu(var_11_0)
	end)
	var_0_4(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("CODAccountSettings", CODAccountSettings)
LUI.FlowManager.RegisterStackPushBehaviour("CODAccountSettings", var_0_0)
LUI.FlowManager.RegisterStackPopBehaviour("CODAccountSettings", var_0_1)
LockTable(_M)
