module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:SetForceDefaultFocus(true)
end

function LootItemButtons(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalList.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 454 * _1080p, 0, 90 * _1080p)

	var_2_0.id = "LootItemButtons"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:SetSpacing(10 * _1080p)

	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("MenuButton", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "EquipButton"

	var_2_4:SetAlpha(0, 0)
	var_2_4:SetButtonDisabled(true)
	var_2_4.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/EQUIP"), 0)
	var_2_4.Text:SetAlignment(LUI.Alignment.Center)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 40)
	var_2_0:addElement(var_2_4)

	var_2_0.EquipButton = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("MenuButton", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "PreviewButton"

	var_2_6:SetAlpha(0, 0)
	var_2_6:SetButtonDisabled(true)
	var_2_6.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/PREVIEW"), 0)
	var_2_6.Text:SetAlignment(LUI.Alignment.Center)
	var_2_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 50, _1080p * 90)
	var_2_0:addElement(var_2_6)

	var_2_0.PreviewButton = var_2_6

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("LootItemButtons", LootItemButtons)
LockTable(_M)
