module(..., package.seeall)

function GameBattlesCountdownElement(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 80 * _1080p, 0, 60 * _1080p)

	var_1_0.id = "GameBattlesCountdownElement"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIText.new()

	var_1_4.id = "Title"

	var_1_4:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_4:SetAlignment(LUI.Alignment.Center)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 80, 0, _1080p * 22)
	var_1_0:addElement(var_1_4)

	var_1_0.Title = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "BackgroundHighlight"

	var_1_6:SetRGBFromTable(SWATCHES.AAR.AARprogressFill, 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, _1080p * 75, _1080p * 25, _1080p * 55)
	var_1_0:addElement(var_1_6)

	var_1_0.BackgroundHighlight = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "Value"

	var_1_8:SetRGBFromInt(0, 0)
	var_1_8:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_8:SetAlignment(LUI.Alignment.Center)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 5, _1080p * -5, _1080p * 23, _1080p * 55)
	var_1_0:addElement(var_1_8)

	var_1_0.Value = var_1_8

	return var_1_0
end

MenuBuilder.registerType("GameBattlesCountdownElement", GameBattlesCountdownElement)
LockTable(_M)
