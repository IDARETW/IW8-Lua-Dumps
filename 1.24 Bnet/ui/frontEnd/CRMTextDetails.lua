module(..., package.seeall)

local var_0_0 = 12 * _1080p

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0._curDimensions = arg_1_1
end

local function var_0_2(arg_2_0)
	local var_2_0 = LAYOUT.GetTextWidth(arg_2_0.HeaderText)

	if var_2_0 > LAYOUT.GetElementWidth(arg_2_0.HeaderText) then
		arg_2_0:SetRight(arg_2_0._curDimensions.left + var_2_0 + var_0_0)
	end
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.BodyText:SetAlpha(0)
	arg_3_0.BodyText:setText(arg_3_1)

	local var_3_0 = LAYOUT.GetTextHeightWithWrapping(arg_3_0.BodyText, arg_3_0.BodyText:getText())

	if arg_3_2 then
		arg_3_0:SetBottom(arg_3_0._curDimensions.bottom + var_3_0 + arg_3_0._spacing)
	else
		arg_3_0:SetTop(arg_3_0._curDimensions.top - var_3_0 - arg_3_0._spacing)
	end

	arg_3_0.BodyText:SetAlpha(1)
end

local function var_0_4(arg_4_0, arg_4_1)
	arg_4_0._spacing = arg_4_1

	local var_4_0 = LAYOUT.GetElementHeight(arg_4_0.BodyText)
	local var_4_1 = arg_4_0.BodyText:GetCurrentAnchorsAndPositions().bottom

	arg_4_0.BodyText:SetTop(var_4_1 + arg_4_1)
	arg_4_0.BodyText:SetBottom(var_4_1 + arg_4_1 + var_4_0)
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.InitializeDimensions = var_0_1
	arg_5_0.UpdateDetails = var_0_3
	arg_5_0.UpdateTitleBacker = var_0_2
	arg_5_0.SetSpacing = var_0_4
	arg_5_0._curDimensions = nil
	arg_5_0._spacing = 0

	arg_5_0.BodyText:SetMask(arg_5_0.Mask)
	arg_5_0.Mask:SetAlpha(1)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_5_0, "AR")
	end
end

function CRMTextDetails(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 530 * _1080p, 0, 70 * _1080p)

	var_6_0.id = "CRMTextDetails"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Backer"

	var_6_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_6_4:SetAlpha(0.2, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Backer = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIStyledText.new()

	var_6_6.id = "BodyText"

	var_6_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_6:setText("", 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_6:SetShadowRGBFromInt(0, 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, _1080p * 525, _1080p * 71, _1080p * 95)
	var_6_0:addElement(var_6_6)

	var_6_0.BodyText = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIStyledText.new()

	var_6_8.id = "HeaderText"

	var_6_8:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_6_8:setText("", 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_8:SetWordWrap(false)
	var_6_8:SetAlignment(LUI.Alignment.Left)
	var_6_8:SetShadowMaxDistance(0.2, 0)
	var_6_8:SetShadowRGBFromInt(0, 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, _1080p * 525, 0, _1080p * 70)
	var_6_0:addElement(var_6_8)

	var_6_0.HeaderText = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIImage.new()

	var_6_10.id = "Mask"

	var_6_10:SetAlpha(0, 0)
	var_6_10:setImage(RegisterMaterial("stencil_mask"), 0)
	var_6_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * 12, 0, 0)
	var_6_0:addElement(var_6_10)

	var_6_0.Mask = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("PromptButton", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "Prompt"

	var_6_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 5, _1080p * 525, 0, _1080p * 32)
	var_6_0:addElement(var_6_12)

	var_6_0.Prompt = var_6_12

	local var_6_13
	local var_6_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 525
		}
	}

	var_6_6:RegisterAnimationSequence("DefaultSequence", var_6_14)

	local var_6_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_8:RegisterAnimationSequence("DefaultSequence", var_6_15)

	local var_6_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 12
		}
	}

	var_6_10:RegisterAnimationSequence("DefaultSequence", var_6_16)

	local function var_6_17()
		var_6_6:AnimateSequence("DefaultSequence")
		var_6_8:AnimateSequence("DefaultSequence")
		var_6_10:AnimateSequence("DefaultSequence")
	end

	var_6_0._sequences.DefaultSequence = var_6_17

	local var_6_18
	local var_6_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 103
		}
	}

	var_6_6:RegisterAnimationSequence("AR", var_6_19)

	local function var_6_20()
		var_6_6:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_20

	local var_6_21
	local var_6_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 40
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("HideTitle", var_6_22)

	local var_6_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		}
	}

	var_6_6:RegisterAnimationSequence("HideTitle", var_6_23)

	local var_6_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("HideTitle", var_6_24)

	local var_6_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 20
		}
	}

	var_6_12:RegisterAnimationSequence("HideTitle", var_6_25)

	local function var_6_26()
		var_6_4:AnimateSequence("HideTitle")
		var_6_6:AnimateSequence("HideTitle")
		var_6_8:AnimateSequence("HideTitle")
		var_6_12:AnimateSequence("HideTitle")
	end

	var_6_0._sequences.HideTitle = var_6_26

	local var_6_27
	local var_6_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 40
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("HideTitleAR", var_6_28)

	local var_6_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 46
		}
	}

	var_6_6:RegisterAnimationSequence("HideTitleAR", var_6_29)

	local var_6_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("HideTitleAR", var_6_30)

	local var_6_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 525
		}
	}

	var_6_12:RegisterAnimationSequence("HideTitleAR", var_6_31)

	local function var_6_32()
		var_6_4:AnimateSequence("HideTitleAR")
		var_6_6:AnimateSequence("HideTitleAR")
		var_6_8:AnimateSequence("HideTitleAR")
		var_6_12:AnimateSequence("HideTitleAR")
	end

	var_6_0._sequences.HideTitleAR = var_6_32

	local var_6_33
	local var_6_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BLM.Body
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1606
		}
	}

	var_6_6:RegisterAnimationSequence("BLM", var_6_34)

	local var_6_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BLM.Title
		}
	}

	var_6_8:RegisterAnimationSequence("BLM", var_6_35)

	local var_6_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1088
		}
	}

	var_6_10:RegisterAnimationSequence("BLM", var_6_36)

	local function var_6_37()
		var_6_6:AnimateSequence("BLM")
		var_6_8:AnimateSequence("BLM")
		var_6_10:AnimateSequence("BLM")
	end

	var_6_0._sequences.BLM = var_6_37

	var_0_5(var_6_0, var_6_1, arg_6_1)
	ACTIONS.AnimateSequence(var_6_0, "DefaultSequence")

	return var_6_0
end

MenuBuilder.registerType("CRMTextDetails", CRMTextDetails)
LockTable(_M)
