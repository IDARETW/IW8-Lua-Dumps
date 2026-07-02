module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.DescriptionLabel:setText(arg_1_1)

	local var_1_0, var_1_1, var_1_2, var_1_3 = arg_1_0.DescriptionLabel:getLocalRect()

	if not arg_1_0.DescriptionLabel._initialTop then
		arg_1_0.DescriptionLabel._initialTop = var_1_1
		arg_1_0.DescriptionLabel._initialBottom = var_1_3
	end

	local var_1_4 = 2

	if arg_1_2 then
		arg_1_0.DescriptionLabel:SetTop(0)
		arg_1_0.DescriptionLabel:SetBottom(var_1_3 - var_1_1)

		var_1_4 = 1.5
	else
		arg_1_0.DescriptionLabel:SetTop(arg_1_0.DescriptionLabel._initialTop)
		arg_1_0.DescriptionLabel:SetBottom(arg_1_0.DescriptionLabel._initialBottom)

		var_1_4 = 2
	end

	local var_1_5 = arg_1_0.DescriptionLabel._initialTop * var_1_4
	local var_1_6 = arg_1_0.DescriptionLabel._initialTop * var_1_4
	local var_1_7, var_1_8 = arg_1_0.DescriptionLabel:getElementTextDims()
	local var_1_9, var_1_10, var_1_11, var_1_12 = arg_1_0:getLocalRect()

	arg_1_0:SetBottom(var_1_10 + var_1_8 + var_1_6, 0)
end

function PostLoadFunc(arg_2_0, arg_2_1)
	arg_2_0.SetDescriptionAndUpdateHeight = var_0_0
end

function MouseCursorTooltipDescription(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 350 * _1080p, 0, 104 * _1080p)

	var_3_0.id = "MouseCursorTooltipDescription"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Backing"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_3_4:SetAlpha(0.9, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Backing = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "DescriptionLabel"

	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 340, _1080p * 10, _1080p * 30)
	var_3_0:addElement(var_3_6)

	var_3_0.DescriptionLabel = var_3_6

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("MouseCursorTooltipDescription", MouseCursorTooltipDescription)
LockTable(_M)
