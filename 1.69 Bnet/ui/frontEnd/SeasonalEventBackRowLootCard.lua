module(..., package.seeall)

function SeasonalEventBackRowLootCard(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 200 * _1080p)

	var_1_0.id = "SeasonalEventBackRowLootCard"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -164)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("WZBattlePassItemSnipeBanner", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "SnipeBanner"

	var_1_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 26)
	var_1_0:addElement(var_1_6)

	var_1_0.SnipeBanner = var_1_6

	local var_1_7
	local var_1_8 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_1_9 = LUI.UIBorder.new(var_1_8)

	var_1_9.id = "Border"

	var_1_9:SetRGBFromTable(SWATCHES.itemRarity.quality3, 0)
	var_1_9:SetBorderThicknessLeft(_1080p * 2, 0)
	var_1_9:SetBorderThicknessRight(_1080p * 2, 0)
	var_1_9:SetBorderThicknessTop(_1080p * 2, 0)
	var_1_9:SetBorderThicknessBottom(_1080p * 2, 0)
	var_1_0:addElement(var_1_9)

	var_1_0.Border = var_1_9

	return var_1_0
end

MenuBuilder.registerType("SeasonalEventBackRowLootCard", SeasonalEventBackRowLootCard)
LockTable(_M)
