module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
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

local function var_0_1(arg_5_0, arg_5_1)
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

local function var_0_2(arg_7_0, arg_7_1, arg_7_2)
	assert(arg_7_0.Background)
	assert(arg_7_0.Message)

	arg_7_0.SetupCancelButton = var_0_0
	arg_7_0._controllerIndex = arg_7_1

	arg_7_0.Message:setText(arg_7_2.message)

	if arg_7_2.useProgress then
		ACTIONS.AnimateSequence(arg_7_0, "ShowProgress")

		function arg_7_0.SetProgress(arg_8_0, arg_8_1)
			arg_8_0.Progress:SetProgress(arg_8_1, 0, nil)
		end
	end

	if arg_7_2.onCancel then
		var_0_0(arg_7_0, arg_7_2.onCancel, arg_7_2.showExit)
	elseif arg_7_2.buttons then
		var_0_1(arg_7_0, arg_7_2.buttons)
	else
		arg_7_0.ButtonHelperBar:SetAlpha(0)
	end

	ACTIONS.ScaleFullscreen(arg_7_0.Darkener)
	LUI.TextChat.SetupMenuForNoChat(arg_7_0)

	if not arg_7_2.disableIntro then
		ACTIONS.AnimateSequence(arg_7_0, "Intro")
	end

	if arg_7_2.showExit then
		ACTIONS.AnimateSequence(arg_7_0.Spinner, "Hide")
	end

	if arg_7_2.isGeneric then
		ACTIONS.AnimateSequence(arg_7_0, "GenericLogo")
	elseif Engine.CJJAFGIFAC(arg_7_1) then
		if not Engine.CFHBIHABCB(arg_7_1) then
			ACTIONS.AnimateSequence(arg_7_0, "WarzoneLogo")
		end
	else
		ACTIONS.AnimateSequence(arg_7_0, "HybridLogo")
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
	local var_9_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_9_1
	})

	var_9_6.id = "GenericPopupWindow"

	var_9_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 856, _1080p * -230, _1080p * 230)
	var_9_0:addElement(var_9_6)

	var_9_0.GenericPopupWindow = var_9_6

	local var_9_7
	local var_9_8 = MenuBuilder.BuildRegisteredType("GenericBoxFillAndStroke", {
		controllerIndex = var_9_1
	})

	var_9_8.id = "Background"

	var_9_8:SetAlpha(0, 0)
	var_9_8:SetPixelGridEnabled(true)
	var_9_8:SetPixelGridContrast(0.5, 0)
	var_9_8:SetPixelGridBlockWidth(2, 0)
	var_9_8:SetPixelGridBlockHeight(2, 0)
	var_9_8:SetPixelGridGutterWidth(1, 0)
	var_9_8:SetPixelGridGutterHeight(1, 0)
	var_9_8.Fill:SetRGBFromInt(3355443, 0)
	var_9_8.Fill:SetAlpha(0, 0)
	var_9_8.Stroke:SetRGBFromTable(SWATCHES.genericMenu.frame, 0)
	var_9_8.Stroke:SetAlpha(0, 0)
	var_9_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 854, _1080p * 45, _1080p * 45)
	var_9_0:addElement(var_9_8)

	var_9_0.Background = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIText.new()

	var_9_10.id = "Message"

	var_9_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_9_10:setText("", 0)
	var_9_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_10:SetAlignment(LUI.Alignment.Center)
	var_9_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -784, _1080p * 784, _1080p * -31, _1080p * 5)
	var_9_0:addElement(var_9_10)

	var_9_0.Message = var_9_10

	local var_9_11
	local var_9_12 = MenuBuilder.BuildRegisteredType("FenceSpinner", {
		controllerIndex = var_9_1
	})

	var_9_12.id = "Spinner"

	var_9_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -170, _1080p * 170, _1080p * 126, _1080p * 136)
	var_9_0:addElement(var_9_12)

	var_9_0.Spinner = var_9_12

	local var_9_13
	local var_9_14 = LUI.UIImage.new()

	var_9_14.id = "Image"

	var_9_14:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_9_14:SetAlpha(0.6, 0)
	var_9_14:setImage(RegisterMaterial("mm_element_logo_white"), 0)
	var_9_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -260, _1080p * 260, _1080p * -266, _1080p * 30)
	var_9_0:addElement(var_9_14)

	var_9_0.Image = var_9_14

	local var_9_15
	local var_9_16 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_9_1
	})

	var_9_16.id = "Progress"

	var_9_16:SetAlpha(0, 0)
	var_9_16.Fill:SetRGBFromTable(SWATCHES.CAC.weaponMeterMain, 0)
	var_9_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -140, _1080p * 140, _1080p * 40, _1080p * 50)
	var_9_0:addElement(var_9_16)

	var_9_0.Progress = var_9_16

	local var_9_17
	local var_9_18 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_9_1
	})

	var_9_18.id = "ButtonHelperBar"

	var_9_18.Background:SetAlpha(0.2, 0)
	var_9_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, _1080p * 1020, _1080p * 1080)
	var_9_0:addElement(var_9_18)

	var_9_0.ButtonHelperBar = var_9_18

	local var_9_19
	local var_9_20 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_9_1
	})

	var_9_20.id = "CancelPrompt"

	if CONDITIONS.AlwaysFalse(var_9_0) then
		var_9_20.Label:setText("ButtonPrompt", 0)
	end

	var_9_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * 251, _1080p * 282)
	var_9_0:addElement(var_9_20)

	var_9_0.CancelPrompt = var_9_20

	local function var_9_21()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_21

	local var_9_22
	local var_9_23 = {
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

	var_9_8:RegisterAnimationSequence("Intro", var_9_23)

	local var_9_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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

	var_9_10:RegisterAnimationSequence("Intro", var_9_24)

	local var_9_25 = {
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

	var_9_12:RegisterAnimationSequence("Intro", var_9_25)

	local var_9_26 = {
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

	var_9_14:RegisterAnimationSequence("Intro", var_9_26)

	local var_9_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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

	var_9_20:RegisterAnimationSequence("Intro", var_9_27)

	local function var_9_28()
		var_9_8:AnimateSequence("Intro")
		var_9_10:AnimateSequence("Intro")
		var_9_12:AnimateSequence("Intro")
		var_9_14:AnimateSequence("Intro")
		var_9_20:AnimateSequence("Intro")
	end

	var_9_0._sequences.Intro = var_9_28

	local var_9_29
	local var_9_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("ShowProgress", var_9_30)

	local function var_9_31()
		var_9_16:AnimateSequence("ShowProgress")
	end

	var_9_0._sequences.ShowProgress = var_9_31

	local var_9_32
	local var_9_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("logo_wz_shadow")
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -197
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -237
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 197
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -13
		}
	}

	var_9_14:RegisterAnimationSequence("WarzoneLogo", var_9_33)

	local function var_9_34()
		var_9_14:AnimateSequence("WarzoneLogo")
	end

	var_9_0._sequences.WarzoneLogo = var_9_34

	local var_9_35
	local var_9_36 = {
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

	var_9_14:RegisterAnimationSequence("GenericLogo", var_9_36)

	local function var_9_37()
		var_9_14:AnimateSequence("GenericLogo")
	end

	var_9_0._sequences.GenericLogo = var_9_37

	local var_9_38
	local var_9_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("logo_cod_warzone_mw_shadow")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 160
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -160
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -280
		}
	}

	var_9_14:RegisterAnimationSequence("HybridLogo", var_9_39)

	local function var_9_40()
		var_9_14:AnimateSequence("HybridLogo")
	end

	var_9_0._sequences.HybridLogo = var_9_40

	var_0_2(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("FenceDialog", FenceDialog)
LockTable(_M)
