module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	ACTIONS.AnimateSequence(arg_1_0, "Gifting2FA")
	arg_1_0:RemoveElement(arg_1_0.GenericButton)
	arg_1_0.Setup2FAButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_1_2.continueToSetupButtonText)))
	arg_1_0.AlreadySetup2FAButton.Text:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_1_2.alreadyEnrolledButtonText)))
	arg_1_0.Setup2FAButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		if arg_1_2.continueSetupAction then
			arg_1_2.continueSetupAction(arg_2_0, arg_1_1)
		else
			ACTIONS.LeaveMenu(arg_2_0)
		end
	end)
	arg_1_0.AlreadySetup2FAButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		if arg_1_2.alreadySetUp2FAAction then
			arg_1_2.alreadySetUp2FAAction(arg_3_0, arg_1_1)
		else
			ACTIONS.LeaveMenu(arg_3_0)
		end
	end)

	if arg_1_2.showBackButton then
		arg_1_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})

		local var_1_0 = LUI.UIBindButton.new()

		var_1_0.id = "selfBindButton"

		arg_1_0:addElement(var_1_0)

		arg_1_0.bindButton = var_1_0

		arg_1_0.bindButton:addEventHandler("button_secondary", function(arg_4_0, arg_4_1)
			ACTIONS.LeaveMenu(arg_1_0)
		end)
	end
end

local function var_0_1(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_2.title)
	assert(arg_5_2.panelData)

	local var_5_0 = {
		arg_5_0.Panel1,
		arg_5_0.Panel2,
		arg_5_0.Panel3
	}

	arg_5_0.Title:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_5_2.title)))
	ACTIONS.AnimateSequence(arg_5_0, "Show" .. #arg_5_2.panelData)

	local var_5_1 = #arg_5_2.panelData < #var_5_0 and #arg_5_2.panelData or #var_5_0

	for iter_5_0 = 1, var_5_1 do
		if arg_5_2.panelData[iter_5_0] then
			var_5_0[iter_5_0]:Setup(arg_5_1, arg_5_2.panelData[iter_5_0])
		end
	end

	arg_5_0.GenericButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		if arg_5_2.confirmButton and arg_5_2.confirmButton.action then
			arg_5_2.confirmButton.action(arg_6_0, arg_5_1)
		else
			ACTIONS.LeaveMenu(arg_6_0)
		end
	end)
	arg_5_0.GenericButton:StartTimer(arg_5_2.waitTime)

	if arg_5_2.isGiftingPopup then
		var_0_0(arg_5_0, arg_5_1, arg_5_2)
	else
		arg_5_0:RemoveElement(arg_5_0.Setup2FAButton)
		arg_5_0:RemoveElement(arg_5_0.AlreadySetup2FAButton)
	end

	if arg_5_2.newButtonText then
		arg_5_0.GenericButton.Text:setText(arg_5_2.newButtonText)
	end

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_5_0, "WZSetup")
	end

	LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_5_0, arg_5_1, {
		addWorldBlur = true,
		darkenerOpacity = 0.9,
		addScreenDarkener = true
	})
end

function OnboardingPopup(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIVerticalNavigator.new()

	var_7_0.id = "OnboardingPopup"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "GenericPopupWindow"

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_7_4.BotBorderWZ:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_7_4.TopBorderWZ:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	end

	var_7_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -292, _1080p * 292)
	var_7_0:addElement(var_7_4)

	var_7_0.GenericPopupWindow = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "ButtonHelperBar"

	var_7_6.Background:SetAlpha(0, 0)
	var_7_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 292, _1080p * 352)
	var_7_0:addElement(var_7_6)

	var_7_0.ButtonHelperBar = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIText.new()

	var_7_8.id = "Title"

	var_7_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_7_8:setText("TITLE", 0)
	var_7_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_7_8:SetAlignment(LUI.Alignment.Center)
	var_7_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -713, _1080p * 713, _1080p * -261, _1080p * -201)
	var_7_0:addElement(var_7_8)

	var_7_0.Title = var_7_8

	local var_7_9
	local var_7_10 = MenuBuilder.BuildRegisteredType("OnboardingDetailPanel", {
		controllerIndex = var_7_1
	})

	var_7_10.id = "Panel1"

	var_7_10.Description:setText("", 0)
	var_7_10.Title:setText("", 0)
	var_7_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -804, _1080p * -292, _1080p * -162, _1080p * 194)
	var_7_0:addElement(var_7_10)

	var_7_0.Panel1 = var_7_10

	local var_7_11
	local var_7_12 = MenuBuilder.BuildRegisteredType("OnboardingDetailPanel", {
		controllerIndex = var_7_1
	})

	var_7_12.id = "Panel2"

	var_7_12.Description:setText("", 0)
	var_7_12.Title:setText("", 0)
	var_7_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -162, _1080p * 194)
	var_7_0:addElement(var_7_12)

	var_7_0.Panel2 = var_7_12

	local var_7_13
	local var_7_14 = MenuBuilder.BuildRegisteredType("OnboardingDetailPanel", {
		controllerIndex = var_7_1
	})

	var_7_14.id = "Panel3"

	var_7_14.Description:setText("", 0)
	var_7_14.Title:setText("", 0)
	var_7_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 292, _1080p * 804, _1080p * -162, _1080p * 194)
	var_7_0:addElement(var_7_14)

	var_7_0.Panel3 = var_7_14

	local var_7_15
	local var_7_16 = MenuBuilder.BuildRegisteredType("TimedButton", {
		controllerIndex = var_7_1
	})

	var_7_16.id = "GenericButton"

	var_7_16.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
	var_7_16.Text:SetAlignment(LUI.Alignment.Center)
	var_7_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 750, _1080p * 1170, _1080p * 232, _1080p * 270)
	var_7_0:addElement(var_7_16)

	var_7_0.GenericButton = var_7_16

	local var_7_17
	local var_7_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_18.id = "AlreadySetup2FAButton"

	var_7_18:SetAlpha(0, 0)
	var_7_18.Text:SetLeft(_1080p * 20, 0)
	var_7_18.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE")), 0)
	var_7_18.Text:SetAlignment(LUI.Alignment.Center)
	var_7_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, 0, _1080p * 38)
	var_7_0:addElement(var_7_18)

	var_7_0.AlreadySetup2FAButton = var_7_18

	local var_7_19
	local var_7_20 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_20.id = "Setup2FAButton"

	var_7_20:SetAlpha(0, 0)
	var_7_20.Text:SetLeft(_1080p * 20, 0)
	var_7_20.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE")), 0)
	var_7_20.Text:SetAlignment(LUI.Alignment.Center)
	var_7_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 750, _1080p * 1170, _1080p * 715, _1080p * 753)
	var_7_0:addElement(var_7_20)

	var_7_0.Setup2FAButton = var_7_20

	local function var_7_21()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_21

	local var_7_22
	local var_7_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 250
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("Show1", var_7_23)

	local var_7_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 830
		}
	}

	var_7_12:RegisterAnimationSequence("Show1", var_7_24)

	local var_7_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 830
		}
	}

	var_7_14:RegisterAnimationSequence("Show1", var_7_25)

	local function var_7_26()
		var_7_10:AnimateSequence("Show1")
		var_7_12:AnimateSequence("Show1")
		var_7_14:AnimateSequence("Show1")
	end

	var_7_0._sequences.Show1 = var_7_26

	local var_7_27
	local var_7_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -632
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -120
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("Show2", var_7_28)

	local var_7_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 120
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 632
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("Show2", var_7_29)

	local var_7_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_14:RegisterAnimationSequence("Show2", var_7_30)

	local function var_7_31()
		var_7_10:AnimateSequence("Show2")
		var_7_12:AnimateSequence("Show2")
		var_7_14:AnimateSequence("Show2")
	end

	var_7_0._sequences.Show2 = var_7_31

	local var_7_32
	local var_7_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -804
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -292
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("Show3", var_7_33)

	local var_7_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		}
	}

	var_7_12:RegisterAnimationSequence("Show3", var_7_34)

	local var_7_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 292
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 804
		}
	}

	var_7_14:RegisterAnimationSequence("Show3", var_7_35)

	local function var_7_36()
		var_7_10:AnimateSequence("Show3")
		var_7_12:AnimateSequence("Show3")
		var_7_14:AnimateSequence("Show3")
	end

	var_7_0._sequences.Show3 = var_7_36

	local var_7_37
	local var_7_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight,
			child = var_7_0.GenericPopupWindow.BotBorderWZ
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight,
			child = var_7_0.GenericPopupWindow.TopBorderWZ
		}
	}

	var_7_4:RegisterAnimationSequence("WZSetup", var_7_38)

	local var_7_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_7_8:RegisterAnimationSequence("WZSetup", var_7_39)

	local function var_7_40()
		var_7_4:AnimateSequence("WZSetup")
		var_7_8:AnimateSequence("WZSetup")
	end

	var_7_0._sequences.WZSetup = var_7_40

	local var_7_41
	local var_7_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 346
		}
	}

	var_7_4:RegisterAnimationSequence("Gifting2FA", var_7_42)

	local var_7_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 346
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 406
		}
	}

	var_7_6:RegisterAnimationSequence("Gifting2FA", var_7_43)

	local var_7_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -270
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -210
		}
	}

	var_7_8:RegisterAnimationSequence("Gifting2FA", var_7_44)

	local var_7_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -195
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		}
	}

	var_7_10:RegisterAnimationSequence("Gifting2FA", var_7_45)

	local var_7_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -195
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		}
	}

	var_7_12:RegisterAnimationSequence("Gifting2FA", var_7_46)

	local var_7_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -195
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		}
	}

	var_7_14:RegisterAnimationSequence("Gifting2FA", var_7_47)

	local var_7_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("Gifting2FA", var_7_48)

	local var_7_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 750
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 821
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1170
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 859
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase("2FA already set up"),
			child = var_7_0.AlreadySetup2FAButton.Text
		}
	}

	var_7_18:RegisterAnimationSequence("Gifting2FA", var_7_49)

	local var_7_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase("Continue to 2FA setup"),
			child = var_7_0.Setup2FAButton.Text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 772
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 810
		}
	}

	var_7_20:RegisterAnimationSequence("Gifting2FA", var_7_50)

	local function var_7_51()
		var_7_4:AnimateSequence("Gifting2FA")
		var_7_6:AnimateSequence("Gifting2FA")
		var_7_8:AnimateSequence("Gifting2FA")
		var_7_10:AnimateSequence("Gifting2FA")
		var_7_12:AnimateSequence("Gifting2FA")
		var_7_14:AnimateSequence("Gifting2FA")
		var_7_16:AnimateSequence("Gifting2FA")
		var_7_18:AnimateSequence("Gifting2FA")
		var_7_20:AnimateSequence("Gifting2FA")
	end

	var_7_0._sequences.Gifting2FA = var_7_51

	function var_7_0.addButtonHelperFunction(arg_14_0, arg_14_1)
		arg_14_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_7_0:addEventHandler("menu_create", var_7_0.addButtonHelperFunction)

	local var_7_52 = LUI.UIBindButton.new()

	var_7_52.id = "selfBindButton"

	var_7_0:addElement(var_7_52)

	var_7_0.bindButton = var_7_52

	var_0_1(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("OnboardingPopup", OnboardingPopup)
LockTable(_M)
