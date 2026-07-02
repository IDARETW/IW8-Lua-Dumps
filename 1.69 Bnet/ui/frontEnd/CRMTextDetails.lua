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

local function var_0_3(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	arg_3_0.BodyText:SetAlpha(0)
	arg_3_0.BodyText:setText(arg_3_1)

	local var_3_0 = LAYOUT.GetTextHeightWithWrapping(arg_3_0.BodyText, arg_3_0.BodyText:getText())
	local var_3_1 = arg_3_0.BodyText:GetCurrentAnchorsAndPositions().top

	if arg_3_3 then
		arg_3_0.RedeemButton:SetAlpha(1)
		arg_3_0.RedeemButton:StartGlint()

		local var_3_2 = LAYOUT.GetElementHeight(arg_3_0.RedeemButton)
		local var_3_3 = arg_3_4 and #arg_3_4 > 0 and 10 * _1080p or 0

		arg_3_0.RedeemButton:SetTop(var_3_1 + var_3_0)
		arg_3_0.RedeemButton:SetBottom(var_3_1 + var_3_0 + var_3_2)

		var_3_0 = var_3_0 + var_3_2 + var_3_3
	else
		arg_3_0.RedeemButton:SetAlpha(0)
		arg_3_0.RedeemButton:StopGlint()
	end

	if arg_3_4 and #arg_3_4 > 0 then
		arg_3_0.BodySubText:SetAlpha(1)
		arg_3_0.BodySubText:setText(arg_3_4)

		local var_3_4 = LAYOUT.GetElementHeight(arg_3_0.BodySubText)

		arg_3_0.BodySubText:SetTop(var_3_1 + var_3_0)
		arg_3_0.BodySubText:SetBottom(var_3_1 + var_3_0 + var_3_4)

		var_3_0 = var_3_0 + LAYOUT.GetTextHeightWithWrapping(arg_3_0.BodySubText, arg_3_4)
	else
		arg_3_0.BodySubText:SetAlpha(0)
	end

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

local function var_0_5(arg_5_0, arg_5_1)
	arg_5_0.RedeemButton.RedeemText:setText(arg_5_1)

	local var_5_0 = 25 * _1080p
	local var_5_1 = LAYOUT.GetTextWidth(arg_5_0.RedeemButton.RedeemText)
	local var_5_2 = LAYOUT.GetElementWidth(arg_5_0.BodyText)

	var_5_1 = var_5_2 < var_5_1 and var_5_2 or var_5_1

	arg_5_0.RedeemButton:SetRight(var_5_1 + var_5_0)
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.InitializeDimensions = var_0_1
	arg_6_0.UpdateDetails = var_0_3
	arg_6_0.UpdateTitleBacker = var_0_2
	arg_6_0.SetSpacing = var_0_4
	arg_6_0.UpdateRedeemText = var_0_5
	arg_6_0._curDimensions = nil
	arg_6_0._spacing = 0

	arg_6_0.BodyText:SetMask(arg_6_0.Mask)
	arg_6_0.Mask:SetAlpha(1)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_6_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_6_0, "WZWipSetup")
	end
end

function CRMTextDetails(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 530 * _1080p, 0, 70 * _1080p)

	var_7_0.id = "CRMTextDetails"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Backer"

	var_7_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_7_4:SetAlpha(0.2, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Backer = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIStyledText.new()

	var_7_6.id = "BodyText"

	var_7_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_7_6:setText("", 0)
	var_7_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_6:SetAlignment(LUI.Alignment.Left)
	var_7_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_6:SetShadowRGBFromInt(0, 0)
	var_7_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, _1080p * 525, _1080p * 71, _1080p * 95)
	var_7_0:addElement(var_7_6)

	var_7_0.BodyText = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIStyledText.new()

	var_7_8.id = "HeaderText"

	var_7_8:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_7_8:setText("", 0)
	var_7_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_8:SetWordWrap(false)
	var_7_8:SetAlignment(LUI.Alignment.Left)
	var_7_8:SetShadowMaxDistance(0.2, 0)
	var_7_8:SetShadowRGBFromInt(0, 0)
	var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, _1080p * 525, 0, _1080p * 70)
	var_7_0:addElement(var_7_8)

	var_7_0.HeaderText = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIImage.new()

	var_7_10.id = "Mask"

	var_7_10:SetAlpha(0, 0)
	var_7_10:setImage(RegisterMaterial("stencil_mask"), 0)
	var_7_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * 12, 0, 0)
	var_7_0:addElement(var_7_10)

	var_7_0.Mask = var_7_10

	local var_7_11
	local var_7_12 = MenuBuilder.BuildRegisteredType("PromptButton", {
		controllerIndex = var_7_1
	})

	var_7_12.id = "Prompt"

	var_7_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 5, _1080p * 525, 0, _1080p * 32)
	var_7_0:addElement(var_7_12)

	var_7_0.Prompt = var_7_12

	local var_7_13
	local var_7_14 = LUI.UIStyledText.new()

	var_7_14.id = "BodySubText"

	var_7_14:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_7_14:SetAlpha(0, 0)
	var_7_14:setText("", 0)
	var_7_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_14:SetAlignment(LUI.Alignment.Left)
	var_7_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_14:SetShadowRGBFromInt(0, 0)
	var_7_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 579, _1080p * 130, _1080p * 149)
	var_7_0:addElement(var_7_14)

	var_7_0.BodySubText = var_7_14

	local var_7_15
	local var_7_16 = MenuBuilder.BuildRegisteredType("RedeemButton", {
		controllerIndex = var_7_1
	})

	var_7_16.id = "RedeemButton"

	var_7_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 445, _1080p * 71, _1080p * 120)
	var_7_0:addElement(var_7_16)

	var_7_0.RedeemButton = var_7_16

	local var_7_17
	local var_7_18 = {
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

	var_7_6:RegisterAnimationSequence("DefaultSequence", var_7_18)

	local var_7_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_7_8:RegisterAnimationSequence("DefaultSequence", var_7_19)

	local var_7_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 12
		}
	}

	var_7_10:RegisterAnimationSequence("DefaultSequence", var_7_20)

	local function var_7_21()
		var_7_6:AnimateSequence("DefaultSequence")
		var_7_8:AnimateSequence("DefaultSequence")
		var_7_10:AnimateSequence("DefaultSequence")
	end

	var_7_0._sequences.DefaultSequence = var_7_21

	local var_7_22
	local var_7_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 103
		}
	}

	var_7_6:RegisterAnimationSequence("AR", var_7_23)

	local function var_7_24()
		var_7_6:AnimateSequence("AR")
	end

	var_7_0._sequences.AR = var_7_24

	local var_7_25
	local var_7_26 = {
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

	var_7_4:RegisterAnimationSequence("HideTitle", var_7_26)

	local var_7_27 = {
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

	var_7_6:RegisterAnimationSequence("HideTitle", var_7_27)

	local var_7_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("HideTitle", var_7_28)

	local var_7_29 = {
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

	var_7_12:RegisterAnimationSequence("HideTitle", var_7_29)

	local function var_7_30()
		var_7_4:AnimateSequence("HideTitle")
		var_7_6:AnimateSequence("HideTitle")
		var_7_8:AnimateSequence("HideTitle")
		var_7_12:AnimateSequence("HideTitle")
	end

	var_7_0._sequences.HideTitle = var_7_30

	local var_7_31
	local var_7_32 = {
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

	var_7_4:RegisterAnimationSequence("HideTitleAR", var_7_32)

	local var_7_33 = {
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

	var_7_6:RegisterAnimationSequence("HideTitleAR", var_7_33)

	local var_7_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("HideTitleAR", var_7_34)

	local var_7_35 = {
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

	var_7_12:RegisterAnimationSequence("HideTitleAR", var_7_35)

	local function var_7_36()
		var_7_4:AnimateSequence("HideTitleAR")
		var_7_6:AnimateSequence("HideTitleAR")
		var_7_8:AnimateSequence("HideTitleAR")
		var_7_12:AnimateSequence("HideTitleAR")
	end

	var_7_0._sequences.HideTitleAR = var_7_36

	local var_7_37
	local var_7_38 = {
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

	var_7_6:RegisterAnimationSequence("BLM", var_7_38)

	local var_7_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BLM.Title
		}
	}

	var_7_8:RegisterAnimationSequence("BLM", var_7_39)

	local var_7_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1088
		}
	}

	var_7_10:RegisterAnimationSequence("BLM", var_7_40)

	local function var_7_41()
		var_7_6:AnimateSequence("BLM")
		var_7_8:AnimateSequence("BLM")
		var_7_10:AnimateSequence("BLM")
	end

	var_7_0._sequences.BLM = var_7_41

	local var_7_42
	local var_7_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 525
		}
	}

	var_7_6:RegisterAnimationSequence("WZWipSetup", var_7_43)

	local var_7_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2_Highlight
		}
	}

	var_7_8:RegisterAnimationSequence("WZWipSetup", var_7_44)

	local var_7_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 12
		}
	}

	var_7_10:RegisterAnimationSequence("WZWipSetup", var_7_45)

	local function var_7_46()
		var_7_6:AnimateSequence("WZWipSetup")
		var_7_8:AnimateSequence("WZWipSetup")
		var_7_10:AnimateSequence("WZWipSetup")
	end

	var_7_0._sequences.WZWipSetup = var_7_46

	var_0_6(var_7_0, var_7_1, arg_7_1)
	ACTIONS.AnimateSequence(var_7_0, "DefaultSequence")

	return var_7_0
end

MenuBuilder.registerType("CRMTextDetails", CRMTextDetails)
LockTable(_M)
