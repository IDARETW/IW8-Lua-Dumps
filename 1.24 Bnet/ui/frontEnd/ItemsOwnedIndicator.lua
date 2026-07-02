module(..., package.seeall)

function ItemsOwnedIndicator(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 20 * _1080p, 0, 20 * _1080p)

	var_1_0.id = "ItemsOwnedIndicator"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromTable(SWATCHES.Arena.NewPrimary, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIStyledText.new()

	var_1_6.id = "Text"

	var_1_6:SetRGBFromInt(0, 0)
	var_1_6:setText("0", 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_6:SetAlignment(LUI.Alignment.Center)
	var_1_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -10, _1080p * 8)
	var_1_0:addElement(var_1_6)

	var_1_0.Text = var_1_6

	return var_1_0
end

MenuBuilder.registerType("ItemsOwnedIndicator", ItemsOwnedIndicator)
LockTable(_M)
