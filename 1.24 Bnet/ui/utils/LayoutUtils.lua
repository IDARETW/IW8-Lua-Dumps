LAYOUT = LAYOUT or {}

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

function LAYOUT.GetTextWidth(arg_3_0, arg_3_1)
	assert(arg_3_0)

	local var_3_0 = arg_3_0:getText()
	local var_3_1, var_3_2, var_3_3, var_3_4 = arg_3_0:getLocalRect()
	local var_3_5 = math.abs(var_3_4 - var_3_2)
	local var_3_6 = arg_3_0:GetCurrentFont()
	local var_3_7, var_3_8, var_3_9, var_3_10 = GetTextDimensions(var_3_0, var_3_6, var_3_5, nil, nil, nil, arg_3_1)

	return var_3_9 - var_3_7
end

function LAYOUT.MoveLabelToSideOfOtherLabel(arg_4_0)
	assert(arg_4_0.spacing)
	assert(arg_4_0.labelToStay)
	assert(arg_4_0.labelToMove)
	assert(arg_4_0.sideToMoveTo)
	assert(arg_4_0.sideToMoveTo == "right" or arg_4_0.sideToMoveTo == "left")

	local var_4_0, var_4_1, var_4_2, var_4_3 = arg_4_0.labelToStay:getLocalRect()
	local var_4_4 = LAYOUT.GetTextWidth(arg_4_0.labelToStay)
	local var_4_5 = LAYOUT.GetTextWidth(arg_4_0.labelToMove)
	local var_4_6

	if arg_4_0.sideToMoveTo == "right" then
		var_4_6 = var_4_0 + var_4_4 + arg_4_0.spacing
	elseif arg_4_0.sideToMoveTo == "left" then
		var_4_6 = var_4_2 - var_4_4 - arg_4_0.spacing - var_4_5
	end

	assert(var_4_6)

	local var_4_7 = var_4_6 + var_4_5

	assert(var_4_7)
	arg_4_0.labelToMove:SetLeft(var_4_6)
	arg_4_0.labelToMove:SetRight(var_4_7)
end

LAYOUT.DEFAULT_SAFE_ZONE_PERCENT = 0.98

function LAYOUT.GetHorizontalOutOfScreenOffset(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = 0
	local var_5_1 = arg_5_0:getWidth()
	local var_5_2 = arg_5_2 or LAYOUT.DEFAULT_SAFE_ZONE_PERCENT
	local var_5_3 = math.floor(var_5_1 * var_5_2)

	if var_5_3 < arg_5_1 then
		var_5_0 = math.abs(arg_5_1 - var_5_3)
	end

	return var_5_0
end

function LAYOUT.GetVerticalOutOfScreenOffset(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = 0
	local var_6_1 = arg_6_0:getHeight()
	local var_6_2 = arg_6_2 or LAYOUT.DEFAULT_SAFE_ZONE_PERCENT
	local var_6_3 = math.floor(var_6_1 * var_6_2)

	if var_6_3 < arg_6_1 then
		var_6_0 = math.abs(arg_6_1 - var_6_3)
	end

	return var_6_0
end

function LAYOUT.GetElementWidth(arg_7_0)
	local var_7_0, var_7_1, var_7_2, var_7_3 = arg_7_0:getLocalRect()

	return (math.abs(var_7_2 - var_7_0))
end

function LAYOUT.GetElementHeight(arg_8_0)
	local var_8_0, var_8_1, var_8_2, var_8_3 = arg_8_0:getLocalRect()

	return (math.abs(var_8_3 - var_8_1))
end

function LAYOUT.AddAspectRatioFadeFrame(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	LUI.AspectRatioFadeFrameLayer.OpenAspectRatioFadeFrame(arg_9_0, arg_9_2, arg_9_3)
end

function LAYOUT.AdjustElementToFadeFrameLeft(arg_10_0)
	local var_10_0 = math.floor(1280 * (1 - LUI.AspectRatioFadeFrameLayer.DEFAULT_FADESCREEN_PERCENTAGE))

	arg_10_0:SetLeft(var_10_0)
end

function LAYOUT.AdjustElementToFadeFrameRight(arg_11_0)
	local var_11_0 = math.floor(1280 * (1 + LUI.AspectRatioFadeFrameLayer.DEFAULT_FADESCREEN_PERCENTAGE))

	arg_11_0:SetRight(var_11_0)
end

function LAYOUT.FadeOutAspectRatioFadeFrame(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = LUI.AspectRatioFadeFrameLayer:GetInstance(arg_12_0)

	if var_12_0 and var_12_0.aspectRatioFade then
		var_12_0.aspectRatioFade:FadeOut(arg_12_1, arg_12_2)
	end
end

function LAYOUT.FadeInAspectRatioFadeFrame(arg_13_0, arg_13_1)
	local var_13_0 = LUI.AspectRatioFadeFrameLayer:GetInstance(arg_13_0)

	if var_13_0 and var_13_0.aspectRatioFade then
		var_13_0.aspectRatioFade:FadeIn(arg_13_1)
	end
end

function LAYOUT.GetTextHeightWithWrapping(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0:GetCurrentFont()
	local var_14_1, var_14_2, var_14_3, var_14_4 = arg_14_0:getLocalRect()
	local var_14_5 = math.abs(var_14_4 - var_14_2)
	local var_14_6 = var_14_3 - var_14_1
	local var_14_7, var_14_8, var_14_9, var_14_10 = GetTextDimensions(arg_14_1, var_14_0, var_14_5, var_14_6)

	return var_14_8 - var_14_10
end

function LAYOUT.ResetElementAnchorAndPosition(arg_15_0)
	local var_15_0, var_15_1, var_15_2, var_15_3 = arg_15_0:getLocalRect()
	local var_15_4, var_15_5, var_15_6, var_15_7 = arg_15_0:GetAnchorData()

	arg_15_0:SetAnchorsAndPosition(var_15_4, var_15_6, var_15_5, var_15_7, var_15_0, var_15_2, var_15_1, var_15_3)
end

function LAYOUT.SetElementAnchorAndPositionFromElementToElement(arg_16_0)
	LUI.AssertDescriptive({
		expectedType = "table",
		element = arg_16_0
	})
	LUI.AssertDescriptive({
		element = arg_16_0.fromElement
	})
	LUI.AssertDescriptive({
		element = arg_16_0.toElement
	})

	local var_16_0, var_16_1, var_16_2, var_16_3 = arg_16_0.fromElement:getLocalRect()
	local var_16_4, var_16_5, var_16_6, var_16_7 = arg_16_0.fromElement:GetAnchorData()

	arg_16_0.toElement:SetAnchorsAndPosition(var_16_4, var_16_6, var_16_5, var_16_7, var_16_0, var_16_2, var_16_1, var_16_3)
end

function LAYOUT.ScaleWidgetToTextWidthLeftAligned(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = LAYOUT.GetTextWidth(arg_17_1)
	local var_17_1 = arg_17_0:GetCurrentAnchorsAndPositions()
	local var_17_2 = 0

	if arg_17_2 then
		var_17_2 = arg_17_1:GetCurrentAnchorsAndPositions().left * 2
	end

	arg_17_0:SetLeft(var_17_1.left)
	arg_17_0:SetRight(var_17_1.left + var_17_0 + var_17_2)
end

function LAYOUT.ScaleWidgetToTextWidthRightAligned(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = LAYOUT.GetTextWidth(arg_18_1)
	local var_18_1 = arg_18_0:GetCurrentAnchorsAndPositions()
	local var_18_2 = 0

	if arg_18_2 then
		var_18_2 = arg_18_1:GetCurrentAnchorsAndPositions().right * 2
	end

	arg_18_0:SetRight(var_18_1.right)
	arg_18_0:SetLeft(var_18_1.right - var_18_0 - var_18_2)
end

function LAYOUT.GetHorizontalListChildrenWidth(arg_19_0)
	local var_19_0 = arg_19_0:getFirstChild()
	local var_19_1 = 0
	local var_19_2 = 0
	local var_19_3 = 0
	local var_19_4 = arg_19_0:GetSpacing()

	while var_19_0 do
		local var_19_5, var_19_6, var_19_7, var_19_8 = var_19_0:getLocalRect()

		var_19_1 = var_19_1 + (var_19_7 - var_19_5)
		var_19_0 = var_19_0:getNextSibling()
		var_19_3 = var_19_3 + 1
	end

	if var_19_3 > 0 then
		var_19_2 = var_19_4 * (var_19_3 - 1)
	end

	return var_19_1 + var_19_2
end

function LAYOUT.ScaleWidgetToHorizontalListContentCenterAligned(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = LAYOUT.GetHorizontalListChildrenWidth(arg_20_1)
	local var_20_1 = arg_20_0:GetCurrentAnchorsAndPositions()
	local var_20_2 = (var_20_1.right + var_20_1.left) / 2
	local var_20_3 = var_20_0 + (arg_20_2 or 0)

	arg_20_0:SetLeft(var_20_2 - var_20_3 / 2)
	arg_20_0:SetRight(var_20_2 + var_20_3 / 2)
end

function LAYOUT.ScaleWidgetToHorizontalListContentLeftAligned(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = LAYOUT.GetHorizontalListChildrenWidth(arg_21_1)
	local var_21_1 = arg_21_0:GetCurrentAnchorsAndPositions()
	local var_21_2 = var_21_0 + (arg_21_2 or 0)

	arg_21_0:SetLeft(var_21_1.left)
	arg_21_0:SetRight(var_21_1.left + var_21_2)
end

function LAYOUT.ScaleWidgetToHorizontalListContentRightAligned(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = LAYOUT.GetHorizontalListChildrenWidth(arg_22_1)
	local var_22_1 = arg_22_0:GetCurrentAnchorsAndPositions()
	local var_22_2 = var_22_0 + (arg_22_2 or 0)

	arg_22_0:SetRight(var_22_1.right)
	arg_22_0:SetLeft(var_22_1.right - var_22_2)
end
