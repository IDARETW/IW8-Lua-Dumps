module(..., package.seeall)

local var_0_0 = false
local var_0_1 = false

local function var_0_2(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.BindButton = LUI.UIBindButton.new()
	arg_1_0.BindButton.onCancel = arg_1_1

	arg_1_0.BindButton:registerEventHandler("button_secondary", function(arg_2_0, arg_2_1)
		arg_2_0:onCancel(arg_2_1.controller)
	end)
	arg_1_0.BindButton:registerEventHandler("virtual_keyboard_popup_active", function(arg_3_0, arg_3_1)
		arg_3_0:processEvent({
			name = "popup_active"
		})
	end)
	arg_1_0:addElement(arg_1_0.BindButton)

	local var_1_0 = arg_1_2 and Engine.CBBHFCGDIC("MENU/EXIT") or Engine.CBBHFCGDIC("LUA_MENU/CANCEL")
	local var_1_1 = arg_1_2 and "button_primary" or "button_secondary"

	arg_1_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		force_display = true,
		helper_text = var_1_0,
		button_ref = var_1_1,
		container = arg_1_0.CancelPrompt,
		containerAlignment = LUI.Alignment.Center
	})

	if arg_1_2 then
		arg_1_0:addEventHandler("gamepad_button", function(arg_4_0, arg_4_1)
			if arg_4_1.button == "primary" and arg_4_1.down and not arg_4_0.disabled then
				LUI.FlowManager.RequestLeaveMenu()

				return true
			end
		end)
	end
end

local function var_0_3(arg_5_0, arg_5_1)
	arg_5_0.BindButton = LUI.UIBindButton.new()
	arg_5_0.BindButton.buttons = arg_5_1

	arg_5_0.BindButton:registerEventHandler("button_secondary", function(arg_6_0, arg_6_1)
		arg_6_0.buttons.action(arg_5_0)
	end)
	arg_5_0:addElement(arg_5_0.BindButton)
	arg_5_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		button_ref = "button_secondary",
		helper_text = arg_5_1.label,
		container = arg_5_0.CancelPrompt,
		containerAlignment = arg_5_1.alignment
	})
end

local function var_0_4(arg_7_0, arg_7_1, arg_7_2)
	assert(arg_7_0.Background)
	assert(arg_7_0.Message)

	arg_7_0.SetupCancelButton = var_0_2
	arg_7_0._controllerIndex = arg_7_1

	arg_7_0.Message:setText(arg_7_2.message)

	if arg_7_2.useProgress then
		ACTIONS.AnimateSequence(arg_7_0, "ShowProgress")

		function arg_7_0.SetProgress(arg_8_0, arg_8_1)
			arg_8_0.Progress:SetProgress(arg_8_1, 0, nil)
		end
	end

	if arg_7_2.onCancel then
		var_0_2(arg_7_0, arg_7_2.onCancel, arg_7_2.showExit)
	elseif arg_7_2.buttons then
		var_0_3(arg_7_0, arg_7_2.buttons)
	else
		arg_7_0.ButtonHelperBar:SetAlpha(0)
	end

	ACTIONS.ScaleFullscreen(arg_7_0.Darkener)
	LUI.TextChat.SetupMenuForNoChat(arg_7_0)

	local var_7_0 = arg_7_2.displayWZWipSetup or CONDITIONS.IsWZWipDvarEnabled()

	if not (arg_7_2.disableIntro == nil and true or arg_7_2.disableIntro) then
		if var_0_0 then
			ACTIONS.AnimateSequence(arg_7_0, "WZMilitaryAppreciationIntro")
		else
			ACTIONS.AnimateSequence(arg_7_0, WZWIP.CheckForApplyPrependWZWipPrefix("Intro", var_7_0))
		end
	elseif var_0_0 then
		ACTIONS.AnimateSequence(arg_7_0, "WZMilitaryAppreciation")
	elseif var_0_1 and not arg_7_2.isGeneric then
		ACTIONS.AnimateSequence(arg_7_0, "WZWipSetQueueDisplay")
		arg_7_0.Message:setText(Engine.CBBHFCGDIC("LUA_MENU_EAGLE/PACIFIC_MAP_BANNER_TITLE"))
		arg_7_0.Description:setText(Engine.CBBHFCGDIC("LUA_MENU_EAGLE/PACIFIC_MAP_BANNER_DESC"))
	else
		ACTIONS.AnimateSequence(arg_7_0, WZWIP.CheckForApplyPrependWZWipPrefix("Setup", var_7_0))
	end

	if arg_7_2.showExit then
		ACTIONS.AnimateSequence(arg_7_0.Spinner, "Hide")
	end

	if arg_7_2.isGeneric then
		ACTIONS.AnimateSequence(arg_7_0, WZWIP.CheckForApplyPrependWZWipPrefix("GenericLogo", var_7_0))
	elseif Engine.CJJAFGIFAC(arg_7_1) then
		if not Engine.CFHBIHABCB(arg_7_1) then
			ACTIONS.AnimateSequence(arg_7_0, WZWIP.CheckForApplyPrependWZWipPrefix("WarzoneLogo", var_7_0))
		end
	else
		ACTIONS.AnimateSequence(arg_7_0, WZWIP.CheckForApplyPrependWZWipPrefix("HybridLogo", var_7_0))
	end

	local var_7_1 = Dvar.CFHDGABACF("MNLSTLMOKR")
	local var_7_2 = "ui_fence_dialog_server_queue_background"

	if Engine.CGABICJHAI() then
		var_7_2 = "ui_fence_dialog_server_queue_background_pc"
	elseif var_7_1 and var_7_1 > 0 then
		if var_7_1 == 1 then
			var_7_2 = "ui_fence_dialog_server_queue_background"
		elseif var_7_1 == 2 then
			var_7_2 = "ui_fence_dialog_server_queue_background_available_now"
		end
	end

	if CONDITIONS.InFrontend() and arg_7_0.WZWipKeyart ~= nil then
		arg_7_0.WZWipKeyart:setImage(RegisterMaterial(var_7_2))
	end

	if Engine.CGABICJHAI() then
		LAYOUT.AddAspectRatioFadeFrame(arg_7_0, arg_7_1)

		local var_7_3 = Dvar.CFHDGABACF("QKKMRRLRR")

		if (var_7_3 == 5 or var_7_3 == 6) == true then
			ACTIONS.AnimateSequence(arg_7_0, "WideAspectRatio")
		end
	end

	if not Engine.DDJFBBJAIG() then
		ACTIONS.AnimateSequence(arg_7_0, "InGameDisplay")
	end
end

function FenceDialog(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0.id = "FenceDialog"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "Darkener"

	var_9_4:SetRGBFromInt(0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.Darkener = var_9_4

	local var_9_5

	if CONDITIONS.InFrontend() then
		var_9_5 = LUI.UIImage.new()
		var_9_5.id = "WZWipKeyart"

		var_9_5:setImage(RegisterMaterial("ui_fence_dialog_server_queue_background"), 0)
		var_9_5:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -540, _1080p * 540)
		var_9_0:addElement(var_9_5)

		var_9_0.WZWipKeyart = var_9_5
	end

	local var_9_6
	local var_9_7 = LUI.UIImage.new()

	var_9_7.id = "WZWipEventArt"

	var_9_7:setImage(RegisterMaterial("ui_default_white"), 0)
	var_9_7:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -610, _1080p * 610, _1080p * 134, _1080p * 831)
	var_9_0:addElement(var_9_7)

	var_9_0.WZWipEventArt = var_9_7

	local var_9_8
	local var_9_9 = LUI.UIImage.new()

	var_9_9.id = "WZWipBotSep"

	var_9_9:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_9_9:SetAlpha(0.5, 0)
	var_9_9:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 150, _1080p * -150, _1080p * -124, _1080p * -123)
	var_9_0:addElement(var_9_9)

	var_9_0.WZWipBotSep = var_9_9

	local var_9_10
	local var_9_11 = LUI.UIImage.new()

	var_9_11.id = "WZWipBacking"

	var_9_11:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_9_11:SetAlpha(0.6, 0)
	var_9_11:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_9_11:Setup9SliceImage(_1080p * 50, _1080p * 20, 0.31, 0.18)
	var_9_11:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 150, _1080p * -150, _1080p * -258, _1080p * -128)
	var_9_0:addElement(var_9_11)

	var_9_0.WZWipBacking = var_9_11

	local var_9_12
	local var_9_13 = LUI.UIImage.new()

	var_9_13.id = "WZWipTopSep"

	var_9_13:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_9_13:SetAlpha(0.5, 0)
	var_9_13:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 150, _1080p * -150, _1080p * -264, _1080p * -262)
	var_9_0:addElement(var_9_13)

	var_9_0.WZWipTopSep = var_9_13

	local var_9_14
	local var_9_15 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_9_1
	})

	var_9_15.id = "GenericPopupWindow"

	var_9_15:SetAlpha(0, 0)

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_9_15.BotBorderWZ:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_9_15.TopBorderWZ:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	end

	var_9_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 856, _1080p * -230, _1080p * 230)
	var_9_0:addElement(var_9_15)

	var_9_0.GenericPopupWindow = var_9_15

	local var_9_16
	local var_9_17 = MenuBuilder.BuildRegisteredType("GenericBoxFillAndStroke", {
		controllerIndex = var_9_1
	})

	var_9_17.id = "Background"

	var_9_17:SetAlpha(0, 0)
	var_9_17:SetPixelGridEnabled(true)
	var_9_17:SetPixelGridContrast(0.5, 0)
	var_9_17:SetPixelGridBlockWidth(2, 0)
	var_9_17:SetPixelGridBlockHeight(2, 0)
	var_9_17:SetPixelGridGutterWidth(1, 0)
	var_9_17:SetPixelGridGutterHeight(1, 0)
	var_9_17.Fill:SetRGBFromInt(3355443, 0)
	var_9_17.Fill:SetAlpha(0, 0)
	var_9_17.Stroke:SetRGBFromTable(SWATCHES.genericMenu.frame, 0)
	var_9_17.Stroke:SetAlpha(0, 0)
	var_9_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 854, _1080p * 45, _1080p * 45)
	var_9_0:addElement(var_9_17)

	var_9_0.Background = var_9_17

	local var_9_18
	local var_9_19 = LUI.UIText.new()

	var_9_19.id = "Message"

	var_9_19:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_9_19:setText("", 0)
	var_9_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_19:SetAlignment(LUI.Alignment.Center)
	var_9_19:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -784, _1080p * 784, _1080p * -514, _1080p * -478)
	var_9_0:addElement(var_9_19)

	var_9_0.Message = var_9_19

	local var_9_20
	local var_9_21 = MenuBuilder.BuildRegisteredType("FenceSpinner", {
		controllerIndex = var_9_1
	})

	var_9_21.id = "Spinner"

	var_9_21:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -170, _1080p * 170, _1080p * 126, _1080p * 136)
	var_9_0:addElement(var_9_21)

	var_9_0.Spinner = var_9_21

	local var_9_22

	if CONDITIONS.InFrontend() then
		var_9_22 = LUI.UIImage.new()
		var_9_22.id = "Image"

		var_9_22:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
		var_9_22:SetAlpha(0, 0)
		var_9_22:setImage(RegisterMaterial("mm_element_logo_white"), 0)
		var_9_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -260, _1080p * 260, _1080p * -277, _1080p * 19)
		var_9_0:addElement(var_9_22)

		var_9_0.Image = var_9_22
	end

	local var_9_23
	local var_9_24 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_9_1
	})

	var_9_24.id = "Progress"

	var_9_24:SetAlpha(0, 0)
	var_9_24.Fill:SetRGBFromTable(SWATCHES.CAC.weaponMeterMain, 0)
	var_9_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -140, _1080p * 140, _1080p * 40, _1080p * 50)
	var_9_0:addElement(var_9_24)

	var_9_0.Progress = var_9_24

	local var_9_25
	local var_9_26 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_9_1
	})

	var_9_26.id = "ButtonHelperBar"

	var_9_26.Background:SetAlpha(0.2, 0)
	var_9_26:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, _1080p * 1020, _1080p * 1080)
	var_9_0:addElement(var_9_26)

	var_9_0.ButtonHelperBar = var_9_26

	local var_9_27
	local var_9_28 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_9_1
	})

	var_9_28.id = "CancelPrompt"

	if CONDITIONS.AlwaysFalse() then
		var_9_28.Label:setText("ButtonPrompt", 0)
	end

	var_9_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * 251, _1080p * 282)
	var_9_0:addElement(var_9_28)

	var_9_0.CancelPrompt = var_9_28

	local var_9_29

	if CONDITIONS.InFrontend() then
		var_9_29 = LUI.UIImage.new()
		var_9_29.id = "VignetteRight"

		var_9_29:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
		var_9_29:SetAlpha(0, 0)
		var_9_29:setImage(RegisterMaterial("gradient_curve"), 0)
		var_9_29:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * 70, _1080p * -397, 0, 0)
		var_9_0:addElement(var_9_29)

		var_9_0.VignetteRight = var_9_29
	end

	local var_9_30

	if CONDITIONS.InFrontend() then
		var_9_30 = LUI.UIImage.new()
		var_9_30.id = "VignetteLeft"

		var_9_30:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
		var_9_30:SetAlpha(0, 0)
		var_9_30:SetYRotation(180, 0)
		var_9_30:setImage(RegisterMaterial("gradient_curve"), 0)
		var_9_30:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 395, _1080p * -72, 0, 0)
		var_9_0:addElement(var_9_30)

		var_9_0.VignetteLeft = var_9_30
	end

	local var_9_31

	if CONDITIONS.InFrontend() then
		var_9_31 = LUI.UIImage.new()
		var_9_31.id = "WZWipBattlePassMsg"

		var_9_31:SetAlpha(0, 0)
		var_9_31:SetScale(-0.4, 0)
		var_9_31:setImage(RegisterMaterial("ui_fence_dialog_battlepass_msg"), 0)
		var_9_31:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -645, _1080p * 645, _1080p * -608, _1080p * -182)
		var_9_0:addElement(var_9_31)

		var_9_0.WZWipBattlePassMsg = var_9_31
	end

	local var_9_32

	if not CONDITIONS.InFrontend() then
		var_9_32 = LUI.UIImage.new()
		var_9_32.id = "InGameWarningLogo"

		var_9_32:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
		var_9_32:SetAlpha(0, 0)
		var_9_32:setImage(RegisterMaterial("icon_warning_large"), 0)
		var_9_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * 102, _1080p * 230)
		var_9_0:addElement(var_9_32)

		var_9_0.InGameWarningLogo = var_9_32
	end

	local var_9_33
	local var_9_34 = LUI.UIStyledText.new()

	var_9_34.id = "Description"

	var_9_34:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_9_34:SetAlpha(0, 0)
	var_9_34:setText("", 0)
	var_9_34:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_34:SetAlignment(LUI.Alignment.Center)
	var_9_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -776, _1080p * 776, _1080p * 19, _1080p * 45)
	var_9_0:addElement(var_9_34)

	var_9_0.Description = var_9_34

	local var_9_35
	local var_9_36 = LUI.UIStyledText.new()

	var_9_36.id = "WaitTime"

	var_9_36:SetRGBFromTable(SWATCHES.NightVision.Light, 0)
	var_9_36:SetAlpha(0, 0)
	var_9_36:setText("", 0)
	var_9_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_36:SetAlignment(LUI.Alignment.Center)
	var_9_36:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -400, _1080p * 400, _1080p * 80, _1080p * 102)
	var_9_0:addElement(var_9_36)

	var_9_0.WaitTime = var_9_36

	local var_9_37
	local var_9_38 = LUI.UIStyledText.new()

	var_9_38.id = "WaitPosition"

	var_9_38:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_9_38:SetAlpha(0, 0)
	var_9_38:setText("", 0)
	var_9_38:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_38:SetAlignment(LUI.Alignment.Center)
	var_9_38:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -400, _1080p * 400, _1080p * 62, _1080p * 80)
	var_9_0:addElement(var_9_38)

	var_9_0.WaitPosition = var_9_38

	local function var_9_39()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_39

	local var_9_40

	if CONDITIONS.InFrontend() then
		local var_9_41 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_5:RegisterAnimationSequence("Intro", var_9_41)
	end

	local var_9_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_7:RegisterAnimationSequence("Intro", var_9_42)

	local var_9_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_9:RegisterAnimationSequence("Intro", var_9_43)

	local var_9_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_11:RegisterAnimationSequence("Intro", var_9_44)

	local var_9_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_13:RegisterAnimationSequence("Intro", var_9_45)

	local var_9_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_15:RegisterAnimationSequence("Intro", var_9_46)

	local var_9_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 56700,
			property = TWEEN_PROPERTY.Alpha,
			child = var_9_0.Background.Stroke
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_9_0.Background.Fill
		}
	}

	var_9_17:RegisterAnimationSequence("Intro", var_9_47)

	local var_9_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 76
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_19:RegisterAnimationSequence("Intro", var_9_48)

	local var_9_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 140,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_21:RegisterAnimationSequence("Intro", var_9_49)

	if CONDITIONS.InFrontend() then
		local var_9_50 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0,
				duration = 240,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 1,
				duration = 100,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_22:RegisterAnimationSequence("Intro", var_9_50)
	end

	local var_9_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_28:RegisterAnimationSequence("Intro", var_9_51)

	local function var_9_52()
		if CONDITIONS.InFrontend() then
			var_9_5:AnimateSequence("Intro")
		end

		var_9_7:AnimateSequence("Intro")
		var_9_9:AnimateSequence("Intro")
		var_9_11:AnimateSequence("Intro")
		var_9_13:AnimateSequence("Intro")
		var_9_15:AnimateSequence("Intro")
		var_9_17:AnimateSequence("Intro")
		var_9_19:AnimateSequence("Intro")
		var_9_21:AnimateSequence("Intro")

		if CONDITIONS.InFrontend() then
			var_9_22:AnimateSequence("Intro")
		end

		var_9_28:AnimateSequence("Intro")
	end

	var_9_0._sequences.Intro = var_9_52

	local var_9_53
	local var_9_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_24:RegisterAnimationSequence("ShowProgress", var_9_54)

	local function var_9_55()
		var_9_24:AnimateSequence("ShowProgress")
	end

	var_9_0._sequences.ShowProgress = var_9_55

	local function var_9_56()
		return
	end

	var_9_0._sequences.WarzoneLogo = var_9_56

	local var_9_57

	if CONDITIONS.InFrontend() then
		local var_9_58 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("icon_warning_large")
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -64
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 64
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -189
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -61
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Scale
			},
			{
				value = 0.4,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_22:RegisterAnimationSequence("GenericLogo", var_9_58)
	end

	local function var_9_59()
		if CONDITIONS.InFrontend() then
			var_9_22:AnimateSequence("GenericLogo")
		end
	end

	var_9_0._sequences.GenericLogo = var_9_59

	local function var_9_60()
		return
	end

	var_9_0._sequences.HybridLogo = var_9_60

	local var_9_61

	if CONDITIONS.InFrontend() then
		local var_9_62 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("icon_warning_large")
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -64
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 64
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -418
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -290
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Scale
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_22:RegisterAnimationSequence("WZWipGenericLogo", var_9_62)
	end

	local function var_9_63()
		if CONDITIONS.InFrontend() then
			var_9_22:AnimateSequence("WZWipGenericLogo")
		end
	end

	var_9_0._sequences.WZWipGenericLogo = var_9_63

	local var_9_64

	if CONDITIONS.InFrontend() then
		local var_9_65 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 1,
				duration = 250,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_5:RegisterAnimationSequence("WZWipIntro", var_9_65)
	end

	local var_9_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_7:RegisterAnimationSequence("WZWipIntro", var_9_66)

	local var_9_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 440,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_9:RegisterAnimationSequence("WZWipIntro", var_9_67)

	local var_9_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 440,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_11:RegisterAnimationSequence("WZWipIntro", var_9_68)

	local var_9_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 440,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_13:RegisterAnimationSequence("WZWipIntro", var_9_69)

	local var_9_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_15:RegisterAnimationSequence("WZWipIntro", var_9_70)

	local var_9_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 56700,
			property = TWEEN_PROPERTY.Alpha,
			child = var_9_0.Background.Stroke
		},
		{
			value = 0,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_9_0.Background.Fill
		}
	}

	var_9_17:RegisterAnimationSequence("WZWipIntro", var_9_71)

	local var_9_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -187
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -223
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 784
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -784
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 460,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_19:RegisterAnimationSequence("WZWipIntro", var_9_72)

	local var_9_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 140,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_21:RegisterAnimationSequence("WZWipIntro", var_9_73)

	if CONDITIONS.InFrontend() then
		local var_9_74 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0,
				duration = 140,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 1,
				duration = 320,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_22:RegisterAnimationSequence("WZWipIntro", var_9_74)
	end

	local var_9_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -112
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -82
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 90,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_28:RegisterAnimationSequence("WZWipIntro", var_9_75)

	if CONDITIONS.InFrontend() then
		local var_9_76 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 2220,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -1049
			},
			{
				duration = 2220,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -611
			},
			{
				duration = 2220,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -1095
			},
			{
				duration = 2220,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 229
			},
			{
				value = 0,
				duration = 140,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 1,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_31:RegisterAnimationSequence("WZWipIntro", var_9_76)
	end

	local function var_9_77()
		if CONDITIONS.InFrontend() then
			var_9_5:AnimateSequence("WZWipIntro")
		end

		var_9_7:AnimateSequence("WZWipIntro")
		var_9_9:AnimateSequence("WZWipIntro")
		var_9_11:AnimateSequence("WZWipIntro")
		var_9_13:AnimateSequence("WZWipIntro")
		var_9_15:AnimateSequence("WZWipIntro")
		var_9_17:AnimateSequence("WZWipIntro")
		var_9_19:AnimateSequence("WZWipIntro")
		var_9_21:AnimateSequence("WZWipIntro")

		if CONDITIONS.InFrontend() then
			var_9_22:AnimateSequence("WZWipIntro")
		end

		var_9_28:AnimateSequence("WZWipIntro")

		if CONDITIONS.InFrontend() then
			var_9_31:AnimateSequence("WZWipIntro")
		end
	end

	var_9_0._sequences.WZWipIntro = var_9_77

	local function var_9_78()
		return
	end

	var_9_0._sequences.WZWipWarzoneLogo = var_9_78

	local var_9_79

	if CONDITIONS.InFrontend() then
		local var_9_80 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_fence_dialog_server_queue_background")
			}
		}

		var_9_5:RegisterAnimationSequence("WZWipSetup", var_9_80)
	end

	local var_9_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_7:RegisterAnimationSequence("WZWipSetup", var_9_81)

	local var_9_82 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_11:RegisterAnimationSequence("WZWipSetup", var_9_82)

	local var_9_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_15:RegisterAnimationSequence("WZWipSetup", var_9_83)

	local var_9_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_17:RegisterAnimationSequence("WZWipSetup", var_9_84)

	local var_9_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -223
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -187
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_19:RegisterAnimationSequence("WZWipSetup", var_9_85)

	local var_9_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -178
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -168
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_21:RegisterAnimationSequence("WZWipSetup", var_9_86)

	if CONDITIONS.InFrontend() then
		local var_9_87 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_22:RegisterAnimationSequence("WZWipSetup", var_9_87)
	end

	local var_9_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -159
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -149
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_24:RegisterAnimationSequence("WZWipSetup", var_9_88)

	local var_9_89 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -60
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_26:RegisterAnimationSequence("WZWipSetup", var_9_89)

	local var_9_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -112
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -82
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		}
	}

	var_9_28:RegisterAnimationSequence("WZWipSetup", var_9_90)

	if CONDITIONS.InFrontend() then
		local var_9_91 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_29:RegisterAnimationSequence("WZWipSetup", var_9_91)
	end

	if CONDITIONS.InFrontend() then
		local var_9_92 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_30:RegisterAnimationSequence("WZWipSetup", var_9_92)
	end

	if CONDITIONS.InFrontend() then
		local var_9_93 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_fence_dialog_battlepass_msg")
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -645
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 645
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -608
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -182
			}
		}

		var_9_31:RegisterAnimationSequence("WZWipSetup", var_9_93)
	end

	local var_9_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_34:RegisterAnimationSequence("WZWipSetup", var_9_94)

	local function var_9_95()
		if CONDITIONS.InFrontend() then
			var_9_5:AnimateSequence("WZWipSetup")
		end

		var_9_7:AnimateSequence("WZWipSetup")
		var_9_11:AnimateSequence("WZWipSetup")
		var_9_15:AnimateSequence("WZWipSetup")
		var_9_17:AnimateSequence("WZWipSetup")
		var_9_19:AnimateSequence("WZWipSetup")
		var_9_21:AnimateSequence("WZWipSetup")

		if CONDITIONS.InFrontend() then
			var_9_22:AnimateSequence("WZWipSetup")
		end

		var_9_24:AnimateSequence("WZWipSetup")
		var_9_26:AnimateSequence("WZWipSetup")
		var_9_28:AnimateSequence("WZWipSetup")

		if CONDITIONS.InFrontend() then
			var_9_29:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.InFrontend() then
			var_9_30:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.InFrontend() then
			var_9_31:AnimateSequence("WZWipSetup")
		end

		var_9_34:AnimateSequence("WZWipSetup")
	end

	var_9_0._sequences.WZWipSetup = var_9_95

	local var_9_96

	if CONDITIONS.InFrontend() then
		local var_9_97 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_5:RegisterAnimationSequence("Setup", var_9_97)
	end

	local var_9_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_7:RegisterAnimationSequence("Setup", var_9_98)

	local var_9_99 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_9:RegisterAnimationSequence("Setup", var_9_99)

	local var_9_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_11:RegisterAnimationSequence("Setup", var_9_100)

	local var_9_101 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_13:RegisterAnimationSequence("Setup", var_9_101)

	local var_9_102 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_15:RegisterAnimationSequence("Setup", var_9_102)

	local var_9_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_17:RegisterAnimationSequence("Setup", var_9_103)

	local var_9_104 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 76
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_19:RegisterAnimationSequence("Setup", var_9_104)

	local var_9_105 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_21:RegisterAnimationSequence("Setup", var_9_105)

	if CONDITIONS.InFrontend() then
		local var_9_106 = {
			{
				value = 0.6,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -247
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 49
			}
		}

		var_9_22:RegisterAnimationSequence("Setup", var_9_106)
	end

	local var_9_107 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 282
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 251
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -50
		}
	}

	var_9_28:RegisterAnimationSequence("Setup", var_9_107)

	if CONDITIONS.InFrontend() then
		local var_9_108 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_31:RegisterAnimationSequence("Setup", var_9_108)
	end

	local function var_9_109()
		if CONDITIONS.InFrontend() then
			var_9_5:AnimateSequence("Setup")
		end

		var_9_7:AnimateSequence("Setup")
		var_9_9:AnimateSequence("Setup")
		var_9_11:AnimateSequence("Setup")
		var_9_13:AnimateSequence("Setup")
		var_9_15:AnimateSequence("Setup")
		var_9_17:AnimateSequence("Setup")
		var_9_19:AnimateSequence("Setup")
		var_9_21:AnimateSequence("Setup")

		if CONDITIONS.InFrontend() then
			var_9_22:AnimateSequence("Setup")
		end

		var_9_28:AnimateSequence("Setup")

		if CONDITIONS.InFrontend() then
			var_9_31:AnimateSequence("Setup")
		end
	end

	var_9_0._sequences.Setup = var_9_109

	local var_9_110

	if CONDITIONS.InFrontend() then
		local var_9_111 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_29:RegisterAnimationSequence("WideAspectRatio", var_9_111)
	end

	if CONDITIONS.InFrontend() then
		local var_9_112 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_30:RegisterAnimationSequence("WideAspectRatio", var_9_112)
	end

	local function var_9_113()
		if CONDITIONS.InFrontend() then
			var_9_29:AnimateSequence("WideAspectRatio")
		end

		if CONDITIONS.InFrontend() then
			var_9_30:AnimateSequence("WideAspectRatio")
		end
	end

	var_9_0._sequences.WideAspectRatio = var_9_113

	local var_9_114
	local var_9_115 = {
		{
			value = 657930,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_9_4:RegisterAnimationSequence("WZMilitaryAppreciation", var_9_115)

	if CONDITIONS.InFrontend() then
		local var_9_116 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_5:RegisterAnimationSequence("WZMilitaryAppreciation", var_9_116)
	end

	local var_9_117 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_7:RegisterAnimationSequence("WZMilitaryAppreciation", var_9_117)

	local var_9_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -124
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -400
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -123
		}
	}

	var_9_9:RegisterAnimationSequence("WZMilitaryAppreciation", var_9_118)

	local var_9_119 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -126
		},
		{
			value = 1118481,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -400
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_11:RegisterAnimationSequence("WZMilitaryAppreciation", var_9_119)

	local var_9_120 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -213
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -212
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -400
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_13:RegisterAnimationSequence("WZMilitaryAppreciation", var_9_120)

	local var_9_121 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_15:RegisterAnimationSequence("WZMilitaryAppreciation", var_9_121)

	local var_9_122 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -854
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 854
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 45
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_9_17:RegisterAnimationSequence("WZMilitaryAppreciation", var_9_122)

	local var_9_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZFenceMessage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -189
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -153
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -784
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 784
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_19:RegisterAnimationSequence("WZMilitaryAppreciation", var_9_123)

	local var_9_124 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -148
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -170
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 170
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -138
		}
	}

	var_9_21:RegisterAnimationSequence("WZMilitaryAppreciation", var_9_124)

	if CONDITIONS.InFrontend() then
		local var_9_125 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_22:RegisterAnimationSequence("WZMilitaryAppreciation", var_9_125)
	end

	local var_9_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -159
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -149
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_24:RegisterAnimationSequence("WZMilitaryAppreciation", var_9_126)

	local var_9_127 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_26:RegisterAnimationSequence("WZMilitaryAppreciation", var_9_127)

	local var_9_128 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -82
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -54
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_9_28:RegisterAnimationSequence("WZMilitaryAppreciation", var_9_128)

	if CONDITIONS.InFrontend() then
		local var_9_129 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_31:RegisterAnimationSequence("WZMilitaryAppreciation", var_9_129)
	end

	local var_9_130 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 330
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 356
		}
	}

	var_9_34:RegisterAnimationSequence("WZMilitaryAppreciation", var_9_130)

	local var_9_131 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 391
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 413
		}
	}

	var_9_36:RegisterAnimationSequence("WZMilitaryAppreciation", var_9_131)

	local var_9_132 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 371
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 389
		}
	}

	var_9_38:RegisterAnimationSequence("WZMilitaryAppreciation", var_9_132)

	local function var_9_133()
		var_9_4:AnimateSequence("WZMilitaryAppreciation")

		if CONDITIONS.InFrontend() then
			var_9_5:AnimateSequence("WZMilitaryAppreciation")
		end

		var_9_7:AnimateSequence("WZMilitaryAppreciation")
		var_9_9:AnimateSequence("WZMilitaryAppreciation")
		var_9_11:AnimateSequence("WZMilitaryAppreciation")
		var_9_13:AnimateSequence("WZMilitaryAppreciation")
		var_9_15:AnimateSequence("WZMilitaryAppreciation")
		var_9_17:AnimateSequence("WZMilitaryAppreciation")
		var_9_19:AnimateSequence("WZMilitaryAppreciation")
		var_9_21:AnimateSequence("WZMilitaryAppreciation")

		if CONDITIONS.InFrontend() then
			var_9_22:AnimateSequence("WZMilitaryAppreciation")
		end

		var_9_24:AnimateSequence("WZMilitaryAppreciation")
		var_9_26:AnimateSequence("WZMilitaryAppreciation")
		var_9_28:AnimateSequence("WZMilitaryAppreciation")

		if CONDITIONS.InFrontend() then
			var_9_31:AnimateSequence("WZMilitaryAppreciation")
		end

		var_9_34:AnimateSequence("WZMilitaryAppreciation")
		var_9_36:AnimateSequence("WZMilitaryAppreciation")
		var_9_38:AnimateSequence("WZMilitaryAppreciation")
	end

	var_9_0._sequences.WZMilitaryAppreciation = var_9_133

	local var_9_134
	local var_9_135 = {
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("InGameDisplay", var_9_135)

	if not CONDITIONS.InFrontend() then
		local var_9_136 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Scale
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0.03,
				duration = 182,
				property = TWEEN_PROPERTY.Scale,
				easing = LUI.EASING.inOutSine
			},
			{
				value = 0,
				duration = 182,
				property = TWEEN_PROPERTY.Scale,
				easing = LUI.EASING.inOutSine
			}
		}

		var_9_32:RegisterAnimationSequence("InGameDisplay", var_9_136)
	end

	local function var_9_137()
		var_9_4:AnimateLoop("InGameDisplay")

		if not CONDITIONS.InFrontend() then
			var_9_32:AnimateLoop("InGameDisplay")
		end
	end

	var_9_0._sequences.InGameDisplay = var_9_137

	local var_9_138
	local var_9_139 = {
		{
			value = 657930,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_9_4:RegisterAnimationSequence("WZMilitaryAppreciationIntro", var_9_139)

	if CONDITIONS.InFrontend() then
		local var_9_140 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_5:RegisterAnimationSequence("WZMilitaryAppreciationIntro", var_9_140)
	end

	local var_9_141 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 440,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 133
		},
		{
			duration = 440,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 830
		},
		{
			value = 1,
			duration = 440,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_7:RegisterAnimationSequence("WZMilitaryAppreciationIntro", var_9_141)

	local var_9_142 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -124
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -400
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 440,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_9:RegisterAnimationSequence("WZMilitaryAppreciationIntro", var_9_142)

	local var_9_143 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -126
		},
		{
			value = 1118481,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -400
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.5,
			duration = 440,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_11:RegisterAnimationSequence("WZMilitaryAppreciationIntro", var_9_143)

	local var_9_144 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -213
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -212
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -400
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 440,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_13:RegisterAnimationSequence("WZMilitaryAppreciationIntro", var_9_144)

	local var_9_145 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_15:RegisterAnimationSequence("WZMilitaryAppreciationIntro", var_9_145)

	local var_9_146 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -854
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 854
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 45
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_9_17:RegisterAnimationSequence("WZMilitaryAppreciationIntro", var_9_146)

	local var_9_147 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZFenceMessage
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -189
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -153
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -784
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 784
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 440,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_19:RegisterAnimationSequence("WZMilitaryAppreciationIntro", var_9_147)

	local var_9_148 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -148
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -170
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 170
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -138
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 440,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_21:RegisterAnimationSequence("WZMilitaryAppreciationIntro", var_9_148)

	if CONDITIONS.InFrontend() then
		local var_9_149 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_22:RegisterAnimationSequence("WZMilitaryAppreciationIntro", var_9_149)
	end

	local var_9_150 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -159
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -149
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_24:RegisterAnimationSequence("WZMilitaryAppreciationIntro", var_9_150)

	local var_9_151 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_26:RegisterAnimationSequence("WZMilitaryAppreciationIntro", var_9_151)

	local var_9_152 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -82
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -54
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 440,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_28:RegisterAnimationSequence("WZMilitaryAppreciationIntro", var_9_152)

	if CONDITIONS.InFrontend() then
		local var_9_153 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_9_31:RegisterAnimationSequence("WZMilitaryAppreciationIntro", var_9_153)
	end

	local var_9_154 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 330
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 356
		}
	}

	var_9_34:RegisterAnimationSequence("WZMilitaryAppreciationIntro", var_9_154)

	local var_9_155 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 391
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 413
		}
	}

	var_9_36:RegisterAnimationSequence("WZMilitaryAppreciationIntro", var_9_155)

	local var_9_156 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 371
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 389
		}
	}

	var_9_38:RegisterAnimationSequence("WZMilitaryAppreciationIntro", var_9_156)

	local function var_9_157()
		var_9_4:AnimateSequence("WZMilitaryAppreciationIntro")

		if CONDITIONS.InFrontend() then
			var_9_5:AnimateSequence("WZMilitaryAppreciationIntro")
		end

		var_9_7:AnimateSequence("WZMilitaryAppreciationIntro")
		var_9_9:AnimateSequence("WZMilitaryAppreciationIntro")
		var_9_11:AnimateSequence("WZMilitaryAppreciationIntro")
		var_9_13:AnimateSequence("WZMilitaryAppreciationIntro")
		var_9_15:AnimateSequence("WZMilitaryAppreciationIntro")
		var_9_17:AnimateSequence("WZMilitaryAppreciationIntro")
		var_9_19:AnimateSequence("WZMilitaryAppreciationIntro")
		var_9_21:AnimateSequence("WZMilitaryAppreciationIntro")

		if CONDITIONS.InFrontend() then
			var_9_22:AnimateSequence("WZMilitaryAppreciationIntro")
		end

		var_9_24:AnimateSequence("WZMilitaryAppreciationIntro")
		var_9_26:AnimateSequence("WZMilitaryAppreciationIntro")
		var_9_28:AnimateSequence("WZMilitaryAppreciationIntro")

		if CONDITIONS.InFrontend() then
			var_9_31:AnimateSequence("WZMilitaryAppreciationIntro")
		end

		var_9_34:AnimateSequence("WZMilitaryAppreciationIntro")
		var_9_36:AnimateSequence("WZMilitaryAppreciationIntro")
		var_9_38:AnimateSequence("WZMilitaryAppreciationIntro")
	end

	var_9_0._sequences.WZMilitaryAppreciationIntro = var_9_157

	local var_9_158

	if CONDITIONS.InFrontend() then
		local var_9_159 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_fence_dialog_server_queue_background")
			}
		}

		var_9_5:RegisterAnimationSequence("WZWipSetQueueDisplay", var_9_159)
	end

	local var_9_160 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_7:RegisterAnimationSequence("WZWipSetQueueDisplay", var_9_160)

	local var_9_161 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -258
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -222
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_19:RegisterAnimationSequence("WZWipSetQueueDisplay", var_9_161)

	local var_9_162 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 400
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 410
		}
	}

	var_9_21:RegisterAnimationSequence("WZWipSetQueueDisplay", var_9_162)

	local var_9_163 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -112
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -82
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_28:RegisterAnimationSequence("WZWipSetQueueDisplay", var_9_163)

	if CONDITIONS.InFrontend() then
		local var_9_164 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_icon_snipe_mw_warzone")
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -480
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 480
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -426
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -222
			}
		}

		var_9_31:RegisterAnimationSequence("WZWipSetQueueDisplay", var_9_164)
	end

	local var_9_165 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -189
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_9_34:RegisterAnimationSequence("WZWipSetQueueDisplay", var_9_165)

	local var_9_166 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 400
		}
	}

	var_9_36:RegisterAnimationSequence("WZWipSetQueueDisplay", var_9_166)

	local var_9_167 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 351
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 369
		}
	}

	var_9_38:RegisterAnimationSequence("WZWipSetQueueDisplay", var_9_167)

	local function var_9_168()
		if CONDITIONS.InFrontend() then
			var_9_5:AnimateSequence("WZWipSetQueueDisplay")
		end

		var_9_7:AnimateSequence("WZWipSetQueueDisplay")
		var_9_19:AnimateSequence("WZWipSetQueueDisplay")
		var_9_21:AnimateSequence("WZWipSetQueueDisplay")
		var_9_28:AnimateSequence("WZWipSetQueueDisplay")

		if CONDITIONS.InFrontend() then
			var_9_31:AnimateSequence("WZWipSetQueueDisplay")
		end

		var_9_34:AnimateSequence("WZWipSetQueueDisplay")
		var_9_36:AnimateSequence("WZWipSetQueueDisplay")
		var_9_38:AnimateSequence("WZWipSetQueueDisplay")
	end

	var_9_0._sequences.WZWipSetQueueDisplay = var_9_168

	local var_9_169
	local var_9_170 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_34:RegisterAnimationSequence("SetQueueDisplay", var_9_170)

	local var_9_171 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_36:RegisterAnimationSequence("SetQueueDisplay", var_9_171)

	local function var_9_172()
		var_9_34:AnimateSequence("SetQueueDisplay")
		var_9_36:AnimateSequence("SetQueueDisplay")
	end

	var_9_0._sequences.SetQueueDisplay = var_9_172

	var_0_4(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("FenceDialog", FenceDialog)
LockTable(_M)
