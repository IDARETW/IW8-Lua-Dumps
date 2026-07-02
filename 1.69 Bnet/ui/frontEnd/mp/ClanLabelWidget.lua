module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Label:setText(Engine.CBBHFCGDIC(arg_1_1))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetLabel = var_0_0
end

function ClanLabelWidget(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 152 * _1080p, 0, 28 * _1080p)

	var_3_0.id = "ClanLabelWidget"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "Label"

	var_3_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, _1080p * -2, _1080p * 5, _1080p * -5)
	var_3_0:addElement(var_3_6)

	var_3_0.Label = var_3_6

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ClanLabelWidget", ClanLabelWidget)
LockTable(_M)
