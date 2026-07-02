module(..., package.seeall)

function PrestigeTierReward(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 60 * _1080p, 0, 20 * _1080p)

	var_1_0.id = "PrestigeTierReward"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("IndicatorArrow", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "IndicatorArrow"

	var_1_4:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_1_4:SetZRotation(180, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 40, _1080p * -8, _1080p * 6)
	var_1_0:addElement(var_1_4)

	var_1_0.IndicatorArrow = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Backer"

	var_1_6:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 60, 0, _1080p * 20)
	var_1_0:addElement(var_1_6)

	var_1_0.Backer = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "Title"

	var_1_8:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_1_8:SetScale(-0.25, 0)
	var_1_8:setText("", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_8:SetAlignment(LUI.Alignment.Center)
	var_1_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -37, _1080p * 37, _1080p * -9, _1080p * 9)
	var_1_0:addElement(var_1_8)

	var_1_0.Title = var_1_8

	local var_1_9
	local var_1_10 = MenuBuilder.BuildRegisteredType("PrestigeLock", {
		controllerIndex = var_1_1
	})

	var_1_10.id = "Lock"

	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 40, _1080p * 80, _1080p * -2, _1080p * 38)
	var_1_0:addElement(var_1_10)

	var_1_0.Lock = var_1_10

	return var_1_0
end

MenuBuilder.registerType("PrestigeTierReward", PrestigeTierReward)
LockTable(_M)
