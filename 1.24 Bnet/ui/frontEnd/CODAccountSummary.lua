module(..., package.seeall)

local var_0_0 = CoD.GameDVRDisable
local var_0_1 = CoD.GameDVREnable

local function var_0_2(arg_1_0, arg_1_1)
	arg_1_0.BindButton = LUI.UIBindButton.new()
	arg_1_0.BindButton.id = "BindButton"

	arg_1_0:addElement(arg_1_0.BindButton)
	arg_1_0.BindButton:addEventHandler("button_alt1", function(arg_2_0, arg_2_1)
		LUI.FlowManager.RequestPopupMenu(nil, "CODAccountSettings", true, arg_2_1.controller, false, arg_1_1, nil, true, true)
	end)
	arg_1_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		button_ref = "button_alt1",
		helper_text = Engine.CBBHFCGDIC("CODACCOUNT/SETTINGS_PROMPT"),
		container = arg_1_0.Prompts
	})
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CODACCOUNT/SUMMARY"))
	arg_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT"),
		container = arg_3_0.Prompts
	})

	local var_3_0 = AccountRegistration.ECFGACAABI(arg_3_1)
	local var_3_1 = AccountRegistration.CEDFJJCJJD(arg_3_1)

	if var_3_0.success then
		arg_3_0.DisplayName:setText(CODACCOUNT.FilterDisplayName(var_3_0.username))
		arg_3_0.ActivisionID:setText(var_3_0.username)

		if var_3_0.email and #var_3_0.email > 0 then
			arg_3_0.Email:setText(var_3_0.email)
		else
			arg_3_0.EmailHeader:SetAlpha(0)
			arg_3_0.Email:SetAlpha(0)
		end
	end

	if var_3_1 then
		var_0_2(arg_3_0, arg_3_2)
	end

	if arg_3_2.okButtonHandler then
		arg_3_0.ButtonOK:addEventHandler("button_action", arg_3_2.okButtonHandler)
	else
		arg_3_0.ButtonOK:addEventHandler("button_action", function(arg_4_0, arg_4_1)
			LUI.FlowManager.RequestLeaveMenu(arg_3_0)
		end)
	end

	LUI.TextChat.SetupMenuForNoChat(arg_3_0)
	LAYOUT.AddAspectRatioFadeFrame(arg_3_0, arg_3_1)
	ACTIONS.ScaleFullscreen(arg_3_0.Darkener)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end

	arg_3_0.isQuickAccessShortcutsDisabled = true
end

function CODAccountSummary(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIVerticalNavigator.new()

	var_5_0.id = "CODAccountSummary"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	var_5_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})
	var_5_0.HelperBar.id = "HelperBar"

	var_5_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_5_0.HelperBar:setPriority(10)
	var_5_0:addElement(var_5_0.HelperBar)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Darkener"

	var_5_4:SetRGBFromInt(0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Darkener = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("GenericPopupFrame", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "GenericPopupFrame"

	var_5_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.GenericPopupFrame = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "Image"

	var_5_8:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_5_8:SetAlpha(0.25, 0)
	var_5_8:setImage(RegisterMaterial("mm_COD_account_icon"), 0)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 377, _1080p * 658, _1080p * -170, _1080p * 158)
	var_5_0:addElement(var_5_8)

	var_5_0.Image = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "MenuTitle"

	var_5_10.MenuTitle:setText(Engine.CBBHFCGDIC("CODACCOUNT/SUMMARY"), 0)
	var_5_10.Line:SetLeft(0, 0)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 169, _1080p * -225, _1080p * -121)
	var_5_0:addElement(var_5_10)

	var_5_0.MenuTitle = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "Line"

	var_5_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * -300, _1080p * -124, _1080p * -124)
	var_5_0:addElement(var_5_12)

	var_5_0.Line = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIText.new()

	var_5_14.id = "DisplayNameHeader"

	var_5_14:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_5_14:setText(Engine.CBBHFCGDIC("CODACCOUNT/MW_DISPLAY_NAME"), 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_14:SetAlignment(LUI.Alignment.Left)
	var_5_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -263, _1080p * -64, _1080p * -40)
	var_5_0:addElement(var_5_14)

	var_5_0.DisplayNameHeader = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIText.new()

	var_5_16.id = "DisplayName"

	var_5_16:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_5_16:setText("", 0)
	var_5_16:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_5_16:SetAlignment(LUI.Alignment.Left)
	var_5_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -263, _1080p * -37, _1080p * -13)
	var_5_0:addElement(var_5_16)

	var_5_0.DisplayName = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIText.new()

	var_5_18.id = "ActivisionIDHeader"

	var_5_18:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_5_18:setText(Engine.CBBHFCGDIC("CODACCOUNT/ACTIVISION_ID"), 0)
	var_5_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_18:SetAlignment(LUI.Alignment.Left)
	var_5_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -263, _1080p * -12, _1080p * 12)
	var_5_0:addElement(var_5_18)

	var_5_0.ActivisionIDHeader = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIText.new()

	var_5_20.id = "ActivisionID"

	var_5_20:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_5_20:setText("", 0)
	var_5_20:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_5_20:SetAlignment(LUI.Alignment.Left)
	var_5_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -263, _1080p * 18, _1080p * 42)
	var_5_0:addElement(var_5_20)

	var_5_0.ActivisionID = var_5_20

	local var_5_21
	local var_5_22 = LUI.UIText.new()

	var_5_22.id = "EmailHeader"

	var_5_22:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_5_22:setText(Engine.CBBHFCGDIC("CODACCOUNT/ASSOCIATED_EMAIL"), 0)
	var_5_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_22:SetAlignment(LUI.Alignment.Left)
	var_5_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -263, _1080p * 43, _1080p * 67)
	var_5_0:addElement(var_5_22)

	var_5_0.EmailHeader = var_5_22

	local var_5_23
	local var_5_24 = LUI.UIText.new()

	var_5_24.id = "Email"

	var_5_24:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_5_24:setText("", 0)
	var_5_24:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_5_24:SetAlignment(LUI.Alignment.Left)
	var_5_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -263, _1080p * 70, _1080p * 92)
	var_5_0:addElement(var_5_24)

	var_5_0.Email = var_5_24

	local var_5_25
	local var_5_26 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_5_1
	})

	var_5_26.id = "ButtonOK"

	var_5_26.Text:SetLeft(_1080p * 20, 0)
	var_5_26.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/OK")), 0)
	var_5_26.Text:SetAlignment(LUI.Alignment.Left)
	var_5_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -343, _1080p * 139, _1080p * 177)
	var_5_0:addElement(var_5_26)

	var_5_0.ButtonOK = var_5_26

	local var_5_27
	local var_5_28 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_5_1
	})

	var_5_28.id = "Prompts"

	var_5_28:SetRGBFromTable(SWATCHES.buttonHelper.helperText, 0)

	if CONDITIONS.AlwaysFalse(var_5_0) then
		var_5_28.Label:setText("ButtonPrompts", 0)
	end

	var_5_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -663, _1080p * 246, _1080p * 277)
	var_5_0:addElement(var_5_28)

	var_5_0.Prompts = var_5_28

	local var_5_29
	local var_5_30 = LUI.UIText.new()

	var_5_30.id = "AddFriendsMessage"

	var_5_30:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_5_30:setText(Engine.CBBHFCGDIC("CODACCOUNT/ADD_CROSSPLAY_FRIENDS_MSG"), 0)
	var_5_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_30:SetAlignment(LUI.Alignment.Left)
	var_5_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -23, _1080p * 96, _1080p * 120)
	var_5_0:addElement(var_5_30)

	var_5_0.AddFriendsMessage = var_5_30

	local function var_5_31()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_31

	local var_5_32 = {
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

	var_5_14:RegisterAnimationSequence("AR", var_5_32)

	local var_5_33 = {
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
		}
	}

	var_5_16:RegisterAnimationSequence("AR", var_5_33)

	local var_5_34 = {
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

	var_5_18:RegisterAnimationSequence("AR", var_5_34)

	local var_5_35 = {
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
		}
	}

	var_5_20:RegisterAnimationSequence("AR", var_5_35)

	local var_5_36 = {
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

	var_5_22:RegisterAnimationSequence("AR", var_5_36)

	local var_5_37 = {
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
		}
	}

	var_5_24:RegisterAnimationSequence("AR", var_5_37)

	local var_5_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 290
		}
	}

	var_5_26:RegisterAnimationSequence("AR", var_5_38)

	local var_5_39 = {
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

	var_5_30:RegisterAnimationSequence("AR", var_5_39)

	local function var_5_40()
		var_5_14:AnimateSequence("AR")
		var_5_16:AnimateSequence("AR")
		var_5_18:AnimateSequence("AR")
		var_5_20:AnimateSequence("AR")
		var_5_22:AnimateSequence("AR")
		var_5_24:AnimateSequence("AR")
		var_5_26:AnimateSequence("AR")
		var_5_30:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_40

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("CODAccountSummary", CODAccountSummary)
LUI.FlowManager.RegisterStackPushBehaviour("CODAccountSummary", var_0_0)
LUI.FlowManager.RegisterStackPopBehaviour("CODAccountSummary", var_0_1)
LockTable(_M)
