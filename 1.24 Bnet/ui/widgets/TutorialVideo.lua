module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if CONDITIONS.IsMenuInStack("OperatorBio") then
		assert(arg_1_0.FullscreenVideoButton)

		local function var_1_0(arg_2_0, arg_2_1)
			if LUI.IsLastInputKeyboardMouse(arg_2_1.controllerIndex) then
				arg_2_0.FullscreenVideoButton:SetAlpha(1)
			else
				arg_2_0.FullscreenVideoButton:SetAlpha(0)
			end
		end

		arg_1_0:addAndCallEventHandler("update_input_type", var_1_0, {
			controllerIndex = arg_1_1
		})
	end

	arg_1_0:SetHandleMouseMove(true)
end

function TutorialVideo(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 456 * _1080p, 0, 256 * _1080p)

	var_3_0.id = "TutorialVideo"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Mask"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAlpha(0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Mask = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("DiagonalCorners", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "DiagonalCorners"

	var_3_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -6, _1080p * 6, _1080p * -6, _1080p * 6)
	var_3_0:addElement(var_3_6)

	var_3_0.DiagonalCorners = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Cinematic"

	var_3_0:addElement(var_3_8)

	var_3_0.Cinematic = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "BioOverlay"

	var_3_10:SetPixelGridEnabled(true)
	var_3_10:SetPixelGridContrast(0.5, 0)
	var_3_10:SetPixelGridBlockWidth(2, 0)
	var_3_10:SetPixelGridBlockHeight(2, 0)
	var_3_10:SetPixelGridGutterWidth(1, 0)
	var_3_10:SetPixelGridGutterHeight(1, 0)
	var_3_10:setImage(RegisterMaterial("ui_operator_bio_bink_overlay"), 0)
	var_3_0:addElement(var_3_10)

	var_3_0.BioOverlay = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "FadeCover"

	var_3_12:SetRGBFromInt(0, 0)
	var_3_12:SetAlpha(0, 0)
	var_3_0:addElement(var_3_12)

	var_3_0.FadeCover = var_3_12

	local var_3_13
	local var_3_14 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_3_15 = LUI.UIBorder.new(var_3_14)

	var_3_15.id = "ClipBorder"

	var_3_15:SetRGBFromInt(8684676, 0)
	var_3_15:SetAlpha(0.7, 0)
	var_3_0:addElement(var_3_15)

	var_3_0.ClipBorder = var_3_15

	local var_3_16

	if CONDITIONS.IsMenuInStack("OperatorBio") then
		var_3_16 = MenuBuilder.BuildRegisteredType("FullscreenVideoButton", {
			controllerIndex = var_3_1
		})
		var_3_16.id = "FullscreenVideoButton"

		var_3_16.FullscreenButton:SetLeft(_1080p * -38, 0)
		var_3_16.FullscreenButton:SetRight(_1080p * -6, 0)
		var_3_16.FullscreenButton:SetTop(_1080p * -37, 0)
		var_3_16.FullscreenButton:SetBottom(_1080p * -6, 0)
		var_3_16:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_3_0:addElement(var_3_16)

		var_3_0.FullscreenVideoButton = var_3_16
	end

	local var_3_17

	if CONDITIONS.IsMenuInStack("OperatorBio") then
		local var_3_18 = {
			{
				value = 1,
				duration = 2700,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0,
				duration = 470,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_3_16:RegisterAnimationSequence("DefaultSequence", var_3_18)
	end

	local function var_3_19()
		if CONDITIONS.IsMenuInStack("OperatorBio") then
			var_3_16:AnimateSequence("DefaultSequence")
		end
	end

	var_3_0._sequences.DefaultSequence = var_3_19

	local var_3_20
	local var_3_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_12:RegisterAnimationSequence("Fade", var_3_21)

	local function var_3_22()
		var_3_12:AnimateSequence("Fade")
	end

	var_3_0._sequences.Fade = var_3_22

	local var_3_23
	local var_3_24 = {
		{
			value = 0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonUp", var_3_24)

	local var_3_25 = {
		{
			value = 0.03,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_8:RegisterAnimationSequence("ButtonUp", var_3_25)

	local var_3_26 = {
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_10:RegisterAnimationSequence("ButtonUp", var_3_26)

	local var_3_27 = {
		{
			value = 0.03,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_15:RegisterAnimationSequence("ButtonUp", var_3_27)

	if CONDITIONS.IsMenuInStack("OperatorBio") then
		local var_3_28 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0.01,
				duration = 0,
				property = TWEEN_PROPERTY.Scale
			},
			{
				value = 0,
				duration = 50,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0,
				duration = 60,
				property = TWEEN_PROPERTY.Scale
			}
		}

		var_3_16:RegisterAnimationSequence("ButtonUp", var_3_28)
	end

	local function var_3_29()
		var_3_6:AnimateSequence("ButtonUp")
		var_3_8:AnimateSequence("ButtonUp")
		var_3_10:AnimateSequence("ButtonUp")
		var_3_15:AnimateSequence("ButtonUp")

		if CONDITIONS.IsMenuInStack("OperatorBio") then
			var_3_16:AnimateSequence("ButtonUp")
		end
	end

	var_3_0._sequences.ButtonUp = var_3_29

	local var_3_30
	local var_3_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.05,
			duration = 60,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonOver", var_3_31)

	local var_3_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.03,
			duration = 60,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_8:RegisterAnimationSequence("ButtonOver", var_3_32)

	local var_3_33 = {
		{
			value = 0.03,
			duration = 60,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_10:RegisterAnimationSequence("ButtonOver", var_3_33)

	local var_3_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.03,
			duration = 60,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_15:RegisterAnimationSequence("ButtonOver", var_3_34)

	if CONDITIONS.IsMenuInStack("OperatorBio") then
		local var_3_35 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Scale
			},
			{
				value = 1,
				duration = 40,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0.02,
				duration = 60,
				property = TWEEN_PROPERTY.Scale
			}
		}

		var_3_16:RegisterAnimationSequence("ButtonOver", var_3_35)
	end

	local function var_3_36()
		var_3_6:AnimateSequence("ButtonOver")
		var_3_8:AnimateSequence("ButtonOver")
		var_3_10:AnimateSequence("ButtonOver")
		var_3_15:AnimateSequence("ButtonOver")

		if CONDITIONS.IsMenuInStack("OperatorBio") then
			var_3_16:AnimateSequence("ButtonOver")
		end
	end

	var_3_0._sequences.ButtonOver = var_3_36

	local var_3_37
	local var_3_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("MaskFadeOut", var_3_38)

	local function var_3_39()
		var_3_4:AnimateSequence("MaskFadeOut")
	end

	var_3_0._sequences.MaskFadeOut = var_3_39

	if CONDITIONS.IsMenuInStack("OperatorBio") then
		var_3_16:addEventHandler("button_over", function(arg_9_0, arg_9_1)
			if not arg_9_1.controller then
				local var_9_0 = var_3_1
			end

			ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
		end)
		var_3_16:addEventHandler("button_up", function(arg_10_0, arg_10_1)
			if not arg_10_1.controller then
				local var_10_0 = var_3_1
			end

			ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
		end)
	end

	var_3_0:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
	end)
	var_3_0:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "DefaultSequence")

	return var_3_0
end

MenuBuilder.registerType("TutorialVideo", TutorialVideo)
LockTable(_M)
