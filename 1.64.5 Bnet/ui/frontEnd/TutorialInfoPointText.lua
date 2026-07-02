module(..., package.seeall)

function TutorialInfoPointText(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 50 * _1080p)

	var_1_0.id = "TutorialInfoPointText"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIStyledText.new()

	var_1_4.id = "Text"

	var_1_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_1_4:setText("03: LONDON, UK", 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_4:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_4:SetDecodeLetterLength(24)
	var_1_4:SetDecodeMaxRandChars(12)
	var_1_4:SetDecodeUpdatesPerLetter(4)
	var_1_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -25, _1080p * 25)
	var_1_0:addElement(var_1_4)

	var_1_0.Text = var_1_4

	return var_1_0
end

MenuBuilder.registerType("TutorialInfoPointText", TutorialInfoPointText)
LockTable(_M)
