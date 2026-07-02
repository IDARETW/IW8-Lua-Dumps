module(..., package.seeall)

function PlayerCard(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 370 * _1080p, 0, 100 * _1080p)

	var_1_0.id = "PlayerCard"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("GenericEInkBackground", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "NameBacker"

	var_1_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 49, 0, 0, _1080p * 24)
	var_1_0:addElement(var_1_4)

	var_1_0.NameBacker = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("GenericEInkBackground", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "RankBacker"

	var_1_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 50, 0, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.RankBacker = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Image"

	var_1_8:setImage(RegisterMaterial("ui_playercard_001"), 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 370, _1080p * 24, _1080p * 100)
	var_1_0:addElement(var_1_8)

	var_1_0.Image = var_1_8

	local var_1_9
	local var_1_10 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_11 = LUI.UIBorder.new(var_1_10)

	var_1_11.id = "Border"

	var_1_11:SetRGBFromInt(0, 0)
	var_1_11:SetAlpha(0.6, 0)
	var_1_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 49, _1080p * 370, _1080p * 23, _1080p * 100)
	var_1_0:addElement(var_1_11)

	var_1_0.Border = var_1_11

	local var_1_12
	local var_1_13 = LUI.UIText.new()

	var_1_13.id = "Name"

	var_1_13:SetRGBFromInt(0, 0)
	var_1_13:SetAlpha(0.6, 0)
	var_1_13:setText("", 0)
	var_1_13:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_13:SetAlignment(LUI.Alignment.Left)
	var_1_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 58, _1080p * 364, _1080p * 3, _1080p * 21)
	var_1_0:addElement(var_1_13)

	var_1_0.Name = var_1_13

	local var_1_14
	local var_1_15 = LUI.UIText.new()

	var_1_15.id = "RankNumber"

	var_1_15:SetRGBFromInt(0, 0)
	var_1_15:SetAlpha(0.6, 0)
	var_1_15:setText("33", 0)
	var_1_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_15:SetAlignment(LUI.Alignment.Center)
	var_1_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 46, _1080p * 25, _1080p * 45)
	var_1_0:addElement(var_1_15)

	var_1_0.RankNumber = var_1_15

	local var_1_16
	local var_1_17 = LUI.UIImage.new()

	var_1_17.id = "RankIcon"

	var_1_17:SetRGBFromInt(0, 0)
	var_1_17:SetAlpha(0.6, 0)
	var_1_17:setImage(RegisterMaterial("rank_icon_23"), 0)
	var_1_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 42, _1080p * 45, _1080p * 79)
	var_1_0:addElement(var_1_17)

	var_1_0.RankIcon = var_1_17

	return var_1_0
end

MenuBuilder.registerType("PlayerCard", PlayerCard)
LockTable(_M)
