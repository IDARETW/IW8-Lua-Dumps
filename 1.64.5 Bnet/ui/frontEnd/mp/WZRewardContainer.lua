module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_1)
	arg_1_0.Title:setText(arg_1_2 and arg_1_2.useUppercase and ToUpperCase(arg_1_1) or arg_1_1)

	if arg_1_2 and arg_1_2.useRegularFont then
		arg_1_0.Title:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetTitle = var_0_0
end

function WZRewardContainer(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 360 * _1080p, 0, 360 * _1080p)

	var_3_0.id = "WZRewardContainer"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZContainerBackground, 0)
	var_3_4:SetAlpha(0.7, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "TitleBackground"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_6:SetAlpha(0.6, 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 4, _1080p * -4, _1080p * 19, _1080p * 47)
	var_3_0:addElement(var_3_6)

	var_3_0.TitleBackground = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "Title"

	var_3_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 14, _1080p * -14, _1080p * 19, _1080p * 43)
	var_3_0:addElement(var_3_8)

	var_3_0.Title = var_3_8

	local var_3_9
	local var_3_10 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_3_11 = LUI.UIBorder.new(var_3_10)

	var_3_11.id = "BorderBacker"

	var_3_11:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_3_11:SetAlpha(0.5, 0)
	var_3_0:addElement(var_3_11)

	var_3_0.BorderBacker = var_3_11

	local var_3_12
	local var_3_13 = LUI.UIImage.new()

	var_3_13.id = "HighlightBottom"

	var_3_13:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_3_13:SetAlpha(0, 0)
	var_3_13:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_3_13:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_3_0:addElement(var_3_13)

	var_3_0.HighlightBottom = var_3_13

	local var_3_14
	local var_3_15 = LUI.UIImage.new()

	var_3_15.id = "HighlightTop"

	var_3_15:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_3_15:SetAlpha(0, 0)
	var_3_15:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_3_15:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_3_0:addElement(var_3_15)

	var_3_0.HighlightTop = var_3_15

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WZRewardContainer", WZRewardContainer)
LockTable(_M)
