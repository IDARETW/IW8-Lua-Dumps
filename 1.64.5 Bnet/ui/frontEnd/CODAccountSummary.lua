module(..., package.seeall)

local var_0_0 = CoD.GameDVRDisable
local var_0_1 = CoD.GameDVREnable

local function var_0_2(arg_1_0, arg_1_1)
	arg_1_0.DisplayName:setText(CODACCOUNT.FilterDisplayName(arg_1_1.username))
	arg_1_0.ActivisionID:setText(arg_1_1.username)

	if arg_1_1.email and #arg_1_1.email > 0 then
		arg_1_0.Email:setText(arg_1_1.email)
	else
		arg_1_0.EmailHeader:SetAlpha(0)
		arg_1_0.Email:SetAlpha(0)
	end
end

local function var_0_3(arg_2_0, arg_2_1)
	if arg_2_0._infoShouldBeRevealed then
		if arg_2_1.success then
			arg_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				replaceTop = true,
				button_ref = "button_alt2",
				helper_text = Engine.CBBHFCGDIC("CODACCOUNT/HIDE_INFO_PROMPT"),
				container = arg_2_0.Prompts
			})

			local var_2_0 = IsLanguageArabic() and "RevealInfoAR" or "RevealInfo"

			ACTIONS.AnimateSequence(arg_2_0, var_2_0)
			var_0_2(arg_2_0, arg_2_1)
		end
	else
		arg_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			replaceTop = true,
			button_ref = "button_alt2",
			helper_text = Engine.CBBHFCGDIC("CODACCOUNT/REVEAL_INFO_PROMPT"),
			container = arg_2_0.Prompts
		})

		local var_2_1 = IsLanguageArabic() and "AR" or "HideInfo"

		ACTIONS.AnimateSequence(arg_2_0, var_2_1)
	end

	arg_2_0._infoShouldBeRevealed = not arg_2_0._infoShouldBeRevealed
end

local function var_0_4(arg_3_0, arg_3_1)
	arg_3_0.BindButton = LUI.UIBindButton.new()
	arg_3_0.BindButton.id = "BindButton"

	arg_3_0:addElement(arg_3_0.BindButton)
	arg_3_0.BindButton:addEventHandler("button_alt1", function(arg_4_0, arg_4_1)
		LUI.FlowManager.RequestPopupMenu(nil, "CODAccountSettings", true, arg_4_1.controller, false, arg_3_1, nil, true, true)
	end)
	arg_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		button_ref = "button_alt1",
		helper_text = Engine.CBBHFCGDIC("CODACCOUNT/SETTINGS_PROMPT"),
		container = arg_3_0.Prompts
	})
	arg_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		button_ref = "button_alt2",
		helper_text = Engine.CBBHFCGDIC("CODACCOUNT/REVEAL_INFO_PROMPT"),
		container = arg_3_0.Prompts
	})
	arg_3_0.BindButton:addEventHandler("button_alt2", function(arg_5_0, arg_5_1)
		var_0_3(arg_3_0, arg_3_1.info)
	end)
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CODACCOUNT/SUMMARY"))
	arg_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT"),
		container = arg_6_0.Prompts
	})

	arg_6_0._infoShouldBeRevealed = true

	local var_6_0 = Engine.CBBHFCGDIC("CODACCOUNT/HIDDEN_STRING")

	arg_6_0.DisplayName:setText(var_6_0)
	arg_6_0.Email:setText(var_6_0)
	arg_6_0.ActivisionID:setText(var_6_0)

	arg_6_2.info = AccountRegistration.ECFGACAABI(arg_6_1)

	local var_6_1 = AccountRegistration.CEDFJJCJJD(arg_6_1)

	if var_6_1 then
		var_0_4(arg_6_0, arg_6_2)
	else
		local var_6_2 = IsLanguageArabic() and "RevealInfoAR" or "RevealInfo"

		ACTIONS.AnimateSequence(arg_6_0, var_6_2)
		var_0_2(arg_6_0, arg_6_2.info)
	end

	if arg_6_2.okButtonHandler then
		arg_6_0.ButtonOK:addEventHandler("button_action", arg_6_2.okButtonHandler)
	else
		arg_6_0.ButtonOK:addEventHandler("button_action", function(arg_7_0, arg_7_1)
			LUI.FlowManager.RequestLeaveMenu(arg_6_0)
		end)
	end

	LUI.TextChat.SetupMenuForNoChat(arg_6_0)
	LAYOUT.AddAspectRatioFadeFrame(arg_6_0, arg_6_1)
	ACTIONS.ScaleFullscreen(arg_6_0.Darkener)

	if IsLanguageArabic() and var_6_1 then
		ACTIONS.AnimateSequence(arg_6_0, "AR")
	end

	arg_6_0.isQuickAccessShortcutsDisabled = true
end

function CODAccountSummary(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIVerticalNavigator.new()

	var_8_0.id = "CODAccountSummary"
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
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Darkener"

	var_8_4:SetRGBFromInt(0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.Darkener = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("GenericPopupFrame", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "GenericPopupFrame"

	var_8_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_6)

	var_8_0.GenericPopupFrame = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIImage.new()

	var_8_8.id = "Image"

	var_8_8:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_8_8:SetAlpha(0.25, 0)
	var_8_8:setImage(RegisterMaterial("mm_COD_account_icon"), 0)
	var_8_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 377, _1080p * 658, _1080p * -170, _1080p * 158)
	var_8_0:addElement(var_8_8)

	var_8_0.Image = var_8_8

	local var_8_9
	local var_8_10 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_8_1
	})

	var_8_10.id = "MenuTitle"

	var_8_10.MenuTitle:setText(Engine.CBBHFCGDIC("CODACCOUNT/SUMMARY"), 0)
	var_8_10.Line:SetLeft(0, 0)
	var_8_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 169, _1080p * -225, _1080p * -121)
	var_8_0:addElement(var_8_10)

	var_8_0.MenuTitle = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIImage.new()

	var_8_12.id = "Line"

	var_8_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_8_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * -300, _1080p * -124, _1080p * -124)
	var_8_0:addElement(var_8_12)

	var_8_0.Line = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIText.new()

	var_8_14.id = "DisplayNameHeader"

	var_8_14:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_8_14:setText(Engine.CBBHFCGDIC("CODACCOUNT/MW_DISPLAY_NAME"), 0)
	var_8_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_14:SetAlignment(LUI.Alignment.Left)
	var_8_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -263, _1080p * -64, _1080p * -40)
	var_8_0:addElement(var_8_14)

	var_8_0.DisplayNameHeader = var_8_14

	local var_8_15
	local var_8_16 = LUI.UIText.new()

	var_8_16.id = "DisplayName"

	var_8_16:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_8_16:setText("", 0)
	var_8_16:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_8_16:SetAlignment(LUI.Alignment.Left)
	var_8_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -263, _1080p * -36, _1080p * -14)
	var_8_0:addElement(var_8_16)

	var_8_0.DisplayName = var_8_16

	local var_8_17
	local var_8_18 = LUI.UIText.new()

	var_8_18.id = "ActivisionIDHeader"

	var_8_18:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_8_18:setText(Engine.CBBHFCGDIC("CODACCOUNT/ACTIVISION_ID"), 0)
	var_8_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_18:SetAlignment(LUI.Alignment.Left)
	var_8_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -263, _1080p * -12, _1080p * 12)
	var_8_0:addElement(var_8_18)

	var_8_0.ActivisionIDHeader = var_8_18

	local var_8_19
	local var_8_20 = LUI.UIText.new()

	var_8_20.id = "ActivisionID"

	var_8_20:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_8_20:setText("", 0)
	var_8_20:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_8_20:SetAlignment(LUI.Alignment.Left)
	var_8_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -263, _1080p * 19, _1080p * 41)
	var_8_0:addElement(var_8_20)

	var_8_0.ActivisionID = var_8_20

	local var_8_21
	local var_8_22 = LUI.UIText.new()

	var_8_22.id = "EmailHeader"

	var_8_22:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_8_22:setText(Engine.CBBHFCGDIC("CODACCOUNT/ASSOCIATED_EMAIL"), 0)
	var_8_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_22:SetAlignment(LUI.Alignment.Left)
	var_8_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -263, _1080p * 43, _1080p * 67)
	var_8_0:addElement(var_8_22)

	var_8_0.EmailHeader = var_8_22

	local var_8_23
	local var_8_24 = LUI.UIText.new()

	var_8_24.id = "Email"

	var_8_24:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_8_24:setText("", 0)
	var_8_24:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_8_24:SetAlignment(LUI.Alignment.Left)
	var_8_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -263, _1080p * 70, _1080p * 92)
	var_8_0:addElement(var_8_24)

	var_8_0.Email = var_8_24

	local var_8_25
	local var_8_26 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_8_1
	})

	var_8_26.id = "ButtonOK"

	var_8_26.Text:SetLeft(_1080p * 20, 0)
	var_8_26.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/OK")), 0)
	var_8_26.Text:SetAlignment(LUI.Alignment.Left)
	var_8_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -343, _1080p * 139, _1080p * 177)
	var_8_0:addElement(var_8_26)

	var_8_0.ButtonOK = var_8_26

	local var_8_27
	local var_8_28 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_8_1
	})

	var_8_28.id = "Prompts"

	var_8_28:SetRGBFromTable(SWATCHES.buttonHelper.helperText, 0)

	if CONDITIONS.AlwaysFalse() then
		var_8_28.Label:setText("ButtonPrompts", 0)
	end

	var_8_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -663, _1080p * 246, _1080p * 277)
	var_8_0:addElement(var_8_28)

	var_8_0.Prompts = var_8_28

	local var_8_29
	local var_8_30 = LUI.UIText.new()

	var_8_30.id = "AddFriendsMessage"

	var_8_30:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_8_30:setText(Engine.CBBHFCGDIC("CODACCOUNT/ADD_CROSSPLAY_FRIENDS_MSG"), 0)
	var_8_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_30:SetAlignment(LUI.Alignment.Left)
	var_8_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -23, _1080p * 96, _1080p * 120)
	var_8_0:addElement(var_8_30)

	var_8_0.AddFriendsMessage = var_8_30

	local function var_8_31()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_31

	local var_8_32
	local var_8_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -61
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -90
		}
	}

	var_8_14:RegisterAnimationSequence("AR", var_8_33)

	local var_8_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -61
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("CODACCOUNT/HIDDEN_STRING")
		}
	}

	var_8_16:RegisterAnimationSequence("AR", var_8_34)

	local var_8_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -31
		}
	}

	var_8_18:RegisterAnimationSequence("AR", var_8_35)

	local var_8_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("CODACCOUNT/HIDDEN_STRING")
		}
	}

	var_8_20:RegisterAnimationSequence("AR", var_8_36)

	local var_8_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 59
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 29
		}
	}

	var_8_22:RegisterAnimationSequence("AR", var_8_37)

	local var_8_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("CODACCOUNT/HIDDEN_STRING")
		}
	}

	var_8_24:RegisterAnimationSequence("AR", var_8_38)

	local var_8_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 290
		}
	}

	var_8_26:RegisterAnimationSequence("AR", var_8_39)

	local var_8_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 91
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 121
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_8_30:RegisterAnimationSequence("AR", var_8_40)

	local function var_8_41()
		var_8_14:AnimateSequence("AR")
		var_8_16:AnimateSequence("AR")
		var_8_18:AnimateSequence("AR")
		var_8_20:AnimateSequence("AR")
		var_8_22:AnimateSequence("AR")
		var_8_24:AnimateSequence("AR")
		var_8_26:AnimateSequence("AR")
		var_8_30:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_41

	local function var_8_42()
		return
	end

	var_8_0._sequences.RevealInfo = var_8_42

	local function var_8_43()
		return
	end

	var_8_0._sequences.RevealInfoAR = var_8_43

	local var_8_44
	local var_8_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("CODACCOUNT/HIDDEN_STRING")
		}
	}

	var_8_16:RegisterAnimationSequence("HideInfo", var_8_45)

	local var_8_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("CODACCOUNT/HIDDEN_STRING")
		}
	}

	var_8_20:RegisterAnimationSequence("HideInfo", var_8_46)

	local var_8_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("CODACCOUNT/HIDDEN_STRING")
		}
	}

	var_8_24:RegisterAnimationSequence("HideInfo", var_8_47)

	local function var_8_48()
		var_8_16:AnimateSequence("HideInfo")
		var_8_20:AnimateSequence("HideInfo")
		var_8_24:AnimateSequence("HideInfo")
	end

	var_8_0._sequences.HideInfo = var_8_48

	var_0_5(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("CODAccountSummary", CODAccountSummary)
LUI.FlowManager.RegisterStackPushBehaviour("CODAccountSummary", var_0_0)
LUI.FlowManager.RegisterStackPopBehaviour("CODAccountSummary", var_0_1)
LockTable(_M)
