LAYOUT = LAYOUT or {}
LAYOUT.DEFAULT_MENU_DARKENER_OPACITY = 0.7
LAYOUT.DEFAULT_POPUP_DARKENER_OPACITY = 0.8
LAYOUT.DEFAULT_WORLD_BLUR_AMT = 1
LAYOUT.DEFAULT_SAFE_ZONE_PERCENT = 0.98
LAYOUT.WIDE_SCREEN_LAYOUT_RATIO = 1.78

function LAYOUT.SetTextBoxSize(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5, arg_1_6, arg_1_7)
	local var_1_0 = arg_1_2 or ""
	local var_1_1, var_1_2, var_1_3, var_1_4 = arg_1_0:getLocalRect()
	local var_1_5 = math.abs(var_1_4 - var_1_2)
	local var_1_6 = arg_1_0:GetCurrentFont()
	local var_1_7, var_1_8, var_1_9, var_1_10 = GetTextDimensions(var_1_0, var_1_6, var_1_5)
	local var_1_11 = var_1_9 - var_1_7

	if arg_1_4 ~= nil then
		local var_1_12 = var_1_5 / 2 + arg_1_4
		local var_1_13 = -1 * (var_1_5 / 2) - arg_1_4

		arg_1_1:SetTop(var_1_12)
		arg_1_1:SetBottom(var_1_13)
	end

	if arg_1_5 == LUI.Alignment.Right then
		local var_1_14 = var_1_11 * -1 - arg_1_3

		arg_1_0:SetLeft(var_1_14)
		arg_1_1:SetLeft(var_1_14, arg_1_6, arg_1_7)
	elseif arg_1_5 == LUI.Alignment.Center then
		local var_1_15 = var_1_11 / 2 + arg_1_3
		local var_1_16 = -1 * (var_1_11 / 2) - arg_1_3

		arg_1_0:SetRight(var_1_15)
		arg_1_0:SetLeft(var_1_16)
		arg_1_1:SetRight(var_1_15, arg_1_6, arg_1_7)
		arg_1_1:SetLeft(var_1_16, arg_1_6, arg_1_7)
	elseif arg_1_5 == LUI.Alignment.Left then
		local var_1_17 = var_1_1 + var_1_11 + arg_1_3

		arg_1_0:SetRight(var_1_17)
		arg_1_1:SetRight(var_1_17, arg_1_6, arg_1_7)
	end

	arg_1_0:setText(var_1_0)

	local var_1_18, var_1_19, var_1_20, var_1_21 = arg_1_1:getLocalRect()

	return var_1_20 - var_1_18
end

function LAYOUT.SetTextBoxSizeWithButton(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5, arg_2_6, arg_2_7)
	local var_2_0 = arg_2_2 or ""
	local var_2_1, var_2_2, var_2_3, var_2_4 = arg_2_0:getLocalRect()
	local var_2_5 = math.abs(var_2_4 - var_2_2)
	local var_2_6 = arg_2_0:GetCurrentFont()
	local var_2_7, var_2_8, var_2_9, var_2_10 = GetTextDimensions(var_2_0, var_2_6, var_2_5)
	local var_2_11 = var_2_9 - var_2_7
	local var_2_12 = 0
	local var_2_13 = 0

	if arg_2_2 == "" then
		var_2_13 = 6
	end

	if arg_2_7 ~= nil then
		local var_2_14 = arg_2_7.KeyString:GetCurrentFont()
		local var_2_15 = arg_2_7.KeyString:getText() or ""
		local var_2_16, var_2_17, var_2_18, var_2_19 = arg_2_7.KeyString:getLocalRect()
		local var_2_20 = math.abs(var_2_19 - var_2_17)
		local var_2_21, var_2_22, var_2_23, var_2_24 = GetTextDimensions(var_2_15, var_2_14, var_2_20)

		var_2_12 = var_2_23 - var_2_21
	end

	if arg_2_4 ~= nil then
		local var_2_25 = var_2_5 / 2 + arg_2_4
		local var_2_26 = -1 * (var_2_5 / 2) - arg_2_4

		arg_2_1:SetTop(var_2_25)
		arg_2_1:SetBottom(var_2_26)
	end

	local var_2_27 = var_2_1 - arg_2_3 - var_2_12 - var_2_13
	local var_2_28 = var_2_1 + var_2_11 + arg_2_3 - var_2_13 * 2

	arg_2_0:SetRight(var_2_28)
	arg_2_1:SetLeft(var_2_27, arg_2_5, arg_2_6)
	arg_2_1:SetRight(var_2_28, arg_2_5, arg_2_6)
	arg_2_0:setText(var_2_0)
end

function LAYOUT.GetTrackingOffset(arg_3_0, arg_3_1)
	assert(arg_3_0)

	arg_3_1 = arg_3_1 ~= nil and arg_3_1 or 0

	return (#arg_3_0:getText() - 1) * arg_3_1
end

function LAYOUT.GetTextWidth(arg_4_0, arg_4_1)
	assert(arg_4_0)

	local var_4_0 = arg_4_0:getText()
	local var_4_1, var_4_2, var_4_3, var_4_4 = arg_4_0:getLocalRect()
	local var_4_5 = math.abs(var_4_4 - var_4_2)
	local var_4_6 = arg_4_0:GetCurrentFont()
	local var_4_7, var_4_8, var_4_9, var_4_10 = GetTextDimensions(var_4_0, var_4_6, var_4_5, nil, nil, nil, arg_4_1)

	return var_4_9 - var_4_7
end

function LAYOUT.GetRawTextWidth(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = LAYOUT.GetTextWidth(arg_5_0, arg_5_2)
	local var_5_1 = LAYOUT.GetTrackingOffset(arg_5_0, arg_5_1)

	return var_5_0 / _1080p + var_5_1
end

function LAYOUT.ToggleFontOnFocusEvent(arg_6_0, arg_6_1)
	if not arg_6_1 or type(arg_6_1) ~= "table" then
		assert(false, "You must provide a table of options")
	end

	local var_6_0 = arg_6_1.inFocusFont or FONTS.MainBold.File
	local var_6_1 = arg_6_1.outFocusFont or FONTS.MainRegular.File

	arg_6_0:SetFont(FONTS.GetFont(arg_6_1.isFocused and var_6_0 or var_6_1))
end

function LAYOUT.MoveLabelToSideOfOtherLabel(arg_7_0)
	assert(arg_7_0.spacing)
	assert(arg_7_0.labelToStay)
	assert(arg_7_0.labelToMove)
	assert(arg_7_0.sideToMoveTo)
	assert(arg_7_0.sideToMoveTo == "right" or arg_7_0.sideToMoveTo == "left")

	local var_7_0, var_7_1, var_7_2, var_7_3 = arg_7_0.labelToStay:getLocalRect()
	local var_7_4 = LAYOUT.GetTextWidth(arg_7_0.labelToStay)
	local var_7_5 = LAYOUT.GetTextWidth(arg_7_0.labelToMove)
	local var_7_6

	if arg_7_0.sideToMoveTo == "right" then
		var_7_6 = var_7_0 + var_7_4 + arg_7_0.spacing
	elseif arg_7_0.sideToMoveTo == "left" then
		var_7_6 = var_7_2 - var_7_4 - arg_7_0.spacing - var_7_5
	end

	assert(var_7_6)

	local var_7_7 = var_7_6 + var_7_5

	assert(var_7_7)
	arg_7_0.labelToMove:SetLeft(var_7_6)
	arg_7_0.labelToMove:SetRight(var_7_7)
end

function LAYOUT.GetHorizontalOutOfScreenOffset(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = 0
	local var_8_1 = arg_8_0:getWidth()
	local var_8_2 = arg_8_2 or LAYOUT.DEFAULT_SAFE_ZONE_PERCENT
	local var_8_3 = math.floor(var_8_1 * var_8_2)

	if var_8_3 < arg_8_1 then
		var_8_0 = math.abs(arg_8_1 - var_8_3)
	end

	return var_8_0
end

function LAYOUT.GetVerticalOutOfScreenOffset(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = 0
	local var_9_1 = arg_9_0:getHeight()
	local var_9_2 = arg_9_2 or LAYOUT.DEFAULT_SAFE_ZONE_PERCENT
	local var_9_3 = math.floor(var_9_1 * var_9_2)

	if var_9_3 < arg_9_1 then
		var_9_0 = math.abs(arg_9_1 - var_9_3)
	end

	return var_9_0
end

function LAYOUT.GetElementWidth(arg_10_0)
	local var_10_0, var_10_1, var_10_2, var_10_3 = arg_10_0:getLocalRect()

	return (math.abs(var_10_2 - var_10_0))
end

function LAYOUT.GetElementHeight(arg_11_0)
	local var_11_0, var_11_1, var_11_2, var_11_3 = arg_11_0:getLocalRect()

	return (math.abs(var_11_3 - var_11_1))
end

function LAYOUT.SetWarzoneStringHighlightOverride(arg_12_0, arg_12_1)
	if not CONDITIONS.IsMagmaGameMode() then
		return arg_12_0
	end

	return string.gsub(arg_12_0, "%^5", arg_12_1 and arg_12_1.overrideHighlightToken and arg_12_1.overrideHighlightToken or "^$")
end

function LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_13_0, arg_13_1, arg_13_2)
	assert(arg_13_2 and type(arg_13_2) == "table", "You must specify a table of options. Otherwise, use the method 'LAYOUT.AddAspectRatioFadeFrame '.")

	if arg_13_2.addScreenDarkener then
		local var_13_0 = arg_13_2.darkenerOpacity and arg_13_2.darkenerOpacity or LAYOUT.DEFAULT_MENU_DARKENER_OPACITY

		assert(type(var_13_0) == "number", "The darkenerOpacity property must be of type 'number'.")

		local var_13_1 = LUI.UIImage.new()

		var_13_1.id = "Darkener"

		var_13_1:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground)
		var_13_1:SetAlpha(var_13_0)
		var_13_1:setPriority(-1)
		arg_13_0:addElement(var_13_1)
		ACTIONS.ScaleFullscreen(var_13_1)
	end

	if arg_13_2.addWorldBlur then
		local var_13_2 = arg_13_2.worldBlurAmount and arg_13_2.worldBlurAmount or LAYOUT.DEFAULT_WORLD_BLUR_AMT

		assert(type(var_13_2) == "number", "The worldBlurAmount property must be of type 'number'.")

		local var_13_3 = {
			worldBlur = var_13_2,
			controllerIndex = arg_13_1
		}
		local var_13_4 = MenuBuilder.BuildRegisteredType("WorldBlur", var_13_3)

		var_13_4.id = "WorldBlur"

		var_13_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
		arg_13_0:addElement(var_13_4)
	end

	LUI.AspectRatioFadeFrameLayer.OpenAspectRatioFadeFrame(arg_13_0, arg_13_2.child, arg_13_2.customScreenPercent)
end

function LAYOUT.AddAspectRatioFadeFrame(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	LUI.AspectRatioFadeFrameLayer.OpenAspectRatioFadeFrame(arg_14_0, arg_14_2, arg_14_3)
end

function LAYOUT.AdjustElementToFadeFrameLeft(arg_15_0)
	local var_15_0 = math.floor(1280 * (1 - LUI.AspectRatioFadeFrameLayer.DEFAULT_FADESCREEN_PERCENTAGE))

	arg_15_0:SetLeft(var_15_0)
end

function LAYOUT.AdjustElementToFadeFrameRight(arg_16_0)
	local var_16_0 = math.floor(1280 * (1 + LUI.AspectRatioFadeFrameLayer.DEFAULT_FADESCREEN_PERCENTAGE))

	arg_16_0:SetRight(var_16_0)
end

function LAYOUT.FadeOutAspectRatioFadeFrame(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = LUI.AspectRatioFadeFrameLayer:GetInstance(arg_17_0)

	if var_17_0 and var_17_0.aspectRatioFade then
		var_17_0.aspectRatioFade:FadeOut(arg_17_1, arg_17_2)
	end
end

function LAYOUT.FadeInAspectRatioFadeFrame(arg_18_0, arg_18_1)
	local var_18_0 = LUI.AspectRatioFadeFrameLayer:GetInstance(arg_18_0)

	if var_18_0 and var_18_0.aspectRatioFade then
		var_18_0.aspectRatioFade:FadeIn(arg_18_1)
	end
end

function LAYOUT.SetupScalingBackgroundVignette(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_1 and arg_19_1.customVignette or arg_19_0.Vignette

	assert(var_19_0, "This menu must have a widget with the name 'Vignette' or specifiy a  custom Vignette id in UI Editor. This widget contains the artwork for drawing the vignette.")

	local function var_19_1()
		local var_20_0 = arg_19_0:getRootParent():getWidth()
		local var_20_1, var_20_2, var_20_3, var_20_4 = var_19_0:getLocalRect()
		local var_20_5 = arg_19_0:getRootParent():getHeight() - var_20_2
		local var_20_6 = _1080p * 1920
		local var_20_7 = _1080p * 1080
		local var_20_8 = var_20_0 - var_20_6
		local var_20_9 = var_20_5 - var_20_7

		var_19_0:SetTop(var_20_2)

		if var_20_8 > 0 then
			local var_20_10 = var_20_8 / 2

			var_19_0:SetLeft(-var_20_10)
			var_19_0:SetRight(var_20_0 - var_20_10)
		else
			var_19_0:SetLeft(0)
			var_19_0:SetRight(var_20_0)
		end

		if var_20_9 > 0 then
			var_19_0:SetBottom(var_20_2 + var_20_5)
		else
			var_19_0:SetBottom(var_20_4)
		end
	end

	if arg_19_1 and arg_19_1.customAnimState then
		if not var_19_0._sequences or not var_19_0._sequences[arg_19_1.customAnimState] then
			assert(false, "The vignette asset you specified, " .. var_19_0.id .. ", does not contain the animation sequence " .. arg_19_1.customAnimState)
		end

		ACTIONS.AnimateSequence(var_19_0, arg_19_1.customAnimState)
	end

	if not CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(var_19_0, "MW")
	end

	arg_19_0:addAndCallEventHandler("onVideoChange", var_19_1)
end

function LAYOUT.SetupCommonScaleableLayoutElements(arg_21_0, arg_21_1)
	if arg_21_0.Vignette then
		ACTIONS.ScaleFullscreen(arg_21_0.Vignette)
	end

	if arg_21_0.Darken then
		ACTIONS.ScaleFullscreen(arg_21_0.Darken)
	end

	if arg_21_0.TabBacker then
		ACTIONS.ScaleStretchAnchorFullscreen(arg_21_0.TabBacker)
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_21_0, arg_21_1)
end

function LAYOUT.GetTextHeightWithWrapping(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0:GetCurrentFont()
	local var_22_1, var_22_2, var_22_3, var_22_4 = arg_22_0:getLocalRect()
	local var_22_5 = math.abs(var_22_4 - var_22_2)
	local var_22_6 = var_22_3 - var_22_1
	local var_22_7, var_22_8, var_22_9, var_22_10 = GetTextDimensions(arg_22_1, var_22_0, var_22_5, var_22_6)

	return var_22_8 - var_22_10
end

function LAYOUT.ResetElementAnchorAndPosition(arg_23_0)
	local var_23_0, var_23_1, var_23_2, var_23_3 = arg_23_0:getLocalRect()
	local var_23_4, var_23_5, var_23_6, var_23_7 = arg_23_0:GetAnchorData()

	arg_23_0:SetAnchorsAndPosition(var_23_4, var_23_6, var_23_5, var_23_7, var_23_0, var_23_2, var_23_1, var_23_3)
end

function LAYOUT.SetElementAnchorAndPositionFromElementToElement(arg_24_0)
	LUI.AssertDescriptive({
		expectedType = "table",
		element = arg_24_0
	})
	LUI.AssertDescriptive({
		element = arg_24_0.fromElement
	})
	LUI.AssertDescriptive({
		element = arg_24_0.toElement
	})

	local var_24_0, var_24_1, var_24_2, var_24_3 = arg_24_0.fromElement:getLocalRect()
	local var_24_4, var_24_5, var_24_6, var_24_7 = arg_24_0.fromElement:GetAnchorData()

	arg_24_0.toElement:SetAnchorsAndPosition(var_24_4, var_24_6, var_24_5, var_24_7, var_24_0, var_24_2, var_24_1, var_24_3)
end

function LAYOUT.ScaleWidgetToTextWidthLeftAligned(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = LAYOUT.GetTextWidth(arg_25_1)
	local var_25_1 = arg_25_0:GetCurrentAnchorsAndPositions()
	local var_25_2 = 0

	if arg_25_2 then
		var_25_2 = arg_25_1:GetCurrentAnchorsAndPositions().left * 2
	end

	arg_25_0:SetLeft(var_25_1.left)
	arg_25_0:SetRight(var_25_1.left + var_25_0 + var_25_2)
end

function LAYOUT.ScaleWidgetToTextWidthRightAligned(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = LAYOUT.GetTextWidth(arg_26_1)
	local var_26_1 = arg_26_0:GetCurrentAnchorsAndPositions()
	local var_26_2 = 0

	if arg_26_2 then
		var_26_2 = arg_26_1:GetCurrentAnchorsAndPositions().right * 2
	end

	arg_26_0:SetRight(var_26_1.right)
	arg_26_0:SetLeft(var_26_1.right - var_26_0 - var_26_2)
end

function LAYOUT.GetHorizontalListChildrenWidth(arg_27_0)
	local var_27_0 = arg_27_0:getFirstChild()
	local var_27_1 = 0
	local var_27_2 = 0
	local var_27_3 = 0
	local var_27_4 = arg_27_0:GetSpacing()

	while var_27_0 do
		local var_27_5, var_27_6, var_27_7, var_27_8 = var_27_0:getLocalRect()

		var_27_1 = var_27_1 + (var_27_7 - var_27_5)
		var_27_0 = var_27_0:getNextSibling()
		var_27_3 = var_27_3 + 1
	end

	if var_27_3 > 0 then
		var_27_2 = var_27_4 * (var_27_3 - 1)
	end

	return var_27_1 + var_27_2
end

function LAYOUT.ScaleWidgetToHorizontalListContentCenterAligned(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = LAYOUT.GetHorizontalListChildrenWidth(arg_28_1)
	local var_28_1 = arg_28_0:GetCurrentAnchorsAndPositions()
	local var_28_2 = (var_28_1.right + var_28_1.left) / 2
	local var_28_3 = var_28_0 + (arg_28_2 or 0)

	arg_28_0:SetLeft(var_28_2 - var_28_3 / 2)
	arg_28_0:SetRight(var_28_2 + var_28_3 / 2)
end

function LAYOUT.ScaleWidgetToHorizontalListContentLeftAligned(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = LAYOUT.GetHorizontalListChildrenWidth(arg_29_1)
	local var_29_1 = arg_29_0:GetCurrentAnchorsAndPositions()
	local var_29_2 = var_29_0 + (arg_29_2 or 0)

	arg_29_0:SetLeft(var_29_1.left)
	arg_29_0:SetRight(var_29_1.left + var_29_2)
end

function LAYOUT.ScaleWidgetToHorizontalListContentRightAligned(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = LAYOUT.GetHorizontalListChildrenWidth(arg_30_1)
	local var_30_1 = arg_30_0:GetCurrentAnchorsAndPositions()
	local var_30_2 = var_30_0 + (arg_30_2 or 0)

	arg_30_0:SetRight(var_30_1.right)
	arg_30_0:SetLeft(var_30_1.right - var_30_2)
end

function LAYOUT.IsElementAnchoredRight(arg_31_0)
	local var_31_0, var_31_1, var_31_2, var_31_3 = arg_31_0:GetAnchorData()

	if var_31_0 and var_31_2 then
		return var_31_0 == 1 and var_31_2 == 0
	else
		return false
	end
end

function LAYOUT.IsElementAnchoredLeft(arg_32_0)
	local var_32_0, var_32_1, var_32_2, var_32_3 = arg_32_0:GetAnchorData()

	if var_32_0 and var_32_2 then
		return var_32_0 == 0 and var_32_2 == 1
	else
		return false
	end
end

function LAYOUT.IsElementAnchoredMiddle(arg_33_0)
	local var_33_0, var_33_1, var_33_2, var_33_3 = arg_33_0:GetAnchorData()

	if var_33_0 and var_33_2 then
		return var_33_0 == 0.5 and var_33_2 == 0.5
	else
		return false
	end
end

function LAYOUT.UpdateWidgetHorizPosToGridFocusedChild(arg_34_0, arg_34_1, arg_34_2)
	assert(arg_34_0)
	assert(arg_34_1)
	assert(arg_34_2)

	local var_34_0, var_34_1, var_34_2, var_34_3 = arg_34_1:getLocalRect()
	local var_34_4, var_34_5, var_34_6, var_34_7 = arg_34_2:getLocalRect()
	local var_34_8 = var_34_6 - var_34_4
	local var_34_9 = LAYOUT.GetElementWidth(arg_34_0)
	local var_34_10 = var_34_0 + var_34_4 + var_34_8 / 2 - var_34_9 / 2

	arg_34_0:SetLeft(var_34_10)
	arg_34_0:SetRight(var_34_10 + var_34_9)
end

function LAYOUT.SizeTextBackingSizeToText(arg_35_0, arg_35_1)
	assert(arg_35_1, "You must specify both a textfield and an image assert as options.textfield and options.textfieldBacking")
	assert(arg_35_1.textfield and arg_35_1.textfield.setText, "You must specify a valid textfield")
	assert(arg_35_1.textfieldBackingImage, "You must specify a valid image element.")

	local var_35_0 = 0

	if arg_35_1.padding then
		assert(type(arg_35_1.padding) == "number", "You must specify a valid number for the padding.")

		var_35_0 = _1080p * arg_35_1.padding
	end

	local var_35_1 = LAYOUT.GetTextWidth(arg_35_1.textfield)

	if var_35_1 > 0 then
		local var_35_2 = arg_35_1.textfield:GetCurrentAnchorsAndPositions()
		local var_35_3 = arg_35_1.textfieldBackingImage:GetCurrentAnchorsAndPositions()

		if LAYOUT.IsElementAnchoredRight(arg_35_1.textfieldBackingImage) or arg_35_1.forceAlignRight then
			if arg_35_1.useEvenPadding then
				arg_35_1.textfieldBackingImage:SetRight(var_35_2.right + var_35_0)
			end

			arg_35_1.textfieldBackingImage:SetLeft(var_35_2.right - (var_35_1 + var_35_0))
		elseif LAYOUT.IsElementAnchoredLeft(arg_35_1.textfieldBackingImage) then
			if arg_35_1.useEvenPadding then
				arg_35_1.textfieldBackingImage:SetLeft(var_35_2.left - var_35_0)
			end

			arg_35_1.textfieldBackingImage:SetRight(var_35_2.left + (var_35_1 + var_35_0))
		elseif LAYOUT.IsElementAnchoredMiddle(arg_35_1.textfieldBackingImage) then
			arg_35_1.textfieldBackingImage:SetLeft(var_35_2.left - var_35_0)
			arg_35_1.textfieldBackingImage:SetRight(var_35_2.left + var_35_1 + var_35_0)
		end
	end
end

function LAYOUT.IsWideScreen()
	if not Engine.CGABICJHAI() then
		return false
	end

	return Engine.CEGEEHGGBA() > LAYOUT.WIDE_SCREEN_LAYOUT_RATIO
end

function LAYOUT.MoveImageNextToImage(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0, var_37_1, var_37_2, var_37_3 = arg_37_0:getLocalRect()
	local var_37_4 = LAYOUT.GetElementWidth(arg_37_1)
	local var_37_5 = arg_37_2 and arg_37_2.padding and arg_37_2.padding or 0
	local var_37_6
	local var_37_7

	if arg_37_2 and arg_37_2.toLeft then
		var_37_7 = var_37_0 - var_37_5
		var_37_6 = var_37_7 - var_37_4
	else
		var_37_6 = var_37_2 + var_37_5
		var_37_7 = var_37_6 + var_37_4
	end

	arg_37_1:SetLeft(var_37_6)
	arg_37_1:SetRight(var_37_7)
end
