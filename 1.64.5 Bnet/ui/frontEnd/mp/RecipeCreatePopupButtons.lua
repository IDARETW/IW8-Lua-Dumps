module(..., package.seeall)

function RecipeCreatePopupButtons(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIVerticalList.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 384 * _1080p, 0, 277 * _1080p)

	var_1_0.id = "RecipeCreatePopupButtons"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0

	var_1_0:SetSpacing(10 * _1080p)

	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("RecipeNameInputButton", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "NameInputButton"

	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 384, 0, _1080p * 45)
	var_1_0:addElement(var_1_4)

	var_1_0.NameInputButton = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("RecipeNameInputButton", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "DescriptionInputButton"

	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 384, _1080p * 55, _1080p * 100)
	var_1_0:addElement(var_1_6)

	var_1_0.DescriptionInputButton = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Spacer"

	var_1_8:SetAlpha(0, 0)
	var_1_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -64, _1080p * 64, _1080p * 110, _1080p * 150)
	var_1_0:addElement(var_1_8)

	var_1_0.Spacer = var_1_8

	local var_1_9
	local var_1_10 = MenuBuilder.BuildRegisteredType("MenuButton", {
		controllerIndex = var_1_1
	})

	var_1_10.id = "SaveButton"

	var_1_10.Text:setText(Engine.CBBHFCGDIC("MENU/SAVE"), 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 384, _1080p * 160, _1080p * 200)
	var_1_0:addElement(var_1_10)

	var_1_0.SaveButton = var_1_10

	local var_1_11
	local var_1_12 = MenuBuilder.BuildRegisteredType("MenuButton", {
		controllerIndex = var_1_1
	})

	var_1_12.id = "CancelButton"

	var_1_12.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CANCEL"), 0)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 384, _1080p * 210, _1080p * 250)
	var_1_0:addElement(var_1_12)

	var_1_0.CancelButton = var_1_12

	return var_1_0
end

MenuBuilder.registerType("RecipeCreatePopupButtons", RecipeCreatePopupButtons)
LockTable(_M)
