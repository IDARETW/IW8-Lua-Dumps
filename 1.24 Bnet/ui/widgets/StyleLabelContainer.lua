module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = arg_1_0:GetCurrentAnchorsAndPositions()

	arg_1_0.StyledLabel:SetAnchorsAndPosition(0, 1, 0, 1, 0, var_1_0.left, 0, var_1_0.bottom)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.ResizeLabelToParent = var_0_0

	arg_2_0.ResizeLabelToParent()
end

function StyleLabelContainer(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 462 * _1080p, 0, 18 * _1080p)

	var_3_0.id = "StyleLabelContainer"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIStyledText.new()

	var_3_4.id = "StyledLabel"

	var_3_4:setText("", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 462, 0, _1080p * 18)
	var_3_0:addElement(var_3_4)

	var_3_0.StyledLabel = var_3_4

	return var_3_0
end

MenuBuilder.registerType("StyleLabelContainer", StyleLabelContainer)
LockTable(_M)
