module(..., package.seeall)

function MiniAttachmentButton(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 78 * _1080p)

	var_1_0.id = "MiniAttachmentButton"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIBlur.new()

	var_1_4.id = "BlurBackground"

	var_1_4:SetRGBFromInt(6710886, 0)
	var_1_4:SetAlpha(0, 0)
	var_1_4:SetBlurStrength(2, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 38, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.BlurBackground = var_1_4

	local var_1_5
	local var_1_6 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_7 = LUI.UIBorder.new(var_1_6)

	var_1_7.id = "Border"

	var_1_7:SetAlpha(0.2, 0)
	var_1_7:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 38, 0)
	var_1_0:addElement(var_1_7)

	var_1_0.Border = var_1_7

	local var_1_8
	local var_1_9 = LUI.UIImage.new()

	var_1_9.id = "Lock"

	var_1_9:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_1_9:SetAlpha(0, 0)
	var_1_9:setImage(RegisterMaterial("icon_lock"), 0)
	var_1_9:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -82, _1080p * -56, _1080p * 6, _1080p * 32)
	var_1_0:addElement(var_1_9)

	var_1_0.Lock = var_1_9

	local var_1_10
	local var_1_11 = MenuBuilder.BuildRegisteredType("MiniAttachments", {
		controllerIndex = var_1_1
	})

	var_1_11.id = "MiniAttachments"

	var_1_11:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 8, _1080p * 200, _1080p * -35, _1080p * -5)
	var_1_0:addElement(var_1_11)

	var_1_0.MiniAttachments = var_1_11

	local var_1_12
	local var_1_13 = LUI.UIStyledText.new()

	var_1_13.id = "Attachments"

	var_1_13:setText("ATTACHMENTS", 0)
	var_1_13:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_13:SetAlignment(LUI.Alignment.Left)
	var_1_13:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 12, _1080p * 36)
	var_1_0:addElement(var_1_13)

	var_1_0.Attachments = var_1_13

	local function var_1_14()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_14

	local var_1_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonOver", var_1_15)

	local var_1_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_7:RegisterAnimationSequence("ButtonOver", var_1_16)

	local var_1_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 111
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 137
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_9:RegisterAnimationSequence("ButtonOver", var_1_17)

	local var_1_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_1_13:RegisterAnimationSequence("ButtonOver", var_1_18)

	local function var_1_19()
		var_1_4:AnimateSequence("ButtonOver")
		var_1_7:AnimateSequence("ButtonOver")
		var_1_9:AnimateSequence("ButtonOver")
		var_1_13:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_19

	local var_1_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonUp", var_1_20)

	local var_1_21 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_7:RegisterAnimationSequence("ButtonUp", var_1_21)

	local var_1_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -29
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -3
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_9:RegisterAnimationSequence("ButtonUp", var_1_22)

	local var_1_23 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_13:RegisterAnimationSequence("ButtonUp", var_1_23)

	local function var_1_24()
		var_1_4:AnimateSequence("ButtonUp")
		var_1_7:AnimateSequence("ButtonUp")
		var_1_9:AnimateSequence("ButtonUp")
		var_1_13:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_24

	local var_1_25 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_9:RegisterAnimationSequence("ButtonOverDisabled", var_1_25)

	local function var_1_26()
		var_1_9:AnimateSequence("ButtonOverDisabled")
	end

	var_1_0._sequences.ButtonOverDisabled = var_1_26

	local var_1_27 = {
		{
			value = 11711405,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_9:RegisterAnimationSequence("ButtonUpDisabled", var_1_27)

	local function var_1_28()
		var_1_9:AnimateSequence("ButtonUpDisabled")
	end

	var_1_0._sequences.ButtonUpDisabled = var_1_28

	var_1_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)
	var_1_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
	end)
	var_1_0:addEventHandler("button_disable", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUpDisabled")
	end)
	var_1_0:addEventHandler("button_over_disable", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOverDisabled")
	end)

	return var_1_0
end

MenuBuilder.registerType("MiniAttachmentButton", MiniAttachmentButton)
LockTable(_M)
