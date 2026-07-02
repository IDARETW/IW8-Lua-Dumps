module(..., package.seeall)

function NumberOfItems(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p)

	var_1_0.id = "NumberOfItems"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "BG"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAlpha(0.6, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.BG = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("ArrowDown", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "ArrowDown"

	var_1_6:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 6, _1080p * 38, _1080p * -64, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.ArrowDown = var_1_6

	local var_1_7
	local var_1_8 = MenuBuilder.BuildRegisteredType("ArrowUp", {
		controllerIndex = var_1_1
	})

	var_1_8.id = "ArrowUp"

	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 38, 0, _1080p * 64)
	var_1_0:addElement(var_1_8)

	var_1_0.ArrowUp = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIText.new()

	var_1_10.id = "Count"

	var_1_10:setText("x1", 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Center)
	var_1_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 43, _1080p * 128, _1080p * -15, _1080p * 15)
	var_1_0:addElement(var_1_10)

	var_1_0.Count = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIText.new()

	var_1_12.id = "Navigation"

	var_1_12:setText(Engine.CBBHFCGDIC("LUA_MENU/PAD_DPAD_VERTICAL"), 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_12:SetAlignment(LUI.Alignment.Left)
	var_1_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 137, _1080p * 222, _1080p * -15, _1080p * 15)
	var_1_0:addElement(var_1_12)

	var_1_0.Navigation = var_1_12

	ACTIONS.AnimateSequenceByElement(var_1_0, {
		elementPath = "self.ArrowDown",
		sequenceName = "Blocked",
		elementName = "ArrowDown"
	})

	return var_1_0
end

MenuBuilder.registerType("NumberOfItems", NumberOfItems)
LockTable(_M)
