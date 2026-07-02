module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.TitleLabel)
	assert(arg_1_0.TitleBacking)
	arg_1_0.TitleLabel:setText(Engine.CBEAHDFCFC(arg_1_1))

	local var_1_0 = 20
	local var_1_1 = arg_1_2 or var_1_0
	local var_1_2, var_1_3 = arg_1_0.TitleLabel:getElementTextDims()

	arg_1_0.TitleBacking:SetRight(var_1_2 + var_1_1, 0)
end

function PostLoadFunc(arg_2_0, arg_2_1)
	arg_2_0.SetTitleAndScaleBacking = var_0_0
end

function MouseCursorTooltipTitle(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 350 * _1080p, 0, 60 * _1080p)

	var_3_0.id = "MouseCursorTooltipTitle"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "HeaderBacking"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.attachShade, 0)
	var_3_4:SetAlpha(0.9, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.HeaderBacking = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "TitleDetail"

	var_3_6:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -3, 0, _1080p * 15, _1080p * 45)
	var_3_0:addElement(var_3_6)

	var_3_0.TitleDetail = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "TitleBacking"

	var_3_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 182, _1080p * 15, _1080p * 45)
	var_3_0:addElement(var_3_8)

	var_3_0.TitleBacking = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "TitleLabel"

	var_3_10:SetRGBFromTable(SWATCHES.CAC.attachShade, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetTracking(1 * _1080p, 0)
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_3_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 16, _1080p * 334, _1080p * -9, _1080p * 9)
	var_3_0:addElement(var_3_10)

	var_3_0.TitleLabel = var_3_10

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("MouseCursorTooltipTitle", MouseCursorTooltipTitle)
LockTable(_M)
