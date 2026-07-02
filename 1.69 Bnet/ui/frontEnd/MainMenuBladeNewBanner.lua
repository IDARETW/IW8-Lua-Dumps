module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	function arg_1_0.SetMessage(arg_2_0, arg_2_1)
		arg_2_0.Label:setText(arg_2_1)
	end
end

function MainMenuBladeNewBanner(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 60 * _1080p)

	var_3_0.id = "MainMenuBladeNewBanner"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Backer"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.newIndicatorDark, 0)
	var_3_4:SetPixelGridEnabled(true)
	var_3_4:SetPixelGridContrast(0.5, 0)
	var_3_4:SetPixelGridBlockWidth(2, 0)
	var_3_4:SetPixelGridBlockHeight(2, 0)
	var_3_4:SetPixelGridGutterWidth(1, 0)
	var_3_4:SetPixelGridGutterHeight(1, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Backer = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Highlight"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.newIndicator, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 12, 0, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.Highlight = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "Label"

	var_3_8:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.StreakRegular.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_8:SetStartupDelay(1000)
	var_3_8:SetLineHoldTime(400)
	var_3_8:SetAnimMoveTime(150)
	var_3_8:SetAnimMoveSpeed(50)
	var_3_8:SetEndDelay(1000)
	var_3_8:SetCrossfadeTime(400)
	var_3_8:SetFadeInTime(300)
	var_3_8:SetFadeOutTime(300)
	var_3_8:SetMaxVisibleLines(1)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 43, _1080p * -9, _1080p * 12, _1080p * -12)
	var_3_0:addElement(var_3_8)

	var_3_0.Label = var_3_8

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("MainMenuBladeNewBanner", MainMenuBladeNewBanner)
LockTable(_M)
