module(..., package.seeall)

function GameStatBar(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 300 * _1080p)

	var_1_0.id = "GameStatBar"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Image"

	var_1_4:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_1_4:SetAlpha(0.6, 0)
	var_1_4:SetPixelGridEnabled(true)
	var_1_4:SetPixelGridContrast(0.5, 0)
	var_1_4:SetPixelGridBlockWidth(2, 0)
	var_1_4:SetPixelGridBlockHeight(2, 0)
	var_1_4:SetPixelGridGutterWidth(1, 0)
	var_1_4:SetPixelGridGutterHeight(1, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Image = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Backer"

	var_1_6:SetRGBFromTable(SWATCHES.AAR.StatsHeader, 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 36)
	var_1_0:addElement(var_1_6)

	var_1_0.Backer = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "Label"

	var_1_8:SetRGBFromTable(SWATCHES.AAR.KillsColor, 0)
	var_1_8:setText("0.0", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_8:SetAlignment(LUI.Alignment.Center)
	var_1_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 3, _1080p * 33)
	var_1_0:addElement(var_1_8)

	var_1_0.Label = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIText.new()

	var_1_10.id = "MatchLabel"

	var_1_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_10:setText("", 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetWordWrap(false)
	var_1_10:SetAlignment(LUI.Alignment.Center)
	var_1_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * 5, _1080p * 33)
	var_1_0:addElement(var_1_10)

	var_1_0.MatchLabel = var_1_10

	return var_1_0
end

MenuBuilder.registerType("GameStatBar", GameStatBar)
LockTable(_M)
