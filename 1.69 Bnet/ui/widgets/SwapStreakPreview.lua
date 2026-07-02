module(..., package.seeall)

function SwapStreakPreview(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 240 * _1080p)

	var_1_0.id = "SwapStreakPreview"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "SwapDetailsBacker"

	var_1_4:SetAlpha(0.5, 0)
	var_1_4.Background:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, 0, _1080p * 240)
	var_1_0:addElement(var_1_4)

	var_1_0.SwapDetailsBacker = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIStyledText.new()

	var_1_6.id = "Name"

	var_1_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_6:setText("", 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_6:SetWordWrap(false)
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_6:SetStartupDelay(1000)
	var_1_6:SetLineHoldTime(400)
	var_1_6:SetAnimMoveTime(1000)
	var_1_6:SetAnimMoveSpeed(150)
	var_1_6:SetEndDelay(1000)
	var_1_6:SetCrossfadeTime(1000)
	var_1_6:SetFadeInTime(300)
	var_1_6:SetFadeOutTime(300)
	var_1_6:SetMaxVisibleLines(1)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -155, _1080p * 177, _1080p * 48, _1080p * 78)
	var_1_0:addElement(var_1_6)

	var_1_0.Name = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIStyledText.new()

	var_1_8.id = "Label"

	var_1_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_8:setText("Streak to Equip", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetWordWrap(false)
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_8:SetStartupDelay(1000)
	var_1_8:SetLineHoldTime(400)
	var_1_8:SetAnimMoveTime(1000)
	var_1_8:SetAnimMoveSpeed(150)
	var_1_8:SetEndDelay(1000)
	var_1_8:SetCrossfadeTime(1000)
	var_1_8:SetFadeInTime(300)
	var_1_8:SetFadeOutTime(300)
	var_1_8:SetMaxVisibleLines(1)
	var_1_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -155, _1080p * 177, _1080p * 23, _1080p * 47)
	var_1_0:addElement(var_1_8)

	var_1_0.Label = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIStyledText.new()

	var_1_10.id = "Desc"

	var_1_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_10:setText("Streak to Equip", 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Left)
	var_1_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -155, _1080p * 177, _1080p * 124, _1080p * 146)
	var_1_0:addElement(var_1_10)

	var_1_0.Desc = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIStyledText.new()

	var_1_12.id = "Kills"

	var_1_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_12:setText("Streak to Equip", 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_12:SetAlignment(LUI.Alignment.Left)
	var_1_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -155, _1080p * 177, _1080p * 83, _1080p * 107)
	var_1_0:addElement(var_1_12)

	var_1_0.Kills = var_1_12

	return var_1_0
end

MenuBuilder.registerType("SwapStreakPreview", SwapStreakPreview)
LockTable(_M)
