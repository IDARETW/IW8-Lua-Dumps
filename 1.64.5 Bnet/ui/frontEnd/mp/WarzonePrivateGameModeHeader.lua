module(..., package.seeall)

function WarzonePrivateGameModeHeader(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 526 * _1080p, 0, 40 * _1080p)

	var_1_0.id = "WarzonePrivateGameModeHeader"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIStyledText.new()

	var_1_4.id = "Title"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_4:setText("", 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_4:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_1_4:SetStartupDelay(2000)
	var_1_4:SetLineHoldTime(400)
	var_1_4:SetAnimMoveTime(2000)
	var_1_4:SetAnimMoveSpeed(150)
	var_1_4:SetEndDelay(2000)
	var_1_4:SetCrossfadeTime(250)
	var_1_4:SetFadeInTime(300)
	var_1_4:SetFadeOutTime(300)
	var_1_4:SetMaxVisibleLines(3)
	var_1_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -34, _1080p * -10)
	var_1_0:addElement(var_1_4)

	var_1_0.Title = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Line"

	var_1_6:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_6:SetAlpha(0.6, 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -6, _1080p * -5)
	var_1_0:addElement(var_1_6)

	var_1_0.Line = var_1_6

	return var_1_0
end

MenuBuilder.registerType("WarzonePrivateGameModeHeader", WarzonePrivateGameModeHeader)
LockTable(_M)
