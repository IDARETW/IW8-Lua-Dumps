module(..., package.seeall)

function SeasonalEventXPCard(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 200 * _1080p)

	var_1_0.id = "SeasonalEventXPCard"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Backing"

	var_1_4:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_1_4:SetAlpha(0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Backing = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "XPIcon"

	var_1_6:SetAlpha(0.7, 0)
	var_1_6:setImage(RegisterMaterial("icon_xp_token"), 0)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -37, _1080p * 37, _1080p * -41, _1080p * 30)
	var_1_0:addElement(var_1_6)

	var_1_0.XPIcon = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "XPAmount"

	var_1_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZTitle, 0)
	var_1_8:setText("", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_8:SetAlignment(LUI.Alignment.Center)
	var_1_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -75, _1080p * 75, _1080p * 33, _1080p * 69)
	var_1_0:addElement(var_1_8)

	var_1_0.XPAmount = var_1_8

	local var_1_9
	local var_1_10 = {
		borderThicknessLeft = _1080p * 3,
		borderThicknessRight = _1080p * 3,
		borderThicknessTop = _1080p * 3,
		borderThicknessBottom = _1080p * 3
	}
	local var_1_11 = LUI.UIBorder.new(var_1_10)

	var_1_11.id = "XPFrame"

	var_1_11:SetRGBFromTable(SWATCHES.CH2.OperatorFilterEnabled, 0)
	var_1_11:SetAlpha(0, 0)
	var_1_11:SetBorderThicknessLeft(_1080p * 3, 0)
	var_1_11:SetBorderThicknessRight(_1080p * 3, 0)
	var_1_11:SetBorderThicknessTop(_1080p * 3, 0)
	var_1_11:SetBorderThicknessBottom(_1080p * 3, 0)
	var_1_0:addElement(var_1_11)

	var_1_0.XPFrame = var_1_11

	return var_1_0
end

MenuBuilder.registerType("SeasonalEventXPCard", SeasonalEventXPCard)
LockTable(_M)
