module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.title)
	assert(arg_1_2.image)
	assert(arg_1_0.Title)
	assert(arg_1_0.Image)
	ACTIONS.AnimateSequence(arg_1_0, "Maximize")
	arg_1_0.Title:setText(arg_1_2.title)
	arg_1_0.Image:setImage(RegisterMaterial(arg_1_2.image))

	local function var_1_0(arg_2_0, arg_2_1)
		if LUI.IsLastInputKeyboardMouse(arg_2_1.controllerIndex) then
			arg_2_0.FullscreenButton:SetAlpha(1)
			arg_2_0.FullScreenPromptText:SetAlpha(0)
		else
			arg_2_0.FullscreenButton:SetAlpha(0)
			arg_2_0.FullScreenPromptText:SetAlpha(1)
		end

		arg_2_0.FullScreenPromptText:setText(Engine.CBBHFCGDIC("PLATFORM/BACK"))
	end

	arg_1_0:addAndCallEventHandler("update_input_type", var_1_0, {
		controllerIndex = arg_1_1
	})
end

function ImageMaximized(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "ImageMaximized"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Darkener"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAlpha(0.8, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Darkener = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Image"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 397, _1080p * 1523, _1080p * 170, _1080p * 802)
	var_3_0:addElement(var_3_6)

	var_3_0.Image = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "FullScreenPromptText"

	var_3_8:setText(Engine.CBBHFCGDIC("PLATFORM/BACK"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -220, _1080p * 220, _1080p * 297, _1080p * 318)
	var_3_0:addElement(var_3_8)

	var_3_0.FullScreenPromptText = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "Title"

	var_3_10:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_10:SetAlpha(0.7, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -590, _1080p * 590, _1080p * -409, _1080p * -379)
	var_3_0:addElement(var_3_10)

	var_3_0.Title = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("DiagonalCorners", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "DiagonalCorners"

	var_3_12:SetAlpha(0, 0)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -576, _1080p * 575, _1080p * -385, _1080p * 276)
	var_3_0:addElement(var_3_12)

	var_3_0.DiagonalCorners = var_3_12

	local var_3_13
	local var_3_14 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_3_15 = LUI.UIBorder.new(var_3_14)

	var_3_15.id = "ClipBorder"

	var_3_15:SetRGBFromTable(SWATCHES.CAC.labelText, 0)
	var_3_15:SetAlpha(0.7, 0)
	var_3_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -563, _1080p * 563, _1080p * -370, _1080p * 262)
	var_3_0:addElement(var_3_15)

	var_3_0.ClipBorder = var_3_15

	local var_3_16
	local var_3_17 = MenuBuilder.BuildRegisteredType("FullscreenButton", {
		controllerIndex = var_3_1
	})

	var_3_17.id = "FullscreenButton"

	var_3_17:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -469, _1080p * -406, _1080p * -319, _1080p * -286)
	var_3_0:addElement(var_3_17)

	var_3_0.FullscreenButton = var_3_17

	local function var_3_18()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_18

	local var_3_19 = {
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

	var_3_4:RegisterAnimationSequence("Maximize", var_3_19)

	local var_3_20 = {
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

	var_3_6:RegisterAnimationSequence("Maximize", var_3_20)

	local var_3_21 = {
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

	var_3_8:RegisterAnimationSequence("Maximize", var_3_21)

	local var_3_22 = {
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

	var_3_10:RegisterAnimationSequence("Maximize", var_3_22)

	local var_3_23 = {
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

	var_3_12:RegisterAnimationSequence("Maximize", var_3_23)

	local var_3_24 = {
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

	var_3_15:RegisterAnimationSequence("Maximize", var_3_24)

	local var_3_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 220,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_17:RegisterAnimationSequence("Maximize", var_3_25)

	local function var_3_26()
		var_3_4:AnimateSequence("Maximize")
		var_3_6:AnimateSequence("Maximize")
		var_3_8:AnimateSequence("Maximize")
		var_3_10:AnimateSequence("Maximize")
		var_3_12:AnimateSequence("Maximize")
		var_3_15:AnimateSequence("Maximize")
		var_3_17:AnimateSequence("Maximize")
	end

	var_3_0._sequences.Maximize = var_3_26

	var_3_4:addEventHandler("menu_create", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_3_1
		end

		ACTIONS.ScaleFullscreen(var_3_0.Darkener)
	end)
	var_3_17:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_3_1
		end

		ACTIONS.AnimateSequenceByElement(var_3_0, {
			elementPath = "self.FullscreenButton",
			sequenceName = "UnFocus",
			elementName = "FullscreenButton"
		})
	end)
	var_3_17:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_3_1
		end

		ACTIONS.AnimateSequenceByElement(var_3_0, {
			elementPath = "self.FullscreenButton",
			sequenceName = "Focus",
			elementName = "FullscreenButton"
		})
	end)
	var_3_17:addEventHandler("enable", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_3_1
		end

		ACTIONS.AnimateSequenceByElement(var_3_0, {
			elementPath = "self.FullscreenButton",
			sequenceName = "Focus",
			elementName = "FullscreenButton"
		})
	end)
	var_3_0:addEventHandler("gamepad_button", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_3_1
		end

		if CONDITIONS.ButtonSecondary(var_3_0, arg_10_1) then
			ACTIONS.LeaveMenu(var_3_0)
		end
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ImageMaximized", ImageMaximized)
LockTable(_M)
