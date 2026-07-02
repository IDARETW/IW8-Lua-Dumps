module(..., package.seeall)

function MaximizeVideo(arg_1_0)
	arg_1_0:SetAlpha(1)
	ACTIONS.AnimateSequence(arg_1_0, "Maximize")
end

local function var_0_0(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_2.title)
	MaximizeVideo(arg_2_0)
	arg_2_0.Title:setText(arg_2_2.title)
	arg_2_0:SetHandleMouse(true)

	local var_2_0 = LUI.UIBindButton.new()

	var_2_0.id = "selfBindButton"

	arg_2_0:addElement(var_2_0)

	arg_2_0.bindButton = var_2_0

	arg_2_0.bindButton:addEventHandler("button_secondary", function(arg_3_0, arg_3_1)
		Engine.EBCGADABJ()
		ACTIONS.LeaveMenu(arg_2_0)
	end)
	arg_2_0.bindButton:addEventHandler("button_select", function(arg_4_0, arg_4_1)
		Engine.EBCGADABJ()
		ACTIONS.LeaveMenu(arg_2_0)
	end)
	arg_2_0.bindButton:addEventHandler("button_right_stick", function(arg_5_0, arg_5_1)
		if LUI.IsLastInputKeyboardMouse(arg_2_1) then
			Engine.EBCGADABJ()
			ACTIONS.LeaveMenu(arg_5_0)
		end
	end)
	arg_2_0:registerEventHandler("leftmouseup", function(arg_6_0, arg_6_1)
		Engine.EBCGADABJ()
		ACTIONS.LeaveMenu(arg_6_0)
	end)

	local function var_2_1(arg_7_0, arg_7_1)
		if LUI.IsLastInputKeyboardMouse(arg_7_1.controllerIndex) then
			arg_7_0.FullScreenPromptText:SetAlpha(0)
			ACTIONS.AnimateSequence(arg_7_0, "Kbm")
		else
			arg_7_0.FullScreenPromptText:SetAlpha(1)
			ACTIONS.AnimateSequence(arg_7_0, "Gamepad")
		end

		arg_7_0.FullScreenPromptText:setText(Engine.CBBHFCGDIC("PLATFORM/BACK"))
	end

	ACTIONS.AnimateSequence(arg_2_0.ExitFullscreenVideoButton.ExitFullscreenButton, "Maximized")
	arg_2_0:addAndCallEventHandler("update_input_type", var_2_1, {
		controllerIndex = arg_2_1
	})
	LUI.TextChat.SetupMenuForNoChat(arg_2_0)

	if arg_2_2.videoRef then
		Engine.DFCGFCGBFD(arg_2_2.videoRef, arg_2_2.videoFlags)
	end
end

function TutorialVideoMaximized(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_8_0.id = "TutorialVideoMaximized"
	var_8_0._animationSets = {}
	var_8_0._sequences = {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Darkener"

	var_8_4:SetRGBFromInt(0, 0)
	var_8_4:SetAlpha(0.8, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.Darkener = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "Cinematic"

	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -563, _1080p * 563, _1080p * -370, _1080p * 262)
	var_8_0:addElement(var_8_6)

	var_8_0.Cinematic = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIStyledText.new()

	var_8_8.id = "FullScreenPromptText"

	var_8_8:setText(Engine.CBBHFCGDIC("PLATFORM/BACK"), 0)
	var_8_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_8:SetWordWrap(false)
	var_8_8:SetAlignment(LUI.Alignment.Center)
	var_8_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -220, _1080p * 220, _1080p * 297, _1080p * 318)
	var_8_0:addElement(var_8_8)

	var_8_0.FullScreenPromptText = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIText.new()

	var_8_10.id = "Title"

	var_8_10:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_8_10:SetAlpha(0.7, 0)
	var_8_10:setText("", 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_10:SetAlignment(LUI.Alignment.Center)
	var_8_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -590, _1080p * 590, _1080p * -409, _1080p * -379)
	var_8_0:addElement(var_8_10)

	var_8_0.Title = var_8_10

	local var_8_11
	local var_8_12 = MenuBuilder.BuildRegisteredType("DiagonalCorners", {
		controllerIndex = var_8_1
	})

	var_8_12.id = "DiagonalCorners"

	var_8_12:SetAlpha(0, 0)
	var_8_12:SetScale(0.02, 0)
	var_8_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 579, _1080p * -579, _1080p * 282, _1080p * -386)
	var_8_0:addElement(var_8_12)

	var_8_0.DiagonalCorners = var_8_12

	local var_8_13
	local var_8_14 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_8_15 = LUI.UIBorder.new(var_8_14)

	var_8_15.id = "ClipBorder"

	var_8_15:SetRGBFromInt(8684676, 0)
	var_8_15:SetAlpha(0.7, 0)
	var_8_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -563, _1080p * 563, _1080p * -370, _1080p * 262)
	var_8_0:addElement(var_8_15)

	var_8_0.ClipBorder = var_8_15

	local var_8_16
	local var_8_17 = MenuBuilder.BuildRegisteredType("ExitFullscreenVideoButton", {
		controllerIndex = var_8_1
	})

	var_8_17.id = "ExitFullscreenVideoButton"

	var_8_17:SetAlpha(0, 0)
	var_8_17.ExitFullscreenButton:SetLeft(_1080p * -38, 0)
	var_8_17.ExitFullscreenButton:SetRight(_1080p * -6, 0)
	var_8_17.ExitFullscreenButton:SetTop(_1080p * -37, 0)
	var_8_17.ExitFullscreenButton:SetBottom(_1080p * -6, 0)
	var_8_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -563, _1080p * 563, _1080p * -370, _1080p * 262)
	var_8_0:addElement(var_8_17)

	var_8_0.ExitFullscreenVideoButton = var_8_17

	local function var_8_18()
		var_8_17:AnimateSequence("DefaultSequence")
	end

	var_8_0._sequences.DefaultSequence = var_8_18

	local var_8_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_8_4:RegisterAnimationSequence("Maximize", var_8_19)

	local var_8_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.5,
			duration = 70,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_8_6:RegisterAnimationSequence("Maximize", var_8_20)

	local var_8_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_8_8:RegisterAnimationSequence("Maximize", var_8_21)

	local var_8_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.7,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_8_10:RegisterAnimationSequence("Maximize", var_8_22)

	local var_8_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outBack
		}
	}

	var_8_12:RegisterAnimationSequence("Maximize", var_8_23)

	local var_8_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.5,
			duration = 70,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.7,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_8_15:RegisterAnimationSequence("Maximize", var_8_24)

	local var_8_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 262
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -625,
			child = var_8_0.ExitFullscreenVideoButton.ExitFullscreenButton
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -595,
			child = var_8_0.ExitFullscreenVideoButton.ExitFullscreenButton
		}
	}

	var_8_17:RegisterAnimationSequence("Maximize", var_8_25)

	local function var_8_26()
		var_8_4:AnimateSequence("Maximize")
		var_8_6:AnimateSequence("Maximize")
		var_8_8:AnimateSequence("Maximize")
		var_8_10:AnimateSequence("Maximize")
		var_8_12:AnimateSequence("Maximize")
		var_8_15:AnimateSequence("Maximize")
		var_8_17:AnimateSequence("Maximize")
	end

	var_8_0._sequences.Maximize = var_8_26

	local var_8_27 = {
		{
			value = 0.02,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = -0.01,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_8_12:RegisterAnimationSequence("ButtonOver", var_8_27)

	local var_8_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_8_15:RegisterAnimationSequence("ButtonOver", var_8_28)

	local var_8_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_17:RegisterAnimationSequence("ButtonOver", var_8_29)

	local function var_8_30()
		var_8_12:AnimateSequence("ButtonOver")
		var_8_15:AnimateSequence("ButtonOver")
		var_8_17:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_30

	local var_8_31 = {
		{
			value = -0.01,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.02,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_8_12:RegisterAnimationSequence("ButtonUp", var_8_31)

	local var_8_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_17:RegisterAnimationSequence("ButtonUp", var_8_32)

	local function var_8_33()
		var_8_12:AnimateSequence("ButtonUp")
		var_8_17:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_33

	local var_8_34 = {
		{
			value = 0.02,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_8_12:RegisterAnimationSequence("Kbm", var_8_34)

	local var_8_35 = {
		{
			value = 0,
			duration = 240,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 130,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 1780,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 260,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_17:RegisterAnimationSequence("Kbm", var_8_35)

	local function var_8_36()
		var_8_12:AnimateSequence("Kbm")
		var_8_17:AnimateSequence("Kbm")
	end

	var_8_0._sequences.Kbm = var_8_36

	local var_8_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_17:RegisterAnimationSequence("Gamepad", var_8_37)

	local function var_8_38()
		var_8_17:AnimateSequence("Gamepad")
	end

	var_8_0._sequences.Gamepad = var_8_38

	var_8_4:addEventHandler("menu_create", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_8_1
		end

		ACTIONS.ScaleFullscreen(var_8_0)
	end)
	var_8_17:addEventHandler("button_over", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "ButtonOver")
	end)
	var_8_17:addEventHandler("button_up", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "ButtonUp")
	end)
	var_0_0(var_8_0, var_8_1, arg_8_1)
	ACTIONS.AnimateSequence(var_8_0, "DefaultSequence")

	return var_8_0
end

MenuBuilder.registerType("TutorialVideoMaximized", TutorialVideoMaximized)
LockTable(_M)
